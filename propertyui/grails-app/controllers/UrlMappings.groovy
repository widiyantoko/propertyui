

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'property', action: 'index')
        "/property-list/"(controller: 'property', action: 'propertyList')
        "/save-data"(controller: 'property', action: 'saveData')
        "/property-details/$id?"(controller: 'property', action: 'propertyDetails')
        "/property-type/$type?"(controller: 'property',action: 'getPropertyByType')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
