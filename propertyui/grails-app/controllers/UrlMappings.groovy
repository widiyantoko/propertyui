

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //admin
        "/admin"(controller: 'adminUser', action: 'index')
        group "/admin", {

        }

        //home page & header
        "/"(controller: 'property', action: 'index')
        "/agent/"(controller: "user", action: "agentList")
        "/agent/$id?"(controller: 'user', action: 'agentDetails')
        "/blog/"(controller: 'property', action: 'blog')
        "/about/"(controller: 'property', action: 'about')
        "/property/$action?/$type?"(controller: 'property')
        "/sign-up"(controller: "registration", action: "index")

        "/all/"(controller: 'property', action: 'propertyList')
        "/save-data"(controller: 'property', action: 'saveData')
        "/property/details/$id?"(controller: 'property', action: 'propertyDetails')
        "/submit/"(controller: 'property', action: 'beforeSubmit')

        //user page
        "/profile"(controller: 'user', action: 'index')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
