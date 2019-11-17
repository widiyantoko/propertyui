package propertyui

import Enums.PropertyFeature
import Enums.PropertyStatus
import Enums.PropertyType

import static org.springframework.http.HttpStatus.NOT_FOUND

class PropertyController {

    def propertyService
    def userService

    def index() {
        List<Property> propertyList = propertyService.getPropertyList()
        Long totalUser = userService.countTotalUser()
        List<Property> lastReviewList = userService.getLastUserReview()
        def popularPropertyList = propertyService.getPopularPlace()

        //count property by type
        List<PropertyType> typeList = [PropertyType.HOME, PropertyType.OFFICE, PropertyType.APARTMENT, PropertyType.RUKO, PropertyType.LAND]
        Long allTypeCount = 0
        Map<String, Long> typeCountMap = new HashMap<>()

        for (PropertyType type : typeList) {
            Long countByType = propertyService.countPropertyByType(type)
            typeCountMap.put(type.name(), countByType)

            allTypeCount += countByType
        }
        typeCountMap.put("all", allTypeCount)

        //count property by status
        List<PropertyStatus> statusList = [PropertyStatus.SALE, PropertyStatus.RENT]
        Long allStatusCount = 0
        Map<String, Long> statusCountMap = new HashMap<>()

        for (PropertyStatus status : statusList) {
            Long countByStatus = propertyService.countPropertyByStatus(status)
            statusCountMap.put(status.name(), countByStatus)

            allStatusCount += countByStatus
        }

        statusCountMap.put("all", allStatusCount)


        [
                propertyList: propertyList,
                typeList: typeList,
                countType: typeCountMap,
                statusList: statusList,
                countStatus: statusCountMap,
                totalUser: totalUser,
                lastReviewList: lastReviewList,
                popularPropertyList: popularPropertyList
        ]

    }

    def search() {

        params?.max = params?.int("max", 8)
        if (params?.inputPage) {
            Integer inputPage = (params?.int("inputPage") - 1 ) * params?.max
            params?.offset = inputPage
        }

        params?.sort = params?.sort ?: 'desc'
        params?.price = params?.price ?: ''

        List<PropertyType> typeList = [PropertyType.HOME, PropertyType.OFFICE, PropertyType.APARTMENT, PropertyType.RUKO, PropertyType.LAND]
        Long allTypeCount = 0
        Map<String, Long> typeCountMap = new HashMap<>()

        for (PropertyType type : typeList) {
            Long countByType = propertyService.countPropertyByType(type)
            typeCountMap.put(type.name(), countByType)

            allTypeCount += countByType
        }

        typeCountMap.put("all", allTypeCount)

        render view: "property_by_params", model: [
                propertyList: propertyService.searchPropertyByParams(params),
                countPropertyByParams: propertyService.countPropertyByParams(params),
                typeList: typeList,
                countType: typeCountMap
        ]
    }

    def propertyList() {

        params?.max = params?.int("max", 8)
        if (params?.inputPage) {
            Integer inputPage = (params?.int("inputPage") - 1 ) * params?.max
            params?.offset = inputPage
        }

        params?.sort = params?.sort ?: 'desc'
        params?.price = params?.price ?: ''

        List<Property> propertyList = propertyService.getAllProperty(params)

        List<PropertyType> typeList = [PropertyType.HOME, PropertyType.OFFICE, PropertyType.APARTMENT, PropertyType.RUKO, PropertyType.LAND]
        Long allTypeCount = 0
        Map<String, Long> typeCountMap = new HashMap<>()

        for (PropertyType type : typeList) {
            Long countByType = propertyService.countPropertyByType(type)
            typeCountMap.put(type.name(), countByType)

            allTypeCount += countByType
        }

        typeCountMap.put("all", allTypeCount)

        render view: "property_list", model: [
                propertyList: propertyList,
                typeList: typeList,
                countType: typeCountMap,
                totalProperty: propertyService.totalProperty(params)
        ]
    }

    def propertyDetails() {
        Property property = Property.findById(params?.long('id'))

        if (!property) {
            notFound()
            return
        }

        render view: "property_details", model: [
            property: property
        ]
    }

    def buy() {

        params?.max = params?.int("max", 8)
        if (params?.inputPage) {
            Integer inputPage = (params?.int("inputPage") - 1 ) * params?.max
            params?.offset = inputPage
        }

        params?.sort = params?.sort ?: 'desc'
        params?.price = params?.price ?: ''

        List<Property> propertyList = propertyService.getPropertyByType(params)

        if (!propertyList) {
            notFound()
            return
        }
        render view: "property_by_type", model: [
                propertyList: propertyList,
                countPropertyByType: propertyService.totalPropertyByType(params)
        ]
    }

    def rent(){

    }

    def blog() {

        render view: "test", model: [

        ]
    }

    def about() {
        render view: "test", model: [

        ]
    }

    def saveData() {
        User user = User.findById(1)
        Date date =  new Date()
        Property property = new Property(
                address: "Jl Bonerate",
                buildingAge: 2,
                city: "Makassar",
                contactInfo: user,
                createBy: user,
                createDate: date,
                description: "This is desc 1",
                detailInfo: "This is details info 1",
                isAvailable: Boolean.TRUE,
                isSale: Boolean.FALSE,
                lastModified: date,
                paidDate: date,
                postalCode: "90123",
                price: 20000000,
                propertyStatus: PropertyStatus.SALE,
                propertyType: PropertyType.HOME,
                reviewBy: user,
                stars: 5,
                state: "sulsel",
                title: "This is title 1",
                size: 1600,
                updateBy: user,
                user: user
        )
        property.save(flush: true)

        PropertyDetails details = new PropertyDetails(
                dateCreated: date,
                feature: PropertyFeature.TV,
                lastUpdated: date,
                property: property,
                unit: 3,
                user: user
        )
        details.save(flush: true)

        property.propertyDetails = [details]
        property.save(flush: true)
    }

    protected void notFound() {
        render status: NOT_FOUND
    }
}
