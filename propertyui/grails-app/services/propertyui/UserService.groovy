package propertyui

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.apache.commons.lang.RandomStringUtils
import org.apache.commons.lang.math.RandomUtils
import propertyui.model.UserRegister

@Transactional
class UserService {

    Long countTotalUser() {

        Long result = User.createCriteria().get {
            eq("accountLocked", Boolean.FALSE)
            projections {
                count("id")
            }
        } as Long

        return result
    }

    List <Property> getLastUserReview() {

        List<Property> result = Property.createCriteria().list {
            and {
                isNotNull('userReview')
                'ne'('userReview', '')
            }

            maxResults(3)
            order("reviewLastModified", "desc")

        } as List<Property>

        return result
    }

    List <UserDetails> getAgentList() {

        List<UserDetails> details = UserDetails.createCriteria().list {
            createAlias('user', 'u')
            eq('u.accountLocked', Boolean.FALSE)
            order('u.lastUpdated', 'desc')
            maxResults(10)

        } as List<UserDetails>

        return details
    }

    void createNewUser(User user, UserRegister userRegister, Boolean isAdmin = false) {
        user.username = userRegister.email
//        user.title = userRegister.title
        user.firstName = userRegister.firstName
        user.lastName = userRegister.lastName
        user.email = userRegister.email
        user.password = userRegister.password
        user.accountLocked = Boolean.FALSE
        user.accountExpired = Boolean.FALSE
        user.emailVerified = user?.emailVerified ?: Boolean.FALSE
        user.verificationCode = RandomStringUtils.random(64, true, true)

        user.validate()
        if (user.hasErrors()) {
            return
        }

        user.save()
        Role roleUser = Role.findByAuthority("ROLE_BASIC")
        if (roleUser) {
            new UserRole(role: roleUser, user: user).save()
        }
    }
}
