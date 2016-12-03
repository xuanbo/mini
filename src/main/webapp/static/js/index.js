(function ($) {
    $(function () {
        $(window).on('resize', function () {
            if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
        });
        $(window).on('resize', function () {
            if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
        });

        // 加载菜单
        $("#sidebar-collapse").menu({
            uri: "/core/menu/selectByParentId",
            contentId: "menuContent"
        });
    });
})(jQuery);