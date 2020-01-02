package propertyui

import grails.transaction.Transactional

@Transactional(readOnly = true)
class HomeController {

    def securityService

    @Transactional
    def index() {
        if (securityService.isAdmin() || securityService.isITSupport()) {
            redirect(controller: 'adminUser')
            return
        }

        redirect(controller: 'user', action: 'index')
    }
}
