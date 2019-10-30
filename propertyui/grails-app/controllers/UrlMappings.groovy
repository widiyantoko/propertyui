

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'home', action: 'index')
        "/property-list/"(controller: 'home', action: 'propertyList')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
