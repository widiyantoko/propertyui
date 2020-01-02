package propertyui

import grails.transaction.Transactional
import utils.SecurityUtils

@Transactional
class SecurityService {

    def springSecurityService

    Boolean isAdmin() {
        def authorities = getAuthorities()
        if (!authorities.isEmpty()) {
            return authorities?.contains(SecurityUtils.ROLE_ADMIN)
        }

        return Boolean.FALSE
    }

    Boolean isITSupport() {
        def authorities = getAuthorities()
        if (!authorities.isEmpty()) {
            return !SecurityUtils.ADMIN_ROLES.disjoint(authorities)
        }

        return Boolean.FALSE
    }

    private List<String> getAuthorities() {
        return springSecurityService.getPrincipal()?.getAuthorities()?.collect {it.getAuthority()}
    }
}
