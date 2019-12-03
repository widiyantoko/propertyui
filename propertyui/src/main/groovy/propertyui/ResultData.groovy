package propertyui

class ResultData {
    Boolean success
    String status
    String message
    List<Object> errors
    Object data

    String flashError
    String flashMessage

    ResultData() {
        this.success = true
        this.errors = new ArrayList<>()
    }

    ResultData(Boolean success, String message) {
        this.errors = new ArrayList<>()
        this.success = success
        this.message = message
    }

    ResultData(Boolean success, Object data) {
        this.errors = new ArrayList<>()
        this.success = success
        this.data = data
    }

    ResultData(Boolean success, String status, String message) {
        this.errors = new ArrayList<>()
        this.success = success
        this.status = status
        this.message = message
    }

    ResultData(Boolean success, String status, String message, List<Object> errors, Object data) {
        this.success = success
        this.status = status
        this.message = message
        this.errors = errors
        this.data = data
    }

    public HashMap<String, Object> getResult() {
        return [
                success: this.success,
                status: this.status,
                message: this.message,
                errors: this.errors,
                data: this.data
        ]
    }
}
