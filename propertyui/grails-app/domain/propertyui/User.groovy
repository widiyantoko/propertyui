package propertyui

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable{

    private static final long serialVersionUID = 1

//    def springSecurityService

    String username
    String password
    String email

    String firstName
    String lastName
    String title
    String avatar
    String longName

    Boolean accountLocked = false
    Boolean emailVerified = false

    String addressStreetName1
    String addressStreetName2
    String addressCity
    String addressState
    String addressZip
    String addressCountry

    String contactMobile
    String contactOffice

    Integer passwordFailed
    Date lastLogin

    Date dateCreated
    Date lastUpdated

    User(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty(password)) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = password.encodeAsSHA256()
//        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email nullable: true, unique: true

        firstName nullable: true
        lastName nullable: true
        title nullable: true
        avatar nullable: true, blank: true
        longName nullable: true

        addressStreetName1 nullable: true
        addressStreetName2 nullable: true

        addressCity nullable: true
        addressState nullable: true
        addressZip nullable: true
        addressCountry nullable: true

        contactMobile nullable: true
        contactOffice nullable: true

        passwordFailed nullable: true, blank: true
        lastLogin nullable: true, blank: true

        dateCreated nullable: true, blank: true
        lastUpdated nullable: true, blank: true
    }

    static mapping = {
        avatar sqlType: "text"
        password column: '`password`'
        longName formula: "CASE WHEN title <> '' AND title IS NOT NULL THEN CONCAT_WS(' ', title, first_name,l ast_name) ELSE CONCAT_WS(' ', first_name, last_name) END"
    }

    def getFullName() {
        String fullName = (title ?: "") + " " + (firstName ?: "") + " " + (lastName ?: "")
        return fullName?.trim()
    }
}
