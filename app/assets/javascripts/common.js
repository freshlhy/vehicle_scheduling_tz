jQuery(document).ready(function ($) {
    $('.left .nav li').hover(function () {
        $(this).addClass('hover');
    }, function () {
        $(this).removeClass('hover');
    });

    $('table tbody tr').hover(function () {
        $(this).addClass('hover');
    }, function () {
        $(this).removeClass('hover');
    });

    $('a').focus(function () {
        this.blur();
    });
});