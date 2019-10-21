package Enums

enum PropertyFeature {

    TV("TV", "monitor"),
    GARAGE("GARAGE", "vehicle"),
    BALCONY("BALCONY", "building"),
    BATHS("BATHS", "holidays"),
    BEDS("BEDS", "bed"),
    AC("AIR CONDITIONER", "air-conditioner"),
    GYM("GYM", "weightlifting"),
    POOL("POOL", "people-2"), //pool theme class
    PARKING("PARKING", "transport"),
    TELEPHONE("TELEPHONE", "telephone"),
    WIFI("WIFI", "wifi")


    private static Map<String, PropertyFeature> valuesMap = new HashMap<String, PropertyFeature>()
    static {
        for (PropertyFeature feature: values()) {
            valuesMap.put(feature.value, feature)
        }
    }

    private final String value
    private final String code

    PropertyFeature(String value, String code) {
        this.value = value
        this.code = code
    }

    String value() { value }
    String code() { code }

    public static PropertyFeature getByValue(String val) {
        return valuesMap.get(val)
    }
}