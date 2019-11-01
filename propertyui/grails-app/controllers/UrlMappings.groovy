

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'home', action: 'index')
        "/property-list/"(controller: 'home', action: 'propertyList')
        "/save-data"(controller: 'home', action: 'saveData')
        "/property-details/$id?"(controller: 'home', action: 'propertyDetails')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
