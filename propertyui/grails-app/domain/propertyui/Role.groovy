package propertyui

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

    private static final long serialVersionUID = 1

    String authority
    String name

    Role(String authority) {
        this()
        this.authority = authority
    }

    static constraints = {
        authority blank: false, unique: true
//        legacyAuthority nullable: true
        name blank: true, nullable: true
    }

    static mapping = {
        cache true
    }
}
