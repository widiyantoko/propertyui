package Enums

enum PropertyType {
    HOME("Home", "1"),
    OFFICE("Office", "2"),
    APARTMENT("Apartment", "3"),
    RUKO("Ruko", "4"),
    LAND("Land", "5")

    private static Map<String, PropertyType> valuesMap = new HashMap<String, PropertyType>()
    static {
        for (PropertyType type: values()) {
            valuesMap.put(type.value, type)
        }
    }

    private final String value
    private final String code

    PropertyType(String value, String code) {
        this.value = value
        this.code = code
    }

    String value() { value }
    String code() {code}

    public static PropertyType getByValue(String val) {
        return valuesMap.get(val)
    }

}