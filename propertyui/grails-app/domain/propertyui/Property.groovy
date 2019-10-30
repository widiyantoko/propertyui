package propertyui

class Property {

    static hasMany = [propertyDetails: PropertyDetails]

    String propertyType
    String propertyStatus

    String title
    String gallery
    String address
    String city
    String state
    String postalCode
    String detailInfo
    String description

    Integer totalRoom
    Integer totalBathRoom
    Integer totalBedRoom
    Integer buildingAge
    Integer stars

    User createBy
    User updateBy
    User contactInfo
    User reviewBy

    BigDecimal price

    Boolean isSale = Boolean.FALSE
    Boolean isAvailable = Boolean.TRUE

    Date createDate
    Date lastModified
    Date paidDate

    static constraints = {
        propertyFeature nullable: true
        propertyType nullable: true
        propertyStatus nullable: true

        title nullable: true
        gallery nullable: true , blank: true
        address nullable: true
        city nullable: true
        state nullable: true
        postalCode nullable: true
        detailInfo nullable: true
        description nullable: true

        totalRoom nullable: true
        totalBathRoom nullable: true
        totalBedRoom nullable: true
        buildingAge nullable: true
        stars nullable: true

        createBy nullable: true
        updateBy nullable: true
        contactInfo nullable: true
        reviewBy nullable: true

        price nullable: true

        isSale nullable: true
        isAvailable nullable: true

        createDate nullable: true
        lastModified nullable: true
        paidDate nullable: true
    }

    static mapping = {
        description sqlType: "text"
        gallery sqlType: "text"
    }
}
