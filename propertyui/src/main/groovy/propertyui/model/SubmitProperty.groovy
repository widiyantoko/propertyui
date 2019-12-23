package propertyui.model

import Enums.PropertyFeature
import grails.validation.Validateable

class SubmitProperty implements Validateable {

    String title
    String propertyStatus
    String propertyType
    String gallery
    String address
    String state
    String city
    String postalCode
    String description

    BigDecimal price
    List<PropertyFeature> features

    Integer totalRoom
    Integer totalBathRoom
    Integer buildingAge
    Integer totalBedRoom

    static constraints = {
        title(blank: false)
        propertyStatus(blank: false)
        propertyType(blank: false)
        price(blank: false)
        gallery(blank: true, nullable: true)
        address(blank: false)
        state(blank: false)
        city(blank: false)
        postalCode(blank: false)
        description(blank: false)

        totalRoom(nullable: true)
        totalBathRoom(nullable: true)
        buildingAge(nullable: true)
        totalBedRoom(nullable: true)

        features(nullable: true, blank: true)
    }

}
