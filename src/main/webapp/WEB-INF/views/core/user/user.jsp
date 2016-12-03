<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <ol class="breadcrumb">
        <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="active">用户管理</li>
    </ol>
</div><!--/.row-->

<div id="userManager" class="row">
    <!--工具条-->
    <div id="toolbar" class="btn-group">
        <button id="user-add" class="btn btn-primary">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="user-edit" class="btn btn-success">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
    </div>
    <table id="userManagerTable"></table>
</div>

<!-- 编辑 -->
<c:import url="edit.jsp" />

<!-- 新增 -->
<c:import url="add.jsp" />

<script type="text/javascript">
    ;(function($, win) {
        $(function () {
            /**-----------------------------------------------------------
             *  定义常量 start
             *-----------------------------------------------------------*/
            var ROLE_URL = "/core/role";
            var USER_URL = "/core/user";
            var USERNAME_IS_AVAILABLE_URL = "/core/user/usernameIsAvailable";
            /**-----------------------------------------------------------
             *  定义常量 end
             *-----------------------------------------------------------*/

            /**-----------------------------------------------------------
             *  bootstrapTable init start
             *-----------------------------------------------------------*/
            // 服务端返回的分页信息要包含total(总共的记录数)，rows节点（分页后数据，list等）
            $('#userManagerTable').bootstrapTable({
                url: USER_URL,
                method: "get",
                dataType: "json",
                dataField: "list",//服务端返回数据键值,
                sortable: true,// 是否排序
                sortOrder: "asc", //排序方式
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                toolbar: '#toolbar',//工具按钮用哪个容器
                uniqueId: "id",//每一行的唯一标识，一般为主键列
                striped: false,  //表格显示条纹
                pagination: true, //启动分页
                pageSize: 10,  //每页显示的记录数
                pageNumber: 1, //当前第几页
                pageList: [10, 15, 20, 25],  //记录数可选列表
                search: true,  //是否启用查询
                searchOnEnterKey: true,//回车搜索
                showColumns: true,  //显示下拉框勾选要显示的列
                showRefresh: true,  //显示刷新按钮
                sidePagination: "server", //表示服务端请求，
                clickToSelect: true,//是否启用点击选中行
                showToggle: true,
                //设置为limit可以获取limit, offset, search, sort, order
                queryParamsType : "limit",
                queryParams: function queryParams(params) {   //设置查询参数
                    console.log(params);
                    var sort = params.sort;
                    var order = params.order;
                    if (sort == "role.name") {
                        sort = "role_id";
                    }
                    var param = {
                        current: (params.offset / params.limit) + 1,
                        size: params.limit,
                        orderBy: (sort != undefined && order != undefined) ? humpToLine(sort) + " " + order : "id desc",
                        username: (params.search == undefined || params.search.trim() == '') ? undefined : params.search
                    };
                    return param;
                },
                cardView: false,//是否显示详细视图
//                clickToSelect: true,//是否启用点击选中行
                columns: [
                    {
                        title: "全选",
                        field: "select",
                        checkbox: true,
                        width: 20,//宽度
                        align: "center",//水平
                        valign: "middle"//垂直
                    },
                    {
                        title: "ID",//标题
                        field: "id",//键名
                        sortable: true,//是否可排序
                        order: "desc"//默认排序方式
                    },
                    {
                        field: "username",
                        title: "用戶名",
                        sortable: true,
                        titleTooltip: "用戶名"
                    },
                    {
                        field: "attemptTimes",
                        title: "登录失败尝试次数",
                        sortable: true,
                        titleTooltip: "用户登录失败尝试次数"
//                        editable: {
//                            type: 'text',
//                            title: '请输入用户登录失败尝试次数',
//                            validate: function (v) {
//                                if (!v) return '不能为空';
//                            }
//                        }
                    },
                    {
                        field: "lastAttemptDate",
                        title: "最后一次登录尝试时间",
                        sortable: true,
                        titleTooltip: "用户最后一次登录尝试时间",
                        formatter: dateFormatter//对本列数据做格式化
                    },
                    {
                        field: "accountExpiredDate",
                        title: "账号过期时间",
                        sortable: true,
                        titleTooltip: "用户账号过期时间",
                        formatter: dateFormatter//对本列数据做格式化
                    },
                    {
                        field: "credentialsExpiredDate",
                        title: "密码过期时间",
                        sortable: true,
                        titleTooltip: "用户密码过期时间",
                        formatter: dateFormatter//对本列数据做格式化
                    },
                    {
                        field: "enable",
                        title: "用户是否可用",
                        sortable: true,
                        titleTooltip: "用户是否可用"
                    },
                    {
                        field: "role.name",
                        title: "角色名",
                        sortable: true,
                        titleTooltip: "用户角色"
                    }
//                    {
//                        field: "operation",
//                        title: "操作",
//                        sortable: false,
//                        titleTooltip: "用户操作"
//                    }
                ],
                locale: "zh-CN",//中文支持,
                detailView: false, //是否显示详情折叠
                detailFormatter: function(index, row, element) {
                    var html = '';
                    $.each(row, function(key, val){
                        if (key != "password" && key != "select") {
                            html += "<p>" + key + ":" + val + "</p>"
                        }
                    });
                    return html;
                },
                responseHandler: function(res) {
                    console.log(res);
                    return res;
                }
//                editable:true//开启编辑模式
//                onEditableSave: function (field, row, oldValue, $el) {
//                    console.log(field);
//                    console.log(row);
//                    console.log(oldValue);
//                    console.log($el);
//                }
            });

            // 修改搜索框中的placeholder
            $('.search .form-control').attr('placeholder', '请输入用户名:');

            /**
             * 格式化
             *
             * @param value 值
             * @param row 行
             * @param index 索引
             * @returns {string}
             */
            function dateFormatter(value, row, index) {
                if (value == undefined || value == '') {
                    return "";
                }
                return new Date(value).Format("yyyy-MM-dd");
            }

            /**
             * 驼峰转下划线
             *
             * @param word
             */
            function humpToLine(word) {
                return word.replace(/([A-Z])/g,"_$1").toLowerCase();
            }

//            function operationFormatter(value, row, index) {
//                var html = "";
//                html += "<button class='btn btn-default btn-sm user-edit'>编辑</button>&nbsp;";
//                if (row.enable) {
//                    html += "<button class='btn btn-danger btn-sm user-disable'>禁用</button>"
//                } else {
//                    html += "<button class='btn btn-danger btn-sm user-enable'>启用</button>"
//                }
//                return html;
//            }
            /**-----------------------------------------------------------
             *  bootstrapTable init end
             *-----------------------------------------------------------*/



            /**-----------------------------------------------------------
             *  修改 start
             *-----------------------------------------------------------*/
            /**
             * 修改按钮
             */
            $('#user-edit').on('click', function() {
                var rows = $('#userManagerTable').bootstrapTable('getSelections');
                if (rows.length != 1) {
                    alert("请选中一行");
                    return;
                }
                $('#user-edit-id').text(rows[0].id);
                $('#user-edit-username').text(rows[0].username);
                $('#user-edit-attemptTimes').val(rows[0].attemptTimes);
                $('#user-edit-lastAttemptDate').text(dateFormatter(rows[0].lastAttemptDate));
                $('#user-edit-accountExpiredDate').val(dateFormatter(rows[0].accountExpiredDate));
                $('#user-edit-credentialsExpiredDate').val(dateFormatter(rows[0].credentialsExpiredDate));
                $('#user-edit-enable').val(rows[0].enable?1:0);

                // 加载角色
                var $roleSelectEle = $('#user-edit-roleId');
                if (!$roleSelectEle.html().trim()) {
                    $.getJSON(ROLE_URL, function (result) {
                        $.each(result.list, function (index, item) {
                            var $optionEle = "<option value='" + item.id + "'>" + item.name + "</option>";
                            $roleSelectEle.append($optionEle);
                        });
                        // 显示用户当前角色
                        $roleSelectEle.val(rows[0].roleId);
                    });
                } else {
                    // 显示用户当前角色
                    $roleSelectEle.val(rows[0].roleId);
                }

                // 显示modal
                $('#user-edit-modal').modal({backdrop: "static", keyboard: false});
            });

            /**
             *  编辑保存
             */
            $('#user-edit-submit').on('click', function (e) {
                var id = $('#user-edit-id').text();
                var username = $('#user-edit-username').text();
                var attemptTimes = $('#user-edit-attemptTimes').val();
                var lastAttemptDate = $('#user-edit-lastAttemptDate').text();
                var accountExpiredDate = $('#user-edit-accountExpiredDate').val();
                var credentialsExpiredDate = $('#user-edit-credentialsExpiredDate').val();
                var enable = $('#user-edit-enable').val() == 1;
                var roleId = $('#user-edit-roleId').val();
                var user = {
                    id: id,
                    attemptTimes: attemptTimes,
                    accountExpiredDate: accountExpiredDate,
                    credentialsExpiredDate: credentialsExpiredDate,
                    enable: enable,
                    roleId: roleId
                };
                $.ajax({
                    url: USER_URL,
                    method: "PUT",
                    data: JSON.stringify(user),
                    contentType: "application/json",
                    dataType: "JSON"
                }).done(function(data) {
                    if (data.flag) {
                        alert("修改成功");
                        $('#user-edit-reset').click();
                        // 更新bootstrapTable
                        var row = {
                            id: id,
                            username: username,
                            attemptTimes: attemptTimes,
                            lastAttemptDate: lastAttemptDate==""?undefined:lastAttemptDate,
                            accountExpiredDate: accountExpiredDate,
                            credentialsExpiredDate: credentialsExpiredDate,
                            enable: enable,
                            roleId: roleId,
                            role: {
                                name: $('#user-edit-roleId').find('option:selected').text()
                            }
                        };
                        console.log(row);
                        $('#userManagerTable').bootstrapTable('updateByUniqueId', {id: id, row: row});
                    } else {
                        alert("修改失败");
                        console.log(data.msg);
                    }
                }).fail(function(e) {
                    alert("修改失败");
                    console.log(e);
                });
            });
            /**-----------------------------------------------------------
             *  修改 end
             *-----------------------------------------------------------*/


            /**-----------------------------------------------------------
             *  新增 start
             *-----------------------------------------------------------*/
            $('#user-add').on('click', function() {
                // 初始化角色下拉框
                var $roleSelectEle = $('#user-add-roleId');
                if (!$roleSelectEle.html().trim()) {
                    $.getJSON(ROLE_URL, function (result) {
                        $.each(result.list, function (index, item) {
                            var $optionEle = "<option value='" + item.id + "'>" + item.name + "</option>";
                            $roleSelectEle.append($optionEle);
                        });
                    });
                }
                // 显示modal
                $('#user-add-modal').modal({backdrop: "static", keyboard: false});
            });

            /**
             * 校验
             */
            $('#user-add-form').bootstrapValidator({
                message: '请填写字段',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 18,
                                message: '用户名长度必须在6到18位之间'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_]+$/,
                                message: '用户名只能包含字母、数字和下划线'
                            },
                            remote: {
                                url: USERNAME_IS_AVAILABLE_URL,
                                message: "用户名已存在",
                                type: 'GET',
                                delay: 2000
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '密码长度必须在6到18位之间'
                            }
                        }
                    },
                    repeatPassword: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '密码长度必须在6到18位之间'
                            },
                            identical: {
                                field: "password",
                                message: "两次密码不同"
                            }
                        }
                    },
                    accountExpiredDate: {
                        validators: {
                            notEmpty: {
                                message: '请输入账号过期时间'
                            },
                            date: {
                                format: 'YYYY-MM-DD',
                                message: '日期格式不正确'
                            }
                        }

                    },
                    credentialsExpiredDate: {
                        validators: {
                            notEmpty: {
                                message: '请输入密码过期时间'
                            },
                            date: {
                                format: 'YYYY-MM-DD',
                                message: '日期格式不正确'
                            }
                         }
                    }
                },
                /**
                 * @param validator: The instance of BootstrapValidator
                 * @param form: Representing the current form
                 * @param submitButton: Representing the submit button which is clicked
                 */
                submitHandler: function (validator, form, submitButton) {
                    // 无法解决表单自动提交！！！
                }
            });

            // 新增保存按钮
            $('#user-add-submit').on('click', function(e) {
                var $userAddForm = $('#user-add-form');
                if (!$userAddForm.data('bootstrapValidator').isValid()) {
                    $userAddForm.data('bootstrapValidator').validate();
                    $userAddForm.data('bootstrapValidator').disableSubmitButtons(true);
                    return;
                }
                e.preventDefault();
                var user = {
                    username: $('#user-add-username').val(),
                    password: $('#user-add-password').val(),
                    accountExpiredDate: $('#user-add-accountExpiredDate').val(),
                    credentialsExpiredDate: $('#user-add-credentialsExpiredDate').val(),
                    roleId: $('#user-add-roleId').val(),
                    enable: true
                };
                // 提交
                $.ajax({
                    url: USER_URL,
                    method: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    data: JSON.stringify(user)
                }).done(function(result) {
                    if (result.flag) {
                        alert("新增成功");
                        // 关闭modal
                        $('#user-add-modal').modal('hide');
                        // 重置表单
                        $userAddForm[0].reset();
                        // 重置表单校验
                        $userAddForm.data('bootstrapValidator').resetForm();

                        // 在table中插入数据，避免刷新
                        var user = result.msg;
                        user.role = {
                            name: $('#user-add-roleId').find('option:selected').text()
                        };
                        $('#userManagerTable').bootstrapTable('insertRow', {index: 0, row: user});

                    } else {
                        alert("新增失败：" + result.msg);
                    }
                }).fail(function (e) {
                    alert("新增失败：" + e);
                })
            });

            /**
             * 选择时间后调用校验，否则bootstrapValidator不起作用
             */
            $('#user-add-accountExpiredDate').change(function() {
                $('#user-add-form').data('bootstrapValidator')
                        .updateStatus('accountExpiredDate', 'NOT_VALIDATED', null)
                        .validateField('accountExpiredDate').validate();
            });
            $('#user-add-credentialsExpiredDate').change(function() {
                $('#user-add-form').data('bootstrapValidator')
                        .updateStatus('credentialsExpiredDate', 'NOT_VALIDATED', null)
                        .validateField('credentialsExpiredDate').validate();
            });
            /**-----------------------------------------------------------
             *  新增 end
             *-----------------------------------------------------------*/


            /**-----------------------------------------------------------
             *  绑定日期控件 start
             *-----------------------------------------------------------*/
            /**
             * 日期控件
             */
            $('#user-edit-accountExpiredDate, #user-edit-credentialsExpiredDate,' +
                    '#user-add-accountExpiredDate, #user-add-credentialsExpiredDate').datetimepicker({
                format: 'yyyy-mm-dd',
                language: "zh-CN",
                todayBtn:  1,
                autoclose: 1,
                minView: "month" //选择日期后，不会再跳转去选择时分秒
            });

            /**
             * 扩展Date的原型
             * 增加Format方法
             */
            Date.prototype.Format = function (fmt) { //author: meizz
                var o = {
                    "M+": this.getMonth() + 1, //月份
                    "d+": this.getDate(), //日
                    "h+": this.getHours(), //小时
                    "m+": this.getMinutes(), //分
                    "s+": this.getSeconds(), //秒
                    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                    "S": this.getMilliseconds() //毫秒
                };
                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                return fmt;
            };
            /**-----------------------------------------------------------
             *  绑定日期控件 end
             *-----------------------------------------------------------*/

        });
    })(jQuery, window);
</script>
