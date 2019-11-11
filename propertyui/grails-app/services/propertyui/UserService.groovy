package propertyui

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

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
}
