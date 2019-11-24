package propertyui.model

import grails.validation.Validateable

class PasswordReset implements Validateable {

    String password
    String passwordAgain

    static constraints = {
        password(nullable: false, blank: false, minSize: 6)
        passwordAgain(nullable: false, blank: false, validator : { var, obj ->
            if (obj.password != var) return ['property.model.PasswordReset.passwordAgain.doesnotmatch']
        })
    }
}
