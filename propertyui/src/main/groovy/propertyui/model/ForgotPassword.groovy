package propertyui.model

import grails.validation.Validateable
import org.apache.commons.validator.routines.EmailValidator
import propertyui.User

class ForgotPassword implements Validateable{

    String email

    static constraints = {
        email(nullable: false, blank: false, validator: { val, obj ->
            if (!EmailValidator.getInstance().isValid(val as String)) return ['property.model.UserRegister.email.invalid.email']
            if (User.countByEmail(val as String) == 0) return ['property.model.ForgotPassword.email.notFound']
        })
    }
}
