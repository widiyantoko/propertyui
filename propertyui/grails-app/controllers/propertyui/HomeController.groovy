package propertyui

import Enums.PropertyFeature
import Enums.PropertyStatus
import Enums.PropertyType
import grails.transaction.Transactional

class HomeController {

    def homeService

    def index() {
        List<Property> propertyList = homeService.getPropertyList()

        [
                propertyList: propertyList
        ]

    }

    def propertyList() {
        List<Property> propertyList = homeService.getAllProperty()

        render view: "property_list", model: [
                propertyList: propertyList
        ]
    }

    def propertyDetails() {
        Property property = Property.findById(params?.long('id'))

        render view: "property_details", model: [
            property: property
        ]
    }

    def saveData() {
        User user = User.findById(1)
        Date date =  new Date()
        Property property = new Property(
                address: "Jl Bonerate",
                buildingAge: 2,
                city: "Makassar",
                contactInfo: user,
                createBy: user,
                createDate: date,
                description: "This is desc 1",
                detailInfo: "This is details info 1",
                isAvailable: Boolean.TRUE,
                isSale: Boolean.FALSE,
                lastModified: date,
                paidDate: date,
                postalCode: "90123",
                price: 20000000,
                propertyStatus: PropertyStatus.SALE,
                propertyType: PropertyType.HOME,
                reviewBy: user,
                stars: 5,
                state: "sulsel",
                title: "This is title 1",
                updateBy: user,
                user: user
        )
        property.save(flush: true)

        PropertyDetails details = new PropertyDetails(
                dateCreated: date,
                feature: PropertyFeature.TV,
                lastUpdated: date,
                property: property,
                unit: 3,
                user: user
        )
        details.save(flush: true)

        property.propertyDetails = [details]
        property.save(flush: true)
    }
}
