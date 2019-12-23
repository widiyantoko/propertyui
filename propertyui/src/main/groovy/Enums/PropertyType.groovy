package Enums

enum PropertyType {
    HOME("Rumah", "1"),
    OFFICE("Kantor", "2"),
    APARTMENT("Apartmen", "3"),
    RUKO("Ruko", "4"),
    LAND("Tanah", "5")

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