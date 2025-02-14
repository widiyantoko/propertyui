package propertyui

import org.springframework.web.servlet.support.RequestContextUtils

class PaginateTagLib {
    /*
     * This g:paginate tag fix is based on:
     * https://github.com/grails/grails-core/blob/master/grails-plugin-gsp/src/main/groovy/org/codehaus/groovy/grails/plugins/web/taglib/RenderTagLib.groovy
     */

    /**
     * Creates next/previous links to support pagination for the current controller.<br/>
     *
     * &lt;g:paginate total="${Account.count()}" /&gt;<br/>
     *
     * @emptyTag
     *
     * @attr total REQUIRED The total number of results to paginate
     * @attr action the name of the action to use in the link, if not specified the default action will be linked
     * @attr controller the name of the controller to use in the link, if not specified the current controller will be linked
     * @attr id The id to use in the link
     * @attr params A map containing summary parameters
     * @attr prev The text to display for the previous link (defaults to "Previous" as defined by default.paginate.prev property in I18n messages.properties)
     * @attr next The text to display for the next link (defaults to "Next" as defined by default.paginate.next property in I18n messages.properties)
     * @attr max The number of records displayed per page (defaults to 10). Used ONLY if params.max is empty
     * @attr maxsteps The number of steps displayed for pagination (defaults to 10). Used ONLY if params.maxsteps is empty
     * @attr offset Used only if params.offset is empty
     * @attr fragment The link fragment (often called anchor tag) to use
     */
    def paginate = { attrs ->

        def configTabLib = true
        if (!configTabLib) {
            def renderTagLib = grailsApplication.mainContext.getBean('org.grails.plugins.web.taglib.UrlMappingTagLib')
            renderTagLib.paginate.call(attrs)
            return
        }

        def writer = out
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }
        def messageSource = grailsAttributes.messageSource
        def locale = RequestContextUtils.getLocale(request)

        def total = attrs.int('total') ?: 0
        def action = (attrs.action ? attrs.action : (params.action ? params.action : "index"))
        def offset = params.int('offset') ?: 0
        def max = params.int('max')
        def maxsteps = (attrs.int('maxsteps') ?: 10)

        if (!offset) offset = (attrs.int('offset') ?: 0)
        if (!max) max = (attrs.int('max') ?: 10)

        def linkParams = [:]
        if (attrs.params) linkParams.putAll(attrs.params)
        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) linkParams.sort = params.sort
        if (params.order) linkParams.order = params.order

        def linkTagAttrs = [action:action]
        if (attrs.namespace) {
            linkTagAttrs.namespace = attrs.namespace
        }
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        //add the mapping attribute if present
        if (attrs.mapping) {
            linkTagAttrs.mapping = attrs.mapping
        }

        linkTagAttrs.params = linkParams

        def cssClasses1 = "c-pagination"
        def cssClasses = "pagination"
        if (attrs.class) {
            cssClasses = "pagination " + attrs.class
        }

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = (offset / max) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max))

        writer << "<div class=\"${cssClasses1}\">"
        if (currentstep > firststep) {
            linkParams.offset = ((currentstep - 1) * max) - max
            writer << link(linkTagAttrs.clone()) {"<span class=\"fa fa-caret-left\"></span>"}
        }
        writer << "<span>Page</span>"
        writer << "<input type=\"text\" name=\"inputPage\" value=\"${currentstep}\" class=\"form-control inline-form-control c-pagination-input\">"
        writer << "<span>of</span> <span>"+laststep+"</span>"
        if (currentstep < laststep) {
            linkParams.offset = ((currentstep - 1) * max) + max
            writer << link(linkTagAttrs.clone()) {"<span class=\"fa fa-caret-right\"></span>"}
        }
        writer << "</div>"


