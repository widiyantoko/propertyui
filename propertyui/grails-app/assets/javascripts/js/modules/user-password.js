(function(user_password_js) {
    user_password_js(window.jQuery, window, document);

}(function($, window, document) {

    $(function() {

        // forgot password
        var _forgot_password_form = $('.js-forgot-password-form');
        var _email_forgot = _forgot_password_form.find('input[name="email"]');

        _forgot_password_form.validate({
            errorClass: "o-form-error",
            rules: {
                email: {
                    required: true,
                    email: true,
                    remote: {
                        url: _email_forgot.data('url-remote'),
                        type: "post",
                        data: {
                            email: function() {
                                return _email_forgot.val();
                            }
                        }
                    }
                }
            },
            highlight: function(element) {
                $(element).addClass('form-has-error');
            },
            success: function (label, element) {
                $(element).removeClass('form-has-error');
            },
            submitHandler: function(form) {
                form.submit();
            }
        });

        _email_forgot.on('keyup', function(){
            _replace_current_msg($(this));
        });
        //end forgot password

    });

}));