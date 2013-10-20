jQuery(document).ready(function ($) {
    $('table tbody tr').hover(function () {
        $(this).addClass("tr-hover");
    }, function () {
        $(this).removeClass("tr-hover");
    });
});

