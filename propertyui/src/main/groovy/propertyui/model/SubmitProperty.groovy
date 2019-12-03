package propertyui.model

import grails.validation.Validateable

class SubmitProperty implements Validateable {

    String title
    String propertyStatus
    String propertyType
    String price
    String gallery
    String address
    String state
    String city
    String postalCode
    String description

    Integer totalRoom
    Integer totalBathRoom
    Integer buildingAge
    Integer totalBedRoom

    static constraints = {
        title(blank: false)
        propertyStatus(blank: false)
        propertyType(blank: false)
        price(blank: false)
        gallery(blank: false)
        address(blank: false)
        state(blank: false)
        city(blank: false)
        postalCode(blank: false)
        description(blank: false)

        totalRoom(nullable: false)
        totalBathRoom(nullable: false)
        buildingAge(nullable: true)
        totalBedRoom(nullable: false)
    }

}
