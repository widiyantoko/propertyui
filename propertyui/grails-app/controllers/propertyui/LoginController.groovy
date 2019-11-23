package propertyui

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional
import org.apache.commons.lang.RandomStringUtils
import org.apache.commons.lang.math.RandomUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import propertyui.model.ForgotPassword

import javax.security.auth.login.CredentialExpiredException

@Transactional(readOnly = true)
class LoginController extends grails.plugin.springsecurity.LoginController{

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
                msg = message(code: 'springSecurity.errors.login.fail')
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
            flash.error = message(code: "public.forgotPassword.change.failed", default: "Reset password email has not been sent.")
            respond forgotPassword.errors, view: 'forgotPassword'
            return
        }

        try {
            User user = User.findByEmail(forgotPassword.email)
            String token = RandomStringUtils.random(64, true, true)
            user.resetToken = token
            user.save()

        } catch (Exception e) {
            transactionStatus.setRollbackOnly()
            log.error(e?.message, e)

            flash.error = message(code: "public.forgotPassword.change.failed", default: "Reset password email has not been sent.")
            respond forgotPassword.errors, view: 'forgotPassword'
            return
        }

        flash.email = forgotPassword.email

    }
}
