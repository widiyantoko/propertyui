package utils

class SecurityUtils {
    public static final String ROLE_ADMIN = "ROLE_ADMIN"
    public static final String ROLE_IT_SUPPORT = "ROLE_IT_SUPPORT"
    public static final List<String> ADMIN_ROLES = new ArrayList<String>() {{
        add(ROLE_ADMIN)
        add(ROLE_IT_SUPPORT)
    }}
}
