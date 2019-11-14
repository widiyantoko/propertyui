package propertyui

import Enums.PropertyStatus
import Enums.PropertyType
import org.apache.commons.lang.StringUtils
import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class PropertyService {

    List<Property> getPropertyList() {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            maxResults(6)
            order("lastModified", "desc")
        } as List<Property>

        return propertyList
    }

    List<Property> searchPropertyByParams(GrailsParameterMap params) {

        String keywords = params?.keywords ?: ''
        String type = params?.propertyType ?: ''
        String status = params?.propertyStatus ?: ''

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String postDate = getParams.get("postDate")
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
                if (type == PropertyType.OTHERS.name()) {
                    or {
                        eq("propertyType", PropertyType.OTHERS.name())
                    }
                } else if (type == PropertyType.APARTMENT.name()) {
                    or {
                        eq("propertyType", PropertyType.APARTMENT.name())
                    }
                } else if (type == PropertyType.OFFICE.name()) {
                    or {
                        eq("propertyType", PropertyType.OFFICE.name())
                    }
                } else if (type == PropertyType.HOME.name()) {
                    or {
                        eq("propertyType", PropertyType.HOME.name())
                    }
                }

                isNotNull('propertyStatus')

                if (status == PropertyStatus.RENT.name()) {
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                    }
                }  else if (status == PropertyStatus.SALE.name()) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }

            if (postDate) {
                order("lastModified", postDate)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    Long countPropertyByParams(GrailsParameterMap params) {

        String keywords = params?.keywords ?: ''
        String type = params?.propertyType ?: ''
        String status = params?.propertyStatus ?: ''

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
                if (type == PropertyType.OTHERS.name()) {
                    or {
                        eq("propertyType", PropertyType.OTHERS.name())
                    }
                } else if (type == PropertyType.APARTMENT.name()) {
                    or {
                        eq("propertyType", PropertyType.APARTMENT.name())
                    }
                } else if (type == PropertyType.OFFICE.name()) {
                    or {
                        eq("propertyType", PropertyType.OFFICE.name())
                    }
                } else if (type == PropertyType.HOME.name()) {
                    or {
                        eq("propertyType", PropertyType.HOME.name())
                    }
                }

                isNotNull('propertyStatus')

                if (status == PropertyStatus.RENT.name()) {
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                    }
                }  else if (status == PropertyStatus.SALE.name()) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }
        } as Long

        return result
    }

    Long totalProperty(GrailsParameterMap params) {

        String type = params?.propertyType ?: ''
        String status = params?.propertyStatus ?: ''

        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }

            if (type == PropertyType.OTHERS.name()) {
                or {
                    eq("propertyType", PropertyType.OTHERS.name())
                }
            } else if (type == PropertyType.APARTMENT.name()) {
                or {
                    eq("propertyType", PropertyType.APARTMENT.name())
                }
            } else if (type == PropertyType.OFFICE.name()) {
                or {
                    eq("propertyType", PropertyType.OFFICE.name())
                }
            } else if (type == PropertyType.HOME.name()) {
                or {
                    eq("propertyType", PropertyType.HOME.name())
                }
            }

            isNotNull('propertyStatus')

            if (status == PropertyStatus.RENT.name()) {
                or {
                    eq("propertyStatus", PropertyStatus.RENT.name())
                }
            }  else if (status == PropertyStatus.SALE.name()) {
                or {
                    eq("propertyStatus", PropertyStatus.SALE.name())
                }
            }

        } as Long

        return result
    }

    List<Property> getAllProperty(GrailsParameterMap params) {

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")
        String postDate = getParams.get("postDate")
        String price = getParams.get("price")
        String type = params?.propertyType ?: ''
        String status = params?.propertyStatus ?: ''

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            and {
                if (type == PropertyType.OTHERS.name()) {
                    or {
                        eq("propertyType", PropertyType.OTHERS.name())
                    }
                } else if (type == PropertyType.APARTMENT.name()) {
                    or {
                        eq("propertyType", PropertyType.APARTMENT.name())
                    }
                } else if (type == PropertyType.OFFICE.name()) {
                    or {
                        eq("propertyType", PropertyType.OFFICE.name())
                    }
                } else if (type == PropertyType.HOME.name()) {
                    or {
                        eq("propertyType", PropertyType.HOME.name())
                    }
                }

                isNotNull('propertyStatus')

                if (status == PropertyStatus.RENT.name()) {
                    or {
                        eq("propertyStatus", PropertyStatus.RENT.name())
                    }
                }  else if (status == PropertyStatus.SALE.name()) {
                    or {
                        eq("propertyStatus", PropertyStatus.SALE.name())
                    }
                }
            }

            if (postDate) {
                order("lastModified", postDate)
            } else {
                order("price", price)
            }

        } as List<Property>

        return propertyList
    }

    List<Property> getProperty(GrailsParameterMap params) {

        Map<String, Object> getParams = processParams(params)
        Integer maxResult = (Integer) getParams.get("maxRslt")
        Integer offset = (Integer) getParams.get("offset")

        List<Property> propertyList = Property.createCriteria().list([max: maxResult, offset: offset]) {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            and {
                if (params?.type?.equals(PropertyType.HOME.name())) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (params?.type?.equals(PropertyType.OFFICE.name()) ) {
                    eq("propertyType", PropertyType.OFFICE.name())
                } else if (params?.type?.equals(PropertyType.APARTMENT.name())) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (params?.type?.equals(PropertyType.OTHERS.name())){
                    eq("propertyType", PropertyType.OTHERS.name())
                }

                isNotNull("propertyStatus")

                if (params?.status?.equals(PropertyStatus.SALE.name())) {
                    eq("propertyStatus", PropertyStatus.SALE.name())
                } else if (params?.status?.equals(PropertyStatus.RENT.name())) {
                    eq("propertyStatus", PropertyStatus.RENT.name())
                }
            }

        } as List<Property>

        return propertyList
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
                } else {
                    eq("propertyType", PropertyType.OTHERS.name())
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

    private static Map<String, Object> processParams(GrailsParameterMap params) {

        Map<String, Object> newParams = new HashMap<>()

        String keywords = params?.keywords
        if (StringUtils.isNotBlank(keywords)) {
            newParams.put("keywords", StringUtils.join("%", keywords, "%"))
        }

        newParams.put("offset", params?.int("offset", 0))
        newParams.put("maxRslt", params?.int("max"))
        newParams.put("postDate", params?.postDate)
        newParams.put("price", params?.price)

        return newParams
    }

}
