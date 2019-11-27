package propertyui

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional
import org.apache.commons.lang.RandomStringUtils
import org.apache.commons.lang.math.RandomUtils
import org.springframework.beans.factory.annotation.Value
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import propertyui.model.ForgotPassword
import propertyui.model.PasswordReset

import javax.security.auth.login.CredentialExpiredException

@Transactional(readOnly = true)
class LoginController extends grails.plugin.springsecurity.LoginController{

    @Value('${application.mail.from.resetPassword.name}')
    private String mailFromResetPasswordName

    @Value('${application.mail.from.resetPassword.email}')
    private String mailFromResetPasswordEmail

    def checkEmailAddress() {
        if (request.xhr) {
            Boolean res = true
            String email = params?.email
            User user = User.findByEmail(email)
            if (params?.id == 'registration' && user) {
                res = false
            } else if (params?.id == 'forgot' && !user) {
                res = true
            }
            render res
        }
    }

    def auth() {

        def conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

        String user = session['SPRING_SECURITY_LAST_USERNAME']
        session['SPRING_SECURITY_LAST_USERNAME'] = ''

        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'auth', model: [
                user: user,
                postUrl: postUrl,
                rememberMeParameter: conf.rememberMe.parameter,
                usernameParameter: conf.apf.usernameParameter,
                passwordParameter: conf.apf.passwordParameter,
                gspLayout: conf.gsp.layoutAuth]
    }

    @Override
    def authfail() {
        String msg = ''
//        String email = session.getAttribute(SpringSecurityUtils.SPRING_SECURITY_LAST_USERNAME_KEY)
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = message(code: 'springSecurity.errors.login.expired')
            } else if (exception instanceof  CredentialExpiredException) {
                msg = message(code: 'springSecurity.errors.login.passwordExpired')
            } else if (exception instanceof DisabledException) {
                msg = message(code: 'springSecurity.errors.login.disabled')
            } else if (exception instanceof LockedException) {
                msg = message(code: 'springSecurity.errors.login.locked')
            } else {
                msg = message(code: 'public.wrong.email.password.label')
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', param: params
        }
    }

    @Transactional
    def forgotPassword() {
        [ forgotPassword: new ForgotPassword()]
    }

    @Transactional
    def sendResetLink(ForgotPassword forgotPassword) {

        forgotPassword.validate()
        if (forgotPassword.hasErrors()) {
            transactionStatus.setRollbackOnly()
            flash.error = message(code: "public.forgotPassword.change.failed", default: "Email reset password tidak dikirimkan.")
            respond forgotPassword.errors, view: 'forgotPassword'
            return
        }

        try {
            User user = User.findByEmail(forgotPassword.email)
            String token = RandomStringUtils.random(64, true, true)
            user.resetToken = token
            user.save()

            String resetLink = createLink(absolute: true, controller: 'login', action: 'newPassword', id: token)
            sendMail {
                to user.email
                from mailFromResetPasswordEmail
                subject mailFromResetPasswordName
                html g.render(template: '/templates/email/resetLinkSent', model: [
                        user: user?.getFullName(),
                        resetLink: resetLink
                ])

            }

        } catch (Exception e) {
            transactionStatus.setRollbackOnly()
            log.error(e?.message, e)

            flash.error = message(code: "public.forgotPassword.change.failed", default: "Email reset password tidak dikirimkan.")
            respond forgotPassword.errors, view: 'forgotPassword'
            return
        }

        flash.email = forgotPassword.email
        resetLinkSent()
    }

    def newPassword(String id) {
        def user = User.findByResetToken(id)
        if (!user) {
            flash.error = message(code: 'property.newPassword.token.invalid', default: 'Reset password link is invalid.')
            render(view: 'newPassword', model: [
                    invalidToken: Boolean.TRUE,
                    passwordReset: new PasswordReset()])
            return
        }

        render(view: 'newPassword')
    }

    @Transactional
    def resetPassword(PasswordReset passwordReset) {
        User user = User.createCriteria().get {
            and {
                eq("resetToken", params?.id)
                ne("resetToken", "")
                isNotNull("resetToken")
            }
            maxResults(1)
        }

        if (!user) {
            flash.error = message(code: 'property.newPassword.token.invalid', default: 'Reset password link is invalid.')
            render(view: 'newPassword')
            return
        }

        try {
            user.password = passwordReset.password
            user.resetToken = null
            user.save()
            request.logout()
        } catch (Exception e) {
            transactionStatus.setRollbackOnly()
            log.error(e?.message, e)

            flash.error = message(code: 'property.newPassword.change.failed', default: 'Your password has not been changed.')
            respond passwordReset.errors, view: "newPassword"
            return
        }

        flash.message = 'Reset password berhasil<br> Silahkan login'
        passwordChange()
    }

    protected passwordChange() {
        render(view: 'auth')
    }

    protected resetLinkSent() {
        render(view: 'forgotPassword')
    }
}
