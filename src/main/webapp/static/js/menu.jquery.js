/**
 * 懒加载菜单插件
 */
;(function($, window, document, undefined) {
    $.fn.menu = function(options) {
        var loaderMenu = new LoaderMenu(this, options);
        loaderMenu.init();
        return this;
    };

    var LoaderMenu = function(elements, options) {
        this.$element = elements;
        this.defaults = {
            show: "slow",
            contentId: "menuContent"
        };
        this.options = $.extend({}, this.defaults, options);
    };

    LoaderMenu.prototype = {
        /*
            初始化
         */
        init: function() {
            this.loadMenus(this.options.uri);
        },
        /*
            根据数据创建菜单
            data: 数据
            element: 在哪个元素下创建子菜单
         */
        builder: function(data, element) {
            var _this = this;
            if (data.length == 0) {
                return;
            }
            var $ul_element = $("<ul class='nav menu'></ul>");
            $.each(data, function(index, item) {
                console.log(item);
                var $li_element = $("<li></li>");
                var $a_element = $("<a><span class='" + item.icon + "'></span>" + item.menuName + "</a>");
                var href = item.url;
                $a_element.data("id", item.id);
                $li_element.append($a_element);
                $ul_element.append($li_element);
                _this.addEvent($a_element);
                // 为父级元素添加折叠图标
                if (href === "") {
                    var $span_element = $("<span data-toggle='collapse' class='icon pull-right'>" +
                        "<em class='glyphicon glyphicon-s glyphicon-plus'></em></span>");
                    $a_element.append($span_element);
                    $a_element.attr("href", "#");
                    $li_element.addClass('parent');
                } else {
                    $a_element.attr("href", href);
                }
            });
            element === undefined ? _this.$element.append($ul_element) : element.after($ul_element);
        },
        /*
            根据uri获取menu json数据
            uri： 请求路路径
            element： 在哪个元素下生成子菜单
         */
        loadMenus: function(uri, element) {
            var _this = this;
            $.getJSON(uri, function(data) {
                _this.builder(data, element);
            });
        },
        /*
            为菜单元素绑定事件
            element： 增加点击事件的元素
         */
        addEvent: function(element) {
            var _this = this;
            element.on("click", function(e) {
                e.preventDefault();
                var href = $(this).attr('href');
                // 点击链接
                if (href != '#') {
                    $.get(href, function(data) {
                        $('#' + _this.options.contentId).html(data);
                    }, 'html');
                    return;
                }
                var $ul = element.next();
                if (!$ul.html()) {
                    var id = element.data("id");
                    _this.loadMenus(_this.options.uri + "?parentId=" + id, element);
                } else {
                    $ul.slideToggle(_this.options.show);
                }
            });
        }
    };
})(jQuery, window, document);