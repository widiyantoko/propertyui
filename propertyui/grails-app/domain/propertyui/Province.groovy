package propertyui

class Province {

    String code
    String name

    Date createdAt
    Date updatedAt

    static constraints = {
        code nullable: true, blank: true
        name nullable: true, blank: true

        createdAt nullable: true
        updatedAt nullable: true
    }


}
