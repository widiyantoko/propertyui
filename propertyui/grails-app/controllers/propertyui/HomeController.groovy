package propertyui

import grails.transaction.Transactional

class HomeController {

    def index() {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            maxResults(6)
            order("lastModified", "desc")
        }


        [
                propertyList: propertyList
        ]

    }

    def propertyList() {
        render view: "property_list"
    }
}
