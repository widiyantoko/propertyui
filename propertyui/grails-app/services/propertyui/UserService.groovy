package propertyui

import grails.transaction.Transactional

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
}
