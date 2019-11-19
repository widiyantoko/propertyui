package propertyui

import static org.springframework.http.HttpStatus.NOT_FOUND

class UserController {

    def userService

    def index() {

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
