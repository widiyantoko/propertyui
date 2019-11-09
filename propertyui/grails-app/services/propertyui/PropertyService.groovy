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

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            if (StringUtils.isNotBlank(keywords)) {
                or {
                    like('title', "%"+keywords+"%")
                }
            }
        } as List<Property>

        return propertyList
    }

    Long countPropertyByParams(GrailsParameterMap params) {

        String keywords = params?.keywords ?: ''

        Long result = Property.createCriteria().get {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            projections {
                count("id")
            }

            and {
                if (StringUtils.isNotBlank(keywords)) {
                    or {
                        like('title', "%"+keywords+"%")
                    }
                }
            }
        } as Long

        return result
    }

    List<Property> getAllProperty() {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)
            order("lastModified", "desc")
        } as List<Property>

        return propertyList
    }

    List<Property> getPropertyByType(GrailsParameterMap params) {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            and {
                if (params?.type?.equalsIgnoreCase('home')) {
                    eq("propertyType", PropertyType.HOME.name())
                } else if (params?.type?.equalsIgnoreCase('office')) {
                    eq("propertyType", PropertyType.OFFICE.name())
                } else if (params?.type?.equalsIgnoreCase('apartment')) {
                    eq("propertyType", PropertyType.APARTMENT.name())
                } else if (params?.type?.equalsIgnoreCase('others')){
                    eq("propertyType", PropertyType.OTHERS.name())
                }
            }

        } as List<Property>

        return propertyList
    }

    List<Property> getPropertyByStatus(GrailsParameterMap params) {

        List<Property> propertyList = Property.createCriteria().list {
            eq("isAvailable", Boolean.TRUE)
            eq("isSale", Boolean.FALSE)

            and {
                if (params?.status?.equalsIgnoreCase('sale')) {
                    eq("propertyStatus", PropertyStatus.SALE.name())
                } else if (params?.status?.equalsignoreCase('rent')) {
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

}
