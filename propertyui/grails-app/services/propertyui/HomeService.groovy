package propertyui

import grails.transaction.Transactional

@Transactional
class HomeService {

    List<Property> getPropertyList() {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            maxResults(6)
            order("lastModified", "desc")
        } as List<Property>

        return propertyList
    }

    List<Property> getAllProperty() {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            order("lastModified", "desc")
        } as List<Property>

        return propertyList
    }

}
