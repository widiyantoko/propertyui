package propertyui

import grails.transaction.Transactional
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.WebAuthenticationDetails
import org.springframework.security.web.context.HttpSessionSecurityContextRepository
import propertyui.model.UserRegister

import javax.servlet.http.HttpServletRequest

@Transactional(readOnly = true)
class RegistrationController {

    def userService
    def springSecurityService
    AuthenticationManager authenticationManager

    def index() {

        User user = springSecurityService.currentUser
        if (user) {
            redirect(controller: 'property', action: 'index')
            return
        }

        [
                userRegister: new UserRegister()
        ]

    }

    @Transactional
    def registerNewUser(UserRegister userRegister) {
        String password = params?.password

        userRegister.validate()
        if (userRegister.hasErrors()) {
            flash.error = 'Registration is unsuccessful.'
            respond userRegister.errors, view: 'index'
            return
        }

        try {
            User user = new User()
            userService.createNewUser(user, userRegister)

            if (user.hasErrors()) {
                transactionStatus.setRollbackOnly()
                flash.error = 'Registration unsuccessfully'
                respond userRegister.errors, view: 'index'
            }

            autoLogin(user.username, password, request)
        } catch (Exception e) {
            transactionStatus.setRollbackOnly()
            log.error(e?.message, e)

            flash.error = 'Registration unsuccessfully'
            respond userRegister.errors, view: 'index'
            return
        }

        redirect(action: 'index')
    }

    def checkEmailAddress() {
        if (request.xhr) {
            Boolean res = true
            String email = params?.email
            User user = User.findByEmail(email)

            if (params?.id == 'registration' && user) {
                res = false
            } else if (params?.id == 'forgot' && !user) {
                res = false
            }

            render res
        }
    }

    protected autoLogin(String username, String password, HttpServletRequest request) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password)
        token.setDetails(new WebAuthenticationDetails(request))
        Authentication authentication = authenticationManager.authenticate(token)
        SecurityContextHolder.getContext().setAuthentication(authentication)

        request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext())
    }
}