//        writer << "<ul class=\"${cssClasses}\">"
//        // display previous link when not on firststep
//        if (currentstep > firststep) {
//            // display first link
//            linkParams.offset = 0
//            writer << '<li class="first">'
//            writer << link(linkTagAttrs.clone()) {
//                messageSource.getMessage('default.paginate.first', null, 'First', locale)
//            }
//            writer << '</li>'
//
//            linkParams.offset = offset - max
//            linkTagAttrs.class = 'fa-angle'
//            writer << '<li class="prev">'
//            writer << link(linkTagAttrs.clone()) {
//                (attrs.prev ?: messageSource.getMessage('default.paginate.prev', null, '<i class="fa fa-angle-left"></i>', locale))
//            }
//            writer << '</li>'
//        }
//        else {
//            // display first link
//            writer << '<li class="first disabled"><a>'
//            writer << messageSource.getMessage('default.paginate.first', null, 'First', locale)
//            writer << '</a></li>'
//
//            writer << '<li class="prev disabled"><a class="fa-angle" aria-label="Previous">'
//            writer << (attrs.prev ?: messageSource.getMessage('default.paginate.prev', null, '<i class="fa fa-angle-left"></i>', locale))
//            writer << '</a></li>'
//        }
//
//        // display steps when steps are enabled and laststep is not firststep
//        if (steps && laststep > firststep) {
//            linkTagAttrs.class = 'step'
//
//            // determine begin and endstep paging variables
//            int beginstep = currentstep - Math.round(maxsteps / 2) + (maxsteps % 2)
//            int endstep = currentstep + Math.round(maxsteps / 2) - 1
//
//            if (beginstep < firststep) {
//                beginstep = firststep
//                endstep = maxsteps
//            }
//            if (endstep > laststep) {
//                beginstep = laststep - maxsteps + 1
//                if (beginstep < firststep) {
//                    beginstep = firststep
//                }
//                endstep = laststep
//            }
//
//            // display firststep link when beginstep is not firststep
//            if (beginstep > firststep) {
//                linkParams.offset = 0
//                writer << '<li>'
//                writer << link(linkTagAttrs.clone()) {firststep.toString()}
//                writer << '</li>'
//                writer << '<li class="disabled"><span>...</span></li>'
//            }
//
//            // display paginate steps
//            (beginstep..endstep).each { i ->
//                if (currentstep == i) {
//                    writer << "<li class=\"active\">"
//                    writer << "<span>${i}</span>"
//                    writer << "</li>"
//                }
//                else {
//                    linkParams.offset = (i - 1) * max
//                    if (currentstep == (i-1) || currentstep == (i+1)) { // mobile link class
//                        writer << "<li class=\"--visible-mobile\">"
//                    } else {
//                        writer << "<li>"
//                    }
//                    writer << link(linkTagAttrs.clone()) {i.toString()}
//                    writer << "</li>"
//                }
//            }
//
//            // display laststep link when endstep is not laststep
//            if (endstep < laststep) {
//                writer << '<li class="disabled"><span>...</span></li>'
//                linkParams.offset = (laststep -1) * max
//                writer << '<li>'
//                writer << link(linkTagAttrs.clone()) { laststep.toString() }
//                writer << '</li>'
//            }
//        }
//
//        // display next link when not on laststep
//        if (currentstep < laststep) {
//            linkParams.offset = offset + max
//            linkTagAttrs.class = 'fa-angle'
//            writer << '<li class="next">'
//            writer << link(linkTagAttrs.clone()) {
//                (attrs.next ? attrs.next : messageSource.getMessage('default.paginate.next', null, '<i class="fa fa-angle-right"></i>', locale))
//            }
//            writer << '</li>'
//
//            // display last link
//            linkParams.offset = (laststep -1) * max
//            linkTagAttrs.class = ''
//            writer << '<li class="last">'
//            writer << link(linkTagAttrs.clone()) {
//                attrs.last ?: messageSource.getMessage('default.paginate.last', null, 'Last', locale)
//            }
//            writer << '</li>'
//        }
//        else {
//            writer << '<li class="fa-angle disabled"><a class="fa-angle" aria-label="Next">'
//            writer << (attrs.next ? attrs.next : messageSource.getMessage('default.paginate.next', null, '<i class="fa fa-angle-right"></i>', locale))
//            writer << '</a></li>'
//
//            // display last link
//            writer << '<li class="last disabled"><a>'
//            writer << messageSource.getMessage('default.paginate.last', null, 'Last', locale)
//            writer << '</a></li>'
//        }
//
//        writer << '</ul>'
    }

    /**
     *
     * @attr body REQUIRED The body must be breadcrumbLink
     */
    def breadcrumb = { attrs, body ->
        out << '<ol class="breadcrumb">'
        out << body()
        out << '</ol>'
    }

    /**
     * @emptyTag
     *
     * @attr value REQUIRED The value is the value of the link
     * @attr active True if the link is active
     */
    def breadcrumbLink = { attrs ->
        def value = attrs.value
        def active = attrs.boolean('active')
        def link = attrs.link ?: '#'
        if (active) {
            out << "<li class=\"active\">${value}</li>"
        } else {
            out << "<li><a href=\"${link}\">${value}</a></li>"
        }
    }
}
