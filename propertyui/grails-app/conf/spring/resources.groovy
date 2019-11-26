import CustomAuthenticationProvider

// Place your Spring DSL code here
beans = {
    customAuthenticationProvider(CustomAuthenticationProvider) {
        springSecurityService = ref('springSecurityService')
    }
}
