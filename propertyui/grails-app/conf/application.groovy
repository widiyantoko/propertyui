import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.context.request.ServletWebRequest

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'propertyui.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'propertyui.UserRole'
grails.plugin.springsecurity.authority.className = 'propertyui.Role'
grails.plugin.springsecurity.oauthProvider.userApprovalEndpointUrl = "/oauth/confirm"
//grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/home'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/profile'
grails.plugin.springsecurity.logout.afterLogoutUrl = '/login/auth'

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/oauth/authorize',           access: "isFullyAuthenticated() and (request.getMethod().equals('GET') or request.getMethod().equals('POST'))"],
        [pattern: '/oauth/token',               access: "isFullyAuthenticated() and request.getMethod().equals('POST')"],
        [pattern: '/',                          access: 'permitAll'],
        [pattern: '/**',                        access: 'permitAll']
]

grails.plugin.springsecurity.password.algorithm = 'bcrypt'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.apf.storeLastUsername = true

grails.plugin.fields.disableLookupCache = true

grails.plugin.springsecurity.providerNames = ['customAuthenticationProvider','daoAuthenticationProvider', 'anonymousAuthenticationProvider', 'rememberMeAuthenticationProvider']

//grails.plugin.auditLog.actorClosure = { request, session ->
//    // SpringSecurity Core 1.1.2
//    if (!request.getSession(false)) {
//        def apiUser = request.getAttribute(ApiSecurityInterceptor.ATTR_USER, ServletWebRequest.SCOPE_REQUEST)
//        if (apiUser) {
//            return apiUser
//        }
//    }
//
//    if (request.applicationContext.springSecurityService.principal instanceof java.lang.String){
//        return request.applicationContext.springSecurityService.principal
//    }
//
//    def username = request.applicationContext.springSecurityService.principal?.username
//    if (SpringSecurityUtils.isSwitched()){
//        username = SpringSecurityUtils.switchedUserOriginalUsername + ' AS ' + username
//    }
//    return username
//}


