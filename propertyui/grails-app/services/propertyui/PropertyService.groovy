package propertyui

import Enums.PropertyType
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
                if (params?.type?.equalsIgnoreCase('property')) {
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

}
