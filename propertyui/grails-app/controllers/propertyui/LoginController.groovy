package propertyui

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes

import javax.security.auth.login.CredentialExpiredException

@Transactional(readOnly = true)
class LoginController extends grails.plugin.springsecurity.LoginController{

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

    def forgotPassword() {

    }
}
