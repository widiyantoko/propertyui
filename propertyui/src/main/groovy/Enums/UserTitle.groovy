package Enums

enum UserTitle {

    MR("Mr."),
    MRS("Mrs."),
    DR("Dr."),
    MS("Ms.")

    private final String value

    UserTitle(String value) {
        this.value = value
    }

    String value() { value }

    static List<String> getTitles() {
        List<String> ls = new ArrayList<>()
        def liz = UserTitle.values().toList()
        liz.each { UserTitle ut ->
            ls.add(ut.value())
        }
        return ls
    }

}