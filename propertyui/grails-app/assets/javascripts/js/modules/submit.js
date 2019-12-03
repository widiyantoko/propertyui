(function(user_password_js) {
    user_password_js(window.jQuery, window, document);

}(function($, window, document) {

    $(function() {

        var _form_submit_property = $('.js-submit-property');
        var _filter_province_list = $('.js-filter-province-list');
        var _select_regency_list =$('.js-filter-regency-list select');

        _filter_province_list.on('change', function () {
            var _this = $(this).children("option:selected");
            var _url = _this.data('url');

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


        _form_submit_property.validate({


        });

    });

}));