package Enums

enum PropertyStatus {
    SALE("Jual"),
    RENT("Sewa")

    private final String value

    PropertyStatus(String value) {
        this.value = value
    }

    String value() { value }
}