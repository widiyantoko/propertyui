package propertyui

class PropertyDetails implements Serializable {

    Property property
    String feature
    Integer unit

    Date dateCreated
    Date lastUpdated

    static constraints = {
        property nullable: true, blank: true
        feature nullable: true, blank: true
        unit nullable: true, blank: true
    }
}
