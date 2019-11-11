

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
//        home page
        "/"(controller: 'property', action: 'index')
        "/agent/"(controller: "user", action: "agentList")
        "/agent/$id?"(controller: 'user', action: 'agentDetails')
        "/blog/"(controller: 'property', action: 'blog')
        "/about/"(controller: 'property', action: 'about')

        "/property-list/"(controller: 'property', action: 'propertyList')
        "/save-data"(controller: 'property', action: 'saveData')
        "/property-details/$id?"(controller: 'property', action: 'propertyDetails')
        "/property-type/$type?"(controller: 'property',action: 'getPropertyByType')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
