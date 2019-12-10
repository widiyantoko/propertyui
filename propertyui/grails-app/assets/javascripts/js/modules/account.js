(function (account_js) {
    account_js(window.jQuery, window, document);

}(function ($, window, document) {

    $(function () {

        $('.js-verify-email').on('click', function () {
            var _this = $(this);
            var _modalVerifyEmail = $('.modal-verification-email');

            $.ajax({
                method: "post",
                dataType: "json",
                url: _this.data('action'),
                success: function (response) {
                    var message = response.message;
                    _modalVerifyEmail.find('.modal-right-content').html(message);
                    _modalVerifyEmail.modal("show");
                },
                error: function (error) {
                    alert(error);
                }
            });

        });
    });

}));
