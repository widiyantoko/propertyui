import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.authentication.BadCredentialsException
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.crypto.bcrypt.BCrypt
import propertyui.User

class CustomAuthenticationProvider implements AuthenticationProvider {

    def springSecurityService

    @Override
    Authentication authenticate(Authentication customAuth) {
       def token = null
        User.withTransaction {
            User user = User.findByUsernameOrEmail(customAuth.principal, customAuth.principal)

            if (user) {
                String sha256Pass = customAuth.credentials.encodeAsSHA256()

                if (BCrypt.checkpw(sha256Pass, user?.password)) {
                    Collection<GrantedAuthority> authorities = user?.authorities?.collect {
                        new SimpleGrantedAuthority(it.authority)
                    }
                    def userDetails = new GrailsUser(user.username, user.password, true, true, true, true, authorities, user.id)

                    token = new UsernamePasswordAuthenticationToken(userDetails, user.password, userDetails.authorities)
                    token.details = customAuth.details

                    user.lastLogin = new Date()
                    user.save()

                    return token
                } else {
                    user.passwordFailed = user.passwordFailed ? user.passwordFailed+ 1 : 1
                    user.save()
                }
            }
        }
        if (token == null) {
            throw new BadCredentialsException("Log in failed - identity could not be verified")
        }
        return token
    }

    @Override
    boolean supports(Class<?> authentication) {
        return true
    }
}
