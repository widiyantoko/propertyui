package propertyui

import Enums.PropertyFeature
import Enums.PropertyStatus
import Enums.PropertyType
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import propertyui.model.SubmitProperty

import static org.springframework.http.HttpStatus.NOT_FOUND

@Transactional(readOnly = true)
class PropertyController {

    def propertyService
    def userService
    def springSecurityService

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
        render view: "property_status_sale", model: [
                propertyList: propertyList,
                countPropertyByType: propertyService.totalPropertyByType(params)
        ]
    }

    def rent(){

        params?.max = params?.int("max", 8)
        if (params?.inputPage) {
            Integer inputPage = (params?.int("inputPage") - 1 ) * params?.max
            params?.offset = inputPage
        }

        params?.sort = params?.sort ?: 'desc'
        params?.price = params?.price ?: ''

        List<Property> propertyList = propertyService.getPropertyByStatus(params)

        if (!propertyList) {
            notFound()
            return
        }

        render view: "property_status_rent", model: [
                propertyList: propertyList,
                countPropertyByStatus: propertyService.totalPropertyByStatus(params)
        ]

    }

    def list() {

        params?.max = params?.int("max", 8)
        if (params?.inputPage) {
            Integer inputPage = (params?.int("inputPage") - 1 ) * params?.max
            params?.offset = inputPage
        }

        params?.sort = params?.sort ?: 'desc'
        params?.price = params?.price ?: ''

        List<Property> propertyList = propertyService.getPropertyByStatusFor(params)

        if (!propertyList) {
            notFound()
            return
        }

        render view: "property_rent_and_sale", model: [
                propertyList: propertyList,
                countPropertyByStatus: propertyService.totalPropertyByStatusFor(params)
        ]

    }

    def type() {
        params?.max = params?.int("max", 8)
        if (params?.inputPage) {
            Integer inputPage = (params?.int("inputPage") - 1 ) * params?.max
            params?.offset = inputPage
        }

        params?.sort = params?.sort ?: 'desc'
        params?.price = params?.price ?: ''

        List<Property> propertyList = propertyService.getAllProperty(params)

        render view: "property_all_type", model: [
                propertyList: propertyList,
                countPropertyByStatus: propertyService.totalProperty(params)
        ]
    }

    @Secured('isFullyAuthenticated()')
    @Transactional
    def beforeSubmit() {
        User user = springSecurityService.currentUser

        List<Province> provinceList = Province.findAll {it.name}


        [
                user: user,
                submitProperty: new SubmitProperty(),
                provinceList: provinceList
        ]
    }

    @Secured('isFullyAuthenticated()')
    @Transactional
    def save(SubmitProperty submitProperty) {

        def features = params?.list('feature')
        String type = params?.type
        String status = params?.status
        String state = params?.state
        String city = params?.city

        Province province = Province.findByCode(state)
        Regency regency = Regency.findByCode(city)

        submitProperty.propertyType = type
        submitProperty.propertyStatus = status
        submitProperty.state = province?.name
        submitProperty.city = regency?.name

        submitProperty.validate()
        if (submitProperty.hasErrors()) {
            flash.error = 'Gagal input data a'
            respond submitProperty.errors, view: 'beforeSubmit'
            return
        }

        try {
            Property property = new Property()
            propertyService.submitNewProperty(property, submitProperty, features)

            if (property.hasErrors()) {
                transactionStatus.setRollbackOnly()
                flash.error = 'Gagal input data b'
                respond submitProperty.errors, view: 'beforeSubmit'
            }

        } catch (Exception e) {
            transactionStatus.setRollbackOnly()
            log.error(e?.message, e)

            flash.error = 'Gagal input data c'
            respond submitProperty.errors, view: 'beforeSubmit'
            return
        }

        redirect(controller: 'user', action: 'index')
    }

    def getCityByProvince() {
        ResultData res = new ResultData()
        String provinceCode = params?.provinceCode
        List<Regency> regencyList = Regency.findAllByProvinceCode(provinceCode)

        res.success = true
        res.data = [
            regencyList: regencyList
        ]

        render res.result as JSON
    }

    def blog() {

        render view: "test", model: [

        ]
    }

    def about() {
        render view: "test", model: [

        ]
    }

    @Transactional
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
