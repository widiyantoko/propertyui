package propertyui

class UserController {

    def userService

    def index() {

    }

    def agentList() {
        render view: '/agent/agent_list', model: [
                agentList: userService.getAgentList()
        ]
    }
}
