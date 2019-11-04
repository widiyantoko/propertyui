package propertyui

import org.ocpsoft.prettytime.PrettyTime

class Property implements Serializable{

    static belongsTo = [user: User]

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

    Integer buildingAge
    Integer stars

    User createBy
    User updateBy
    User reviewBy

    BigDecimal price
    BigDecimal size

    Boolean isSale = Boolean.FALSE
    Boolean isAvailable = Boolean.TRUE

    Date createDate
    Date lastModified
    Date paidDate

    static constraints = {
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
        size nullable: true

        stars nullable: true

        createBy nullable: true
        updateBy nullable: true
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

    def getDatePosted() {
        Date postDate = lastModified

        PrettyTime time = new PrettyTime(new Locale("en"))
        return time.format(postDate)
    }

    def getFullAddress() {
        String fullAddress = (address ?: "") + ", " + (city ?: "") + ", " + (state ?: "")
        return fullAddress?.trim()
    }
}
