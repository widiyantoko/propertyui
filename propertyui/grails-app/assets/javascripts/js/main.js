// Custom email validator
$.validator.methods.email = function( value, element ) {
    return this.optional( element ) || /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test( value );
};

$.validator.addMethod("emails", function(value, element) {
    var response = true;
    var i;
    for (i in value) {
        if (! /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test( value[i] )) {
            var _current_msg = $(element).attr('data-msg-emails');
            var _str_to_replace = _extract_text(_current_msg);
            $(element).data('msg-emails', _current_msg.replace(_str_to_replace, '"' + value[i] + '"'));
            response = false;
        }
    }
    return response;
}, $.validator.format('Email "{0}" is invalid.'));

var _extract_text = function(str) {
    var pattern = /".*?"/g;
    var ret = pattern.exec(str);
    return ret;
};

var _replace_current_msg = function(elm) {
    var _de = elm.val();
    var _current_msg = elm.data('msg-email');
    var _str_to_replace = _extract_text(_current_msg);
    elm.data('msg-email', _current_msg.replace(_str_to_replace, '"' + _de + '"'));
};