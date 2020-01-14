(function(user_password_js) {
    user_password_js(window.jQuery, window, document);

}(function($, window, document) {

    $(function() {

        var _form_submit_property = $('.js-submit-property');
        var _filter_province_list = $('.js-filter-province-list');
        var _select_regency_list = $('.js-filter-regency-list select');
        var _select_property_status = $('#status');
        var _select_property_type = $('#type');

        var _field_total_room = $('#totalRoom');
        var _field_total_bath_room = $('#totalBathRoom');
        var _field_total_bed_room = $('#totalBedRoom');
        var _field_building_age = $('#buildingAge');
        var _feature_option = $('.js-feature-option');


        //Filter province and regency
        _filter_province_list.on('change', function () {
            var _this = $(this).children("option:selected");
            var _url = $(this).data('url') + _this.val();

            $.ajax({
                type: "POST",
                url: _url
            }).done(function (response) {
                if (response.success === true) {
                    _select_regency_list.empty();

                    $.each(response.data.regencyList, function (i, item) {
                        $(_select_regency_list).append($('<option></option>').attr('value', item.code).text(item.name));
                    });

                    $(_select_regency_list).selectpicker('refresh');
                }
            })
        });

        $(document).ready(function(){
            $('.input-images').imageUploader();
        });

        // _select_property_status.on('change', function () {
        //     var _this = $(this).children("option:selected");
        // });

        //Disable some field while property Land selected
        _select_property_type.on('change', function () {
            var _val = $(this).val();
            if (_val === 'Tanah' || _val === '5' || _val === 'LAND') {
                $(_field_total_room).attr('disabled', true);
                $(_field_total_bath_room).attr('disabled', true);
                $(_field_total_bed_room).attr('disabled', true);
                $(_field_building_age).attr('disabled', true);
                $(_feature_option).attr('disabled', true);

                $('.js-error-total-room').addClass("hide");
                $('.js-error-total-bath-room').addClass("hide");

            } else {
                $(_field_total_room).removeAttr('disabled');
                $(_field_total_bath_room).removeAttr('disabled');
                $(_field_total_bed_room).removeAttr('disabled');
                $(_field_building_age).removeAttr('disabled');
                $(_feature_option).removeAttr('disabled');
            }
        });

        _form_submit_property.validate({

            // rules: {
            //     title: {
            //         required: true
            //     }
            // },
            errorClass: "o-form-error",
            focusInvalid: true,
            errorPlacement: function (error, element) {
                var name = element.attr('name');
                if (name === 'title') {
                    error.appendTo($('.js-error-property-title'));
                } else if (name === 'status') {
                    error.appendTo($('.js-error-property-status'));
                } else if (name === 'type') {
                    error.appendTo($('.js-error-property-type'));
                } else if (name === 'state' ) {
                    error.appendTo($('.js-error-property-state'));
                } else if (name === 'price') {
                    error.appendTo($('.js-error-property-price'));
                } else if (name === 'totalRoom') {
                    error.appendTo($('.js-error-total-room'));
                } else if (name === 'totalBathRoom') {
                    error.appendTo($('.js-error-total-bath-room'));
                } else if (name === 'address') {
                    error.appendTo($('.js-error-property-address'));
                } else if (name === 'postalCode') {
                    error.appendTo($('.js-error-property-zip'));
                } else if (name === 'userAvatar') {
                    error.appendTo($('.js-error-image-placement'));
                } else {
                    error.insertAfter(element);
                }
            },
            highlight: function (element) {
                var _elm_name = $(element).attr('name');
                $(element).addClass('form-has-error');
            },
            success: function (label, element) {
                $(element).removeClass('form-has-error');
            },
            submitHandler: function (form) {
                form.submit();
            }
        });

    });

}));