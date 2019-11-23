(function (login_js) {
    login_js(window.jQuery, window, document);

}(function ($, window, document) {

    $(function () {

        var _login_form = $('.js-login-form');

        _login_form.validate({
            onfocusout: false,
            onkeyup: false,
            rules: {
                username: {
                    require_from_group:[2, ".login-input"]
                },
                password: {
                    require_from_group:[2, ".login-input"]
                }
            },
            errorClass: "o-form-error",
            errorPlacement: function (error) {
                var _error_elem = $('.js-validation-error-container');
                var _parent_error_elem = _error_elem.parents();
                var _alert_elm = _parent_error_elem.find('.alert');
                if (_alert_elm.length > 0 ) {
                    _alert_elm.remove();
                }
                _error_elem.html(error);
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
    });

}));
