package propertyui

class UserDetails implements Serializable {

    static belongsTo = [user: User]

    String socialFacebook
    String socialTwitter
    String socialInstagram
    String socialLinkedin

    static constraints = {

        socialFacebook nullable: true
        socialTwitter nullable: true
        socialInstagram nullable: true
        socialLinkedin nullable: true
    }
}
