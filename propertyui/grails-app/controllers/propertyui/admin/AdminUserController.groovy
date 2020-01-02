package propertyui.admin

import org.springframework.security.access.annotation.Secured

@Secured("@securityService.isITSupport()")
class AdminUserController {

    def index() {


    }
}
