grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/oauth/authorize',           access: "isFullyAuthenticated() and (request.getMethod().equals('GET') or request.getMethod().equals('POST'))"],
        [pattern: '/oauth/token',               access: "isFullyAuthenticated() and request.getMethod().equals('POST')"],
        [pattern: '/',                          access: 'permitAll'],
        [pattern: '/**',                        access: 'permitAll']
]
