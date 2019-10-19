package Enums

enum PropertyFeature {

    TV("TV", "tv"),
    GARAGE("GARAGE", "garage"),
    BALCONY("BALCONY", "balcony"),
    BATHS("BATHS", "baths"),
    BEDS("BEDS", "beds"),
    AC("AIR CONDITIONER", "airconditioner"),
    GYM("GYM", "gym"),
    POOL("POOL", "pool"),
    PARKING("PARKING", "parking"),
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