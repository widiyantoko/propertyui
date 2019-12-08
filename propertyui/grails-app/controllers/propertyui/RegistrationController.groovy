package propertyui

import grails.transaction.Transactional
import org.springframework.beans.factory.annotation.Value
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

    @Value('${application.mail.from.confirmation.name}')
    private String mailFromVerifyEmailName

    @Value('${application.mail.from.confirmation.email}')
    private String mailFromVerifyEmail

    @Value('${application.mail.logo}')
    private String mailLogo

    def userService
    def springSecurityService
    AuthenticationManager authenticationManager

    def index() {

        User user = springSecurityService.currentUser
        if (user) {
            redirect(controller: 'user', action: 'index')
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

            try {
                String verifyEmailLink = createLink(absolute: true, controller: 'registration', action: 'verifyMail', id: user?.verificationCode)
                String homePageLink = createLink(absolute:  true, controller: 'property', action: 'index')
                sendMail {
                    to user?.email
                    from mailFromVerifyEmail
                    subject mailFromVerifyEmailName
                    html g.render(template: '/templates/email/verifyMail', model: [
                            logo: mailLogo,
                            user: user?.getFullName(),
                            homePageLink: homePageLink,
                            verifyEmailLink: verifyEmailLink
                    ])
                }

            } catch (Exception ex) {
                log?.error(ex?.message, ex)
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

    @Transactional
    def verifyMail(String id) {
        def user = User.findByVerificationCode(id)

//        int verificationStatus = 0
        if (user) {
            try {
                user.emailVerified = true
                user.save()
//                verificationStatus = 1
            } catch (Exception e) {
                trasactionStatus.setRollbackOnly()
                log.error(e?.message, e)
            }
        }

        render(view: '/templates/email/verifySuccess')
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
