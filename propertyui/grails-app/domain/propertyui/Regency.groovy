package propertyui

class Regency implements Serializable {

    String code
    String name
    String provinceCode

    Date createdAt
    Date updatedAt

    static constraints = {
        code nullable: true, blank: true
        name nullable: true, blank: true
        provinceCode nullable: true, blank: true

        createdAt nullable: true
        updatedAt nullable: true
    }

}
