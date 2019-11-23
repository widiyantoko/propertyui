package propertyui.model

import Enums.UserTitle
import grails.validation.Validateable
import org.apache.commons.validator.routines.EmailValidator
import propertyui.User

class UserRegister implements Validateable {

//    String title
    String firstName
    String lastName
    String email
    String password
    String passwordAgain
    Boolean acceptTnc
    String contactMobile

    static constraints = {

//        title(blank: false, inList: UserTitle.values().value)
        firstName(blank: false)
        lastName(blank: false)
        email(blank: false, validator: { val, obj ->
            if (!EmailValidator.getInstance().isValid(val as String)) {
                return ['property.model.UserRegister.email.invalid.email']
            }
            if (User.findByEmail(val as String)) return ['property.model.UserRegister.duplicate.invalid.email']
        })
        password(blank: false, minSize: 6)
        passwordAgain(blank: false, minSize: 6, validator: { val, obj ->
            if (!val || obj.password != val) return ['property.model.UserRegister.password.invalid']
        })
        acceptTnc(blank: false, validator: { val, obj ->
            if (!val) return ['property.model.UserRegister.tnc.accepted']
        })
        contactMobile(nullable: true, blank: true)
    }
}
