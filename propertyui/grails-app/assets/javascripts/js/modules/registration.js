(function (registration_js) {
    registration_js(window.jQuery, window, document);

}(function ($, window, document) {

    $(function () {
       var _registration_form = $('.js-registration-form');
       var _email_reg = _registration_form.find('input[name="email"]');

        _registration_form.validate({

            rules: {
                email : {
                    required: true,
                    email: true,
                    remote: {
                        url: _email_reg.data('url-remote'),
                        type: "POST",
                        data: {
                            email: function () {
                                return _email_reg.val();
                            }
                        }
                    }
                }
            },
            errorClass: "o-form-error",
            errorPlacement: function(error, element) {
                var name = element.attr('name');
                if(name === 'title' || name === 'firstName' || name === 'lastName') {
                    error.appendTo($('.js-error-name-placement'));
                }else if(name === 'acceptTnc'){
                    error.insertAfter($('.checkbox'));
                }else{
                    error.insertAfter(element);
                }
            },
            highlight: function (element) {
                var _elm_name = $(element).attr('name');
                if(_elm_name === 'acceptTnc') {
                    $(element).next().addClass('check-has-error');
                } else {
                    $(element).addClass('form-has-error');
                }
            },
            success: function (label, element) {
                var _elm_name = $(element).attr('name');
                if(_elm_name === 'acceptTnc') {
                    $(element).next().removeClass('check-has-error');
                } else {
                    $(element).removeClass('form-has-error');
                }
            },
            invalidHandler: function (event, validator) {
                var errors = validator.numberOfInvalids();
                if(errors) {
                    $('.js-alert-container').removeClass('hide');
                }
            },
            submitHandler: function(form) {
                form.submit();
            }

        });

        _email_reg.on('keyup', function(){
            _replace_current_msg($(this));
        });

    });

}));
