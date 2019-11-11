package propertyui

class UserDetails implements Serializable {

    String socialFacebook
    String socialTwitter
    String socialInstagram
    String socialLinkedin

    User user
    User updatedBy

    Date lastModified

    static constraints = {

        socialFacebook nullable: true
        socialTwitter nullable: true
        socialInstagram nullable: true
        socialLinkedin nullable: true

        user nullable: true
        updatedBy nullable: true

        lastModified nullable: true
    }
}
