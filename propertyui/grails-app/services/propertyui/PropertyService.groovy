package propertyui

import Enums.PropertyFeature
import Enums.PropertyStatus
import Enums.PropertyType
import org.apache.commons.lang.StringUtils
import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.beans.factory.annotation.Value
import org.springframework.web.multipart.MultipartFile
import propertyui.model.SubmitProperty
import utils.ImageUpload

import javax.servlet.http.HttpServletRequest

@Transactional
class PropertyService {

    @Value('${application.image.directory}')
    private String imageDir

    def springSecurityService

    List<Property> getPropertyList() {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            ne("propertyType", PropertyType.LAND.name())
            isNotNull("propertyType")
            maxResults(6)
            order("lastModified", "desc")
        } as List<Property>

        return propertyList
    }

    List<Property> searchPropertyByParams(GrailsParameterMap params) {

        String keywords = params?.keywords ?: ''
        String type = params?.type ?: ''
        String status = params?.status ?: ''

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String sort = getParams.get("sort")
        String price = getParams.get("price")

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            if (StringUtils.isNotBlank(keywords)) {
                or {
                    like('title', "%"+keywords+"%")
                }
            }
            and {
                if (type?.equalsIgnoreCase('land')) {
                    or {
                        eq("propertyType", PropertyType.LAND.name())
                    }
                } else if(type?.equalsIgnoreCase('ruko')) {
                    or {
                        eq("propertyType", PropertyType.RUKO.name())
                    }
                } else if (type?.equalsIgnoreCase('apartment')) {
                    or {
                        eq("propertyType", PropertyType.APARTMENT.name())
                    }
                } else if (type?.equalsIgnoreCase('office')) {
                    or {
                        eq("propertyType", PropertyType.OFFICE.name())
                    }
                } else if (type?.equalsIgnoreCase('home')) {
                    or {
                        eq("propertyType", PropertyType.HOME.name())
                    }
                }

                isNotNull('propertyStatus')

                if (status?.equalsIgnoreCase('rent')) {
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                    }
                }  else if (status?.equalsIgnoreCase('sale')) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }

            if (sort) {
                order("lastModified", sort)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    Long countPropertyByParams(GrailsParameterMap params) {

        String keywords = params?.keywords ?: ''
        String type = params?.type ?: ''
        String status = params?.status ?: ''

        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }
            if (StringUtils.isNotBlank(keywords)) {
                or {
                    like('title', "%"+keywords+"%")
                }
            }

            and {
                if (type?.equalsIgnoreCase('land')) {
                    or {
                        eq("propertyType", PropertyType.LAND.name())
                    }
                } else if(type?.equalsIgnoreCase('ruko')) {
                    or {
                        eq("propertyType", PropertyType.RUKO.name())
                    }
                } else if (type?.equalsIgnoreCase('apartment')) {
                    or {
                        eq("propertyType", PropertyType.APARTMENT.name())
                    }
                } else if (type?.equalsIgnoreCase('office')) {
                    or {
                        eq("propertyType", PropertyType.OFFICE.name())
                    }
                } else if (type?.equalsIgnoreCase('home')) {
                    or {
                        eq("propertyType", PropertyType.HOME.name())
                    }
                }

                isNotNull('propertyStatus')

                if (status?.equalsIgnoreCase('rent')) {
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                    }
                }  else if (status?.equalsIgnoreCase('sale')) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }
        } as Long

        return result
    }

    List<Property> getAllProperty(GrailsParameterMap params) {

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String sort = getParams.get("sort")
        String price = getParams.get("price")
        String type = params?.type ?: ''
        String status = params?.status ?: ''

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            and {
                if (type?.equalsIgnoreCase('land')) {
                    or {
                        eq("propertyType", PropertyType.LAND.name())
                    }
                } else if(type?.equalsIgnoreCase('ruko')) {
                    or {
                        eq("propertyType", PropertyType.RUKO.name())
                    }
                } else if (type?.equalsIgnoreCase('apartment')) {
                    or {
                        eq("propertyType", PropertyType.APARTMENT.name())
                    }
                } else if (type?.equalsIgnoreCase('office')) {
                    or {
                        eq("propertyType", PropertyType.OFFICE.name())
                    }
                } else if (type?.equalsIgnoreCase('home')) {
                    or {
                        eq("propertyType", PropertyType.HOME.name())
                    }
                }

                isNotNull('propertyStatus')

                if (status?.equalsIgnoreCase('rent')) {
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                    }
                }  else if (status?.equalsIgnoreCase('sale')) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }

            if (sort) {
                order("lastModified", sort)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    Long totalProperty(GrailsParameterMap params) {

        String type = params?.type ?: ''
        String status = params?.status ?: ''

        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }

            if (type?.equalsIgnoreCase('land')) {
                or {
                    eq("propertyType", PropertyType.LAND.name())
                }
            } else if(type?.equalsIgnoreCase('ruko')) {
                or {
                    eq("propertyType", PropertyType.RUKO.name())
                }
            } else if (type?.equalsIgnoreCase('apartment')) {
                or {
                    eq("propertyType", PropertyType.APARTMENT.name())
                }
            } else if (type?.equalsIgnoreCase('office')) {
                or {
                    eq("propertyType", PropertyType.OFFICE.name())
                }
            } else if (type?.equalsIgnoreCase('home')) {
                or {
                    eq("propertyType", PropertyType.HOME.name())
                }
            }

            isNotNull('propertyStatus')

            if (status?.equalsIgnoreCase('rent')) {
                or {
                    eq("propertyStatus", PropertyStatus.RENT.name())
                }
            }  else if (status?.equalsIgnoreCase('sale')) {
                or {
                    eq("propertyStatus", PropertyStatus.SALE.name())
                }
            }

        } as Long

        return result
    }

    List<Property> getPropertyByType(GrailsParameterMap params) {

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String sort = getParams.get("sort")
        String price = getParams.get("price")

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            eq("propertyStatus", PropertyStatus.SALE.name())
            ne("propertyStatus", PropertyStatus.RENT.name())

            and {
                if (params?.type?.equalsIgnoreCase('home')) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (params?.type?.equalsIgnoreCase('apartment')) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (params?.type?.equalsIgnoreCase('ruko')) {
                    eq("propertyType", PropertyType.RUKO.name())
                } else if (params?.type?.equalsIgnoreCase('land')) {
                    eq("propertyType", PropertyType.LAND.name())
                }
            }

            if (sort) {
                order("lastModified", sort)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    Long totalPropertyByType(GrailsParameterMap params) {
        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            eq("propertyStatus", PropertyStatus.SALE.name())
            ne("propertyStatus", PropertyStatus.RENT.name())
            projections {
                count("id")
            }
            and {
                if (params?.type?.equalsIgnoreCase('home')) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (params?.type?.equalsIgnoreCase('apartment')) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (params?.type?.equalsIgnoreCase('ruko')) {
                    eq("propertyType", PropertyType.RUKO.name())
                } else if (params?.type?.equalsIgnoreCase('land')) {
                    eq("propertyType", PropertyType.LAND.name())
                }
            }
        } as Long

        return result
    }

    List<Property> getPropertyByStatus(GrailsParameterMap params) {

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String sort = getParams.get("sort")
        String price = getParams.get("price")

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            eq("propertyStatus", PropertyStatus.RENT.name())
            ne("propertyStatus", PropertyStatus.SALE.name())

            and {
                if (params?.type?.equalsIgnoreCase('home')) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (params?.type?.equalsIgnoreCase('apartment')) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (params?.type?.equalsIgnoreCase('ruko')) {
                    eq("propertyType", PropertyType.RUKO.name())
                } else if (params?.type?.equalsIgnoreCase('office')) {
                    eq("propertyType", PropertyType.OFFICE.name())
                }
            }

            if (sort) {
                order("lastModified", sort)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    Long totalPropertyByStatus(GrailsParameterMap params) {
        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            eq("propertyStatus", PropertyStatus.RENT.name())
            ne("propertyStatus", PropertyStatus.SALE.name())
            projections {
                count("id")
            }
            and {
                if (params?.type?.equalsIgnoreCase('home')) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (params?.type?.equalsIgnoreCase('apartment')) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (params?.type?.equalsIgnoreCase('ruko')) {
                    eq("propertyType", PropertyType.RUKO.name())
                } else if (params?.type?.equalsIgnoreCase('land')) {
                    eq("propertyType", PropertyType.LAND.name())
                }
            }
        } as Long

        return result
    }

    Long countPropertyByType(PropertyType type) {

        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }
            and {
                if (type == PropertyType.HOME) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (type == PropertyType.APARTMENT) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (type == PropertyType.OFFICE) {
                    eq("propertyType", PropertyType.OFFICE.name())
                } else if (type == PropertyType.RUKO) {
                    eq("propertyType", PropertyType.RUKO.name())
                } else {
                    eq("propertyType", PropertyType.LAND.name())
                }
            }
        } as Long

        return result
    }

    Long countPropertyByStatus(PropertyStatus status) {

        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }
            and {
                if (status == PropertyStatus.RENT) {
                    eq("propertyStatus", PropertyStatus.RENT.name())
                } else if (status == PropertyStatus.SALE) {
                    eq("propertyStatus", PropertyStatus.SALE.name())
                }
            }
        } as Long

        return result
    }

    List<Property> getPropertyByStatusFor(GrailsParameterMap params) {

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String sort = getParams.get("sort")
        String price = getParams.get("price")
        String type = params?.type ?: ''

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            and {
                isNotNull("propertyStatus")
                if (type?.equalsIgnoreCase('sale')) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                        ne("propertyStatus", PropertyStatus.RENT.name())
                    }
                } else if (type?.equalsIgnoreCase('rent')){
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                        ne("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }

            if (sort) {
                order("lastModified", sort)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    Long totalPropertyByStatusFor(GrailsParameterMap params) {
        String type = params?.type ?: ''
        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }

            and {
                isNotNull("propertyStatus")
                if (type?.equalsIgnoreCase('sale')) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                        ne("propertyStatus", PropertyStatus.RENT.name())
                    }
                } else if (type?.equalsIgnoreCase('rent')){
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                        ne("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }

        } as Long

        return result
    }

    def getPopularPlace() {
       def results =  Property.createCriteria().list {
           eq("isAvailable", Boolean.TRUE)
           eq("isSale", Boolean.FALSE)
           projections {
               groupProperty("city")
               count("id", "total")
           }
           order("total", "desc")
           maxResults(3)

       }
        return results
    }

    void submitNewProperty(Property property, SubmitProperty submitProperty, def features) {

        User user = springSecurityService.currentUser
        Date date = new Date()

        property.title = submitProperty.title
        property.propertyStatus = submitProperty.propertyStatus
        property.propertyType = submitProperty.propertyType
        property.price = submitProperty.price
        property?.gallery = submitProperty.gallery
        property.totalRoom = submitProperty.totalRoom
        property.totalBathRoom = submitProperty.totalBathRoom
        property.address = submitProperty.address
        property.state = submitProperty.state
        property.city = submitProperty.city
        property.postalCode = submitProperty.postalCode
        property.description = submitProperty.description
        property.buildingAge = submitProperty.buildingAge
        property.totalBedRoom = submitProperty.totalBedRoom

        property.user = user
        property.createBy = user
        property.updateBy = user

        property.createDate = date
        property.lastModified = date

        property.validate()
        if (property.hasErrors()) {
            return
        }
        property.save()

        if (features) {
            features?.each {
                PropertyDetails propertyDetails = new PropertyDetails(
                        dateCreated: date,
                        feature: it,
                        lastUpdated: date,
                        property: property,
                        unit: null,
                        user: user
                )

                propertyDetails.validate()
                if (propertyDetails.hasErrors()) {
                    return
                }
                propertyDetails.save()

                property.propertyDetails.add(propertyDetails)
            }
        }
        property.save()
    }

    Map<String, String> uploadImage(HttpServletRequest request) throws Throwable {
        Map<String, String> attr = new HashMap<>()
        MultipartFile[] avatar = request.multiFileMap.userAvatar
        String imgName = UUID.randomUUID().toString()

        try {
            if (avatar.size() > 0) {
                String path = imageDir
                if (!new File(path).exists()) {
                    new File(path).mkdirs()
                }

                avatar.each {
                    imgName = UUID.randomUUID().toString()
                    Map<String, String> results = ImageUpload.saveImage(it, path, imgName)
                    if (results?.getAt("status")?.equalsIgnoreCase("success")) {
                        println(results?.getAt("message")?.toString())
                        attr.put("success", "OK")
                    }
                }

            } else {
                attr.put("error", "gagal")
            }

        } catch (Exception e) {
            log.error(e.message)
        }

        return attr
    }

    private static Map<String, Object> processParams(GrailsParameterMap params) {

        Map<String, Object> newParams = new HashMap<>()

        String keywords = params?.keywords
        if (StringUtils.isNotBlank(keywords)) {
            newParams.put("keywords", StringUtils.join("%", keywords, "%"))
        }

        newParams.put("offset", params?.int("offset", 0))
        newParams.put("maxRslt", params?.int("max"))
        newParams.put("sort", params?.sort)
        newParams.put("price", params?.price)

        return newParams
    }

}
