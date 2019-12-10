package propertyui

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.apache.commons.lang.RandomStringUtils
import org.springframework.beans.factory.annotation.Value

import javax.servlet.http.HttpServletResponse

import static org.springframework.http.HttpStatus.NOT_FOUND

@Secured('isFullyAuthenticated()')
@Transactional(readOnly = true)
class UserController {

    @Value('${application.mail.from.confirmation.name}')
    private String mailFromVerifyEmailName

    @Value('${application.mail.from.confirmation.email}')
    private String mailFromVerifyEmail

    @Value('${application.mail.logo}')
    private String mailLogo

    def userService
    def springSecurityService

    @Transactional
    def index() {
        User user = springSecurityService.currentUser
        UserRole userRole = UserRole.findByUser(user)

        [
                user: user,
                userRole: userRole
        ]

    }

    @Transactional
    def resendVerificationLink() {
        ResultData resultData = new ResultData()
        User user = springSecurityService.currentUser

        try {
            String verificationCode = RandomStringUtils.random(64, true, true)
            user.verificationCode = verificationCode
            user.save()
            String verificationUrl = createLink(absolute: true, controller: 'registration', action: 'verifyMail', id: verificationCode)
            String homePageLink = createLink(absolute:  true, controller: 'property', action: 'index')

            sendMail {
                to user?.email
                from mailFromVerifyEmail
                subject mailFromVerifyEmailName
                html g.render(template: '/templates/email/verifyMail', model: [
                        logo: mailLogo,
                        user: user?.getFullName(),
                        homePageLink: homePageLink,
                        verifyEmailLink: verificationUrl
                ])
            }

            resultData.success = true
            resultData.message = "Link verifikasi telah dikirimkan ke ${user?.email}."
        } catch (Exception e) {
            log.error(e?.message)

            resultData.success = false
            resultData.message = e?.message
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST)
        }

        render resultData.getResult() as JSON
    }

    def agentList() {
        render view: '/agent/agent_list', model: [
                agentList: userService.getAgentList()
        ]
    }

    def agentDetails() {
        User user = User.findById(params?.long('id'))
        UserDetails details = UserDetails.findByUser(user)

        if (!details) {
            notFound()
            return
        }

        render view: '/agent/agent_details', model: [
                agentDetails: details
        ]
    }

    def forgotPassword() {

    }

    protected void notFound() {
        render status: NOT_FOUND
    }
}
