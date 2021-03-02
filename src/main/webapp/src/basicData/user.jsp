<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-6-22
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>人员信息</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../components/font-awesome/css/font-awesome.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="../../assets/css/ace-fonts.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="../../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <link rel="stylesheet" href="../../assets/css/ace-skins.css"/>
    <link rel="stylesheet" href="../../assets/css/ace-rtl.css"/>

    <link rel="stylesheet" href="../../css/table.css"/>
    <link rel="stylesheet" href="../../css/fontstyle.css"/>
    <link rel="stylesheet" href="../../css/tree.css"/>

    <script src="../../assets/js/ace-extra.js"></script>
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->


<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs ace-save-state" id="breadcrumbs" style="background-color: white">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>基础数据
                    </li>
                    <li class="active">人员信息维护</li>
                </ul>

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form>
                            <div style="border: 1px solid rgb(221, 221, 221);height:60px;padding-top: 13px;min-width: 800px">
                                <table style="font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 500px;margin: auto"
                                       border="0">
                                    <td>
                                        姓名：<input id="sysuserSelectName"
                                                  name="sysuserSelectName" type="text" maxlength="64">
                                        <a style="padding-left: 10px"></a>
                                        组织机构：
                                        <input type="text" id="sysuserSelectDepartmentName" readonly="readonly"
                                               style="width: 163px" value="">
                                    </td>
                                    <td style="padding-left: 5px;width: 150px">
                                        <button type="button" id="sysuserSelectButton"
                                                name="sysuserSelectButton" class="btn btn-info btn-xs"
                                                style="margin-top: 0px">
                                            <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                        </button>&nbsp;
                                        <button type="button" id="sysuserCleanButton" name="sysuserCleanButton"
                                                class="btn btn-xs btn-purple" style="width: 54.3px">
                                            <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                        </button>
                                    </td>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px">
                        <table id="simple-table" class="table  table-bordered table-hover">
                            <thead>

                            <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                                <label  style="padding: 6px;font-size: 12px">&nbsp;人员信息列表</label>
                                <span style="float:right;padding-right: 5px">
                                        <button id="sysuserInsertButton" name="sysuserInsertButton"
                                                class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-check"></i>
                                        新增</button>
                                        <button id="sysuserDeleteButton" name="sysuserDeleteButton"
                                                class="btn btn-xs  btn-danger">
                                        <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                        删除</button>
                                        </span>
                            </div>
                            <tr style="height: 30px" id="firstColumn">
                                <th class="center" style="width: 50px">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>

                                <th width="50px" style="text-align: center">序号</th>
                                <th>姓名</th>
                                <th>登录名</th>
                                <th>组织机构</th>
                                <th style="text-align: center">是否为业务负责人</th>
                                <th>角色</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="sysuserTable">
                            </tbody>
                        </table>
                        <div class="padlr" align="right">
                            <ul id="data-pagination" class="pagination">
                            </ul>
                        </div>
                    </div><!-- /.span -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!--表单 -->
<div class="row" id="addForm" style="display: none;margin: 20px;font-family:'微软雅黑' ">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            人员信息维护
        </h4>
    </div>
    <form class="form-horizontal" role="form" style="margin-top: 20px" id="userform">
        <div class="form-group">

            <label class="col-sm-3 control-label no-padding-right" for="name">姓名： </label>
            <div class="col-sm-9">
                <input id="id" hidden="hidden">
                <input type="text" maxlength="64" id="name" name="name" class="col-xs-9">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="userName">登录名： </label>
            <div class="col-sm-9">
                <input type="text" maxlength="64" id="userName" name="userName" class="col-xs-9" title="登录名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="passWord">密码： </label>
            <div class="col-sm-9">
                <input type="password" maxlength="64" id="passWord" name="passWord" class="col-xs-9" title="密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right">组织机构： </label>
            <div class="col-sm-9">
                <%--<input type="text" id="departmentId" class="col-xs-9" style="width: 75%;" readonly="readonly" value="">--%>
                <div class="input-group" style="width: 75%;">
                    <input type="text" class="form-control search-query" id="department_id" name="department_id"
                           value="" readonly="readonly">
                    <span class="input-group-addon" id="changDept" style="cursor: pointer">
							<i class="ace-icon fa fa-check"></i>
						</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="roleId">角色： </label>
            <div class="col-sm-9">
                <select class="chosen-select form-control" id="roleId" name="roleId" class="col-xs-9"
                        style="width: 75%;">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="info">备注： </label>
            <div class="col-sm-9">
                <textarea class="form-control" id="info" style="width: 75%;height: 60px"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="sysUserId">业务负责人： </label>
            <div class="col-sm-9">
                <label class="middle" style="padding-top: 10px">
                    <input class="ace" type="checkbox" id="sysUserId" name="sysUserId">
                    <span class="lbl"></span>
                </label>
            </div>
        </div>
    </form>

</div>

<%--树形控件--%>

<div class="row" id="addFormForDepartmentSelect" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            选择部门
        </h4>
    </div>

    <div class="widget-body">
        <div class="widget-main padding-8">
            <ul id="treeview"></ul>
        </div>
    </div>
</div>

<div id="Win_Role_QuanXian" style="padding: 15px;display: none">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密码管理员授权
        </h4>
    </div>
    <table id="role_table" class="table  table-bordered table-hover" style="font-family:'微软雅黑' ">
        <thead>
        <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
            <label style="padding: 6px;font-size: 12px">密码管理员权限</label>
        </div>
        <tr style="height: 30px">
            <th width="50px" style="text-align: center">序号</th>
            <th width="30%" style="text-align: center">角色</th>
            <th width="30%" style="text-align: center">菜单</th>
            <th width="30%" style="text-align: center">授权</th>
        </tr>
        </thead>
        <tbody id="quanxianTable">

        </tbody>
    </table>
</div>

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="../../components/jquery/dist/jquery.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="../../components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../../components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>
<script src="../../components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
<script src="../../components/datatables/media/js/jquery.dataTables.js"></script>
<script src="../../components/_mod/datatables/jquery.dataTables.bootstrap.js"></script>
<script src="../../components/datatables.net-buttons/js/dataTables.buttons.js"></script>
<script src="../../components/datatables.net-buttons/js/buttons.flash.js"></script>
<script src="../../components/datatables.net-buttons/js/buttons.html5.js"></script>
<script src="../../components/datatables.net-buttons/js/buttons.print.js"></script>
<script src="../../components/datatables.net-buttons/js/buttons.colVis.js"></script>
<script src="../../components/datatables.net-select/js/dataTables.select.js"></script>

<!-- page specific plugin scripts -->
<script src="../../components/_mod/fuelux/tree.js"></script>

<!-- ace scripts -->
<script src="../../assets/js/src/elements.scroller.js"></script>
<script src="../../assets/js/src/elements.colorpicker.js"></script>
<script src="../../assets/js/src/elements.fileinput.js"></script>
<script src="../../assets/js/src/elements.typeahead.js"></script>
<script src="../../assets/js/src/elements.wysiwyg.js"></script>
<script src="../../assets/js/src/elements.spinner.js"></script>
<script src="../../assets/js/src/elements.treeview.js"></script>
<script src="../../assets/js/src/elements.wizard.js"></script>
<script src="../../assets/js/src/elements.aside.js"></script>
<script src="../../assets/js/src/ace.js"></script>
<script src="../../assets/js/src/ace.basics.js"></script>
<script src="../../assets/js/src/ace.scrolltop.js"></script>
<script src="../../assets/js/src/ace.ajax-content.js"></script>
<script src="../../assets/js/src/ace.touch-drag.js"></script>
<script src="../../assets/js/src/ace.sidebar.js"></script>
<script src="../../assets/js/src/ace.sidebar-scroll-1.js"></script>
<script src="../../assets/js/src/ace.submenu-hover.js"></script>
<script src="../../assets/js/src/ace.widget-box.js"></script>
<script src="../../assets/js/src/ace.settings.js"></script>
<script src="../../assets/js/src/ace.settings-rtl.js"></script>
<script src="../../assets/js/src/ace.settings-skin.js"></script>
<script src="../../assets/js/src/ace.widget-on-reload.js"></script>
<script src="../../assets/js/src/ace.searchbox-autocomplete.js"></script>
<script src="../../layer/layer.js"></script>
<script src="../../js/bootstrap-paginator.js"></script>
<link rel="stylesheet" href="../../css/fontstyle.css"/>
<script type="text/javascript">
    jQuery(function ($) {

        //全选事件
        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
        });

        //操作事件图标
        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }

//        部门树形弹窗内容
        var nodes = {
            nodeid: null,
            nodetext: null
        }
        departmentTree();
        function departmentTree() {
            var remoteUrl = '/dept/selectByUser.action';
            var remoteDateSource = function (options, callback) {
                var self = this;
                var $data = null;
                var parent_id = 0;

                if (!('text' in options || 'type' in options)) {
                    $.ajax({
                        url: remoteUrl,
                        data: 'id=' + 0,
                        type: 'POST',
                        dataType: 'json',
                        cache: false,
                        async: false,
                        success: function (response) {
                            if (response.status == "ok") {
                                callback({data: response.data})
                            }
                        },
                        error: function (response) {
                            // alert(response.message)
                            //console.log(response);
                        }
                    })
                }
                else if ("type" in options && options.type == "folder") {
                    if ("additionalParameters" in options && "children" in options.additionalParameters)
                        $data = options.additionalParameters.children;//点击父节点，加载子节点
                    else $data = {}//no data
                }

                if ($data != null)//this setTimeout is only for mimicking some random delay
                    setTimeout(function () {
                        callback({data: $data});
                    }, parseInt(Math.random() * 500) + 200);
            }
//        $('#treeview').ace_tree({
//            dataSource: remoteDateSource,
//            multiSelect: false,
//            loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
//            'open-icon' : 'ace-icon tree-minus',
//            'close-icon' : 'ace-icon tree-plus',
//            'selectable' : true,
//            'selected-icon' : 'ace-icon fa fa-check',
//            'unselected-icon' : 'ace-icon fa fa-times',
//            cacheItems: true,
//            folderSelect: false
//        });

            $('#treeview').ace_tree({
                dataSource: remoteDateSource,
                multiSelect: false,
                loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
                'open-icon': 'ace-icon tree-minus hide',
                'close-icon': 'ace-icon tree-plus hide',
                'selectable': true,
                'selected-icon': 'ace-icon fa fa-check',
                'unselected-icon': 'ace-icon fa fa-times',
                cacheItems: true,
                folderSelect: true,
                'folder-open-icon': 'ace-icon tree-plus',
                'folder-close-icon': 'ace-icon tree-minus'
            });

            $('#treeview')
                .on('loaded.fu.tree', function (evt, data) {
                    $('#treeview').tree('discloseVisible');
//                $('#treeview').off("click");
//                $('#treeview').on("click",function () {
////                    $(".cur").remove("cur");
////                    var obj=f.target;
////                    //判断所选元素是为节点元素
////                    if(obj.className.indexOf("treepitem-name")>0){
////                        obj=obj.parentElement;
////                    }
////                    obj.className+=" cur";
////                    console.log(f.target);
////                    var data=$("treeview").tree("click");
////                    console.log(data);
//
//                });
                })
                .on('updated.fu.tree', function (e, result) {
                })
                .on('selected.fu.tree', function (e) {

                    node = $('#treeview').tree('selectedItems');
                    if (node.length == 1) {

                        nodes.nodeid = node[0].additionalParameters.id;
                        nodes.nodetext = node[0].text;
                        $("#addFormDept").attr("value", node[0].additionalParameters.id)
                    }

                })
                .on('deselected.fu.tree', function (e) {
                    nodes.nodeid = "";
                    nodes.nodetext = "";
                })
                .on('opened.fu.tree', function (e) {

                })
                .on("click.fu.tree", function (e, result) {
                })

//        //show selected items inside a modal
//        $('#submit-button').on('click', function() {
//            var output = '';
//            var items = $('#treeview').tree('selectedItems');
//            for(var i in items) if (items.hasOwnProperty(i)) {
//                var item = items[i];
//                output += item.additionalParameters['id'] + ":"+ item.text+"\n";
//            }
//
//            $('#modal-tree-items').modal('show');
//            $('#tree-value').css({'width':'98%', 'height':'200px'}).val(output);
//
//        });
//
//
//        if(location.protocol == 'file:') alert("For retrieving data from server, you should access this page using a webserver.");

        }

        $('#changDept').on('click', function () {
            department_id_click()
        });
        $('#department_id').on('click', function () {
            department_id_click()
        });
        function department_id_click() {
            layer.open({
                type: 1,
                title: '选择部门',
                shadeClose: true,
                //shade: 0.8,
                area: ['45%', '75%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success: function (layero, index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render");
                },
                yes: function (index) {
                    $("#department_id").val(nodes.nodetext);
                    $("#department_id").attr("value", nodes.nodeid);
                    layer.close(index);
                },
                btn2: function (index) {
                    layer.close(index);
                    nodes = {
                        nodeid: null,
                        nodetext: null
                    }
                }
            });
        }


        //数据初始化
        sysuserSelect();
        //查询按钮
        $('#sysuserSelectButton').on('click', function () {
            sysuserSelect(this);
        });
        var sysuserList;

        function sysuserSelect() {
            var sysuserSelectName = $('#sysuserSelectName').val();
            var sysuserSelectDepartmentName = $("#sysuserSelectDepartmentName").attr("value");
            var pageIndex = 1;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/sysuser/select.action",
                traditional: true,
                data: {
                    "sysuser": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                            "name": sysuserSelectName,
                            "departmentName": sysuserSelectDepartmentName
                        }
                        }
                    )
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    sysuserList = re.list;

                    var sysuserHtml = "";

                    for (var a = 0; a < sysuserList.length; a++) {
                        var deptManager = ""
                        if (sysuserList[a].id == sysuserList[a].deptManager) {
                            deptManager = "是";
                        }

                        var page = (re.pageIndex - 1) * 10 + a + 1;
                        var name = sysuserList[a].name == null ? "" : sysuserList[a].name;
                        var userName = sysuserList[a].userName == null ? "" : sysuserList[a].userName;
                        var departmentName = sysuserList[a].departmentName == null ? "" : sysuserList[a].departmentName;
                        var roleName = sysuserList[a].roleName == null ? "" : sysuserList[a].roleName;
                        var roleQuanxian="";
                        if(roleName=="密码管理员"){
                            roleQuanxian= "<a style='cursor:pointer;text-decoration:none' class='sysuserRoleQuanXian' value='" + a + "'> 授权 </a>| ";
                        }
                        sysuserHtml +=
                            "<tr> " +
                            "<td class='center'>" +
                            " <label class='pos-rel'> " +
                            "<input type='checkbox' class='ace'/> " +
                            "<span class='lbl'></span> " +
                            "</label> " +
                            "</td> " +
                            "<td>" + page + "</td> " +
                            "<td>" + name + "</td> " +
                            "<td>" + userName + "</td> " +
                            "<td>" + departmentName + "</td> " +
                            "<td style='text-align: center'>" + deptManager + "</td> " +
                            "<td>" + roleName + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            ""+roleQuanxian+""+
                            "<a style='cursor:pointer;text-decoration:none' class='sysuserDetail' value='" + a + "'> 查看 </a> " +
                            "|<a style='cursor:pointer;text-decoration:none' class='sysuserUpdate' value='" + a + "'> 编辑 </a>" +
                            "|<a style='cursor:pointer;text-decoration:none' class='sysuserDelete' value='" + a + "'> 删除 </a> " +
                            "</span>" +
                            "</td> " +
                            "</tr>"
                    }
                    $("#sysuserTable").empty();
                    $("#sysuserTable").append(sysuserHtml);

                    var options = {
                        bootstrapMajorVersion: 3,
                        currentPage: re.pageIndex,    //变量名必须为currentPage
                        totalPages: re.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "post",
                                dataType: "html",
                                url: "/sysuser/select.action",
                                data: {
                                    "sysuser": JSON.stringify(
                                        {
                                            "pageIndex": page, "pageSize": "10", "paramEntity": {
                                            "name": sysuserSelectName,
                                            "departmentName": sysuserSelectDepartmentName
                                        }
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = JSON.parse(result);
                                    sysuserList = re.list;

                                    var sysuserHtml = "";

                                    for (var a = 0; a < sysuserList.length; a++) {
                                        var deptManager = ""
                                        if (sysuserList[a].id == sysuserList[a].deptManager) {
                                            deptManager = "是";
                                        }
                                        var page = (re.pageIndex - 1) * 10 + a + 1;
                                        var name = sysuserList[a].name == null ? "" : sysuserList[a].name;
                                        var userName = sysuserList[a].userName == null ? "" : sysuserList[a].userName;
                                        var departmentName = sysuserList[a].departmentName == null ? "" : sysuserList[a].departmentName;
                                        var roleName = sysuserList[a].roleName == null ? "" : sysuserList[a].roleName;
                                        sysuserHtml +=
                                            "<tr> " +
                                            "<td class='center'>" +
                                            " <label class='pos-rel'> " +
                                            "<input type='checkbox' class='ace'/> " +
                                            "<span class='lbl'></span> " +
                                            "</label> " +
                                            "</td> " +
                                            "<td>" + page + "</td> " +
                                            "<td>" + name + "</td> " +
                                            "<td>" + userName + "</td> " +
                                            "<td>" + departmentName + "</td> " +
                                            "<td style='text-align: center'>" + deptManager + "</td> " +
                                            "<td>" + roleName + "</td> " +
                                            "<td style='text-align: center;color: #2283C5;'> " +
                                            "<span>" +
                                            "<a style='cursor:pointer;text-decoration:none' class='sysuserDetail' value='" + a + "'> 查看 </a> " +
                                            "|<a style='cursor:pointer;text-decoration:none' class='sysuserUpdate' value='" + a + "'> 编辑 </a>" +
                                            "|<a style='cursor:pointer;text-decoration:none' class='sysuserDelete' value='" + a + "'> 删除 </a> " +
                                            "</span>" +
                                            "</td> " +
                                            "</tr>"
                                    }
                                    $("#sysuserTable").empty();
                                    $("#sysuserTable").append(sysuserHtml);
                                }
                            });
                        }
                    };
                    $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {
                }
            });
        }

        //重置
        $('#sysuserCleanButton').on('click', function () {
            sysuserClean();
        });
        function sysuserClean() {
            $('#sysuserSelectName').val(null);
            $('#sysuserSelectDepartmentName').val(null);
            $('#sysuserSelectDepartmentName').attr("value", null);
            nodes = {
                nodeid: null,
                nodetext: null
            };
        }

        $("#sysuserSelectDepartmentName").on('click', function () {
            layer.open({
                type: 1,
                title: '选择部门',
                shadeClose: true,
                //shade: 0.8,
                area: ['45%', '75%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success: function (layero, index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render");
                },
                yes: function (index) {

                    $("#sysuserSelectDepartmentName").val(nodes.nodetext);
                    $("#sysuserSelectDepartmentName").attr("value", nodes.nodeid);
                    layer.close(index);

                },
                btn2: function (index) {
                    layer.close(index);
                    nodes = {
                        nodeid: null,
                        nodetext: null
                    }
                }
            });
        })
        //获取角色
        function GetRole() {
            //新增窗口查询功能
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/sysuser/selectForInsert.action",
                data: {},
                success: function (result) {
                    var re = JSON.parse(result);

                    var roleList = re.roleList;
                    var roleListHtml = "";
                    for (var j = 0; j < roleList.length; j++) {
                        roleListHtml += "<option value=\"" + roleList[j].id + "\">" + roleList[j].roleName + "</option>"
                    }
                    $("#roleId").append(roleListHtml);
                },
                error: function (result) {
                    layer.msg('人员获取错误！', {time: 1000});
                }
            });
        }

        GetRole();

        //新建
        $('#sysuserInsertButton').on('click', function () {
            $("#userform")[0].reset();//重置表单
            $("#department_id").attr("value", null);
            sysuserInsert(this);
        });
        //是否确认替换部门负责人
        $('#sysUserId').on('click', function () {
            if (this.checked == true) {
                var dept = $("#department_id").attr("value");

                if (dept == null) {
                    layer.msg('请先选择部门！', {time: 1000});
                    $('#sysUserId')[0].checked = false;
                    return;
                }

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/dept/selectDeptAdmin.action",
                    data: {
                        deptId: dept
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            layer.confirm("<div style='text-align: center;'>确认变更业务负责人？</div>", function (index) {
                                layer.close(index);
                                $('#sysUserId')[0].checked = true;
                                return;
                            });

                            $('#sysUserId')[0].checked = false;


                        }
                    },
                    error: function (result) {
                        layer.msg('网络异常！', {time: 1000});
                    }
                });


            }
        });

        function sysuserInsert() {
            var userform = $("#userform")[0];
            for (var i = 0; i < userform.length; i++) {
                var tname = userform[i].id;//获取表单对象的name
                $("#" + tname).attr("disabled", false);
            }
            $("#changDept").show();
            layer.open({
                type: 1,
                title: '新增',
                shadeClose: false,
                //shade: 0.8,
                area: ['45%', '75%'],
                content: $('#addForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    submit("insert")

                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        //保存
        function submit(type) {

            var name = $("#name").val();
            if (name == null||name=="") {
                layer.msg("<div style='text-align: center'>姓名不允许为空</div>");
                return;
            }
            var userName = $("#userName").val();
            if (userName == null||userName == "") {
                layer.msg("<div style='text-align: center'>登录名不允许为空</div>");
                return;
            }
            var passWord = $("#passWord").val();
            if (type == "insert") {
                if (passWord == null||passWord=="") {
                    layer.msg("<div style='text-align: center'>密码不允许为空</div>");
                    return;
                }
            }

            var info = $("#info").val();
            var deptManager = $("#sysUserId")[0].checked;//是否为部门负责人
            var id = $("#id").val();
            var roleId = $("#roleId").val();
            var department_id = $("#department_id").attr("value");
            //用户数据
            var sysuser = {
                "id": id,
                "name": name,
                "userName": userName,
                "info": info,
                "passWord": passWord,
                "deptManager": deptManager,
                "departmentId": department_id
            };
            //用户角色数据
            var userrole = {
                "id": id,
                "roleId": roleId
            }
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/sysuser/" + type + ".action",
                data: {
                    sysuser: JSON.stringify(sysuser),
                    userrole: JSON.stringify(userrole)
                },
                success: function (result) {
                    layer.msg('保存成功！', {time: 1000});
                    layer.closeAll();
                    sysuserSelect();
                },
                error: function (result) {
                    layer.msg('保存失败！', {time: 1000});
                }
            });

        }

        //批量删除
        $('#sysuserDeleteButton').on('click', function () {
            var child = $("#sysuserTable").parents('table').find('tbody input[type="checkbox"]');
            var c = [];
            var count = 0;
            child.each(function (index, item) {
                if (item.checked == true) {
                    var index = $("#sysuserTable").children().eq(index).children().eq(1)[0].innerText
                    c[count++] = sysuserList[index%10 - 1].id;
                }
            });
            sysuserDelete(c);
        });


        //编辑
        $(document).on("click", ".sysuserUpdate", function () {
            sysuserUpdate(this);
        });
        function sysuserUpdate(op) {
            var option = sysuserList[op.getAttribute("value")];
            $("#id").val(option.id);
            $("#name").val(option.name);
            $("#userName").val(option.userName);
            $("#department_id").val(option.departmentName);
            $("#department_id").attr("value", option.departmentId);
            $("#roleId").val(option.roleId);
            $("#roleId").find("option:selected").text();
            $("#passWord").val(null);
            $("#info").val(option.info);
            //当部门负责人=当前人的时候勾选check
            if (option.deptManager == option.id) {
                $("#sysUserId")[0].checked = true;
            }
            else {
                $("#sysUserId")[0].checked = false;
            }
            //不能編輯
            var userform = $("#userform")[0];
            for (var i = 0; i < userform.length; i++) {
                var tname = userform[i].id;//获取表单对象的name
                $("#" + tname).attr("disabled", false);
            }
            $("#passWord").attr("disabled", true);
            $("#userName").attr("disabled", true);
            $("#changDept").show();
            layer.open({
                type: 1,
                title: '编辑',
                shadeClose: false,
                //shade: 0.8,
                area: ['45%', '75%'],
                content: $('#addForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    submit("update");
                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        //查看
        $(document).on("click", ".sysuserDetail", function () {
            sysuserDetail(this);
        });
        function sysuserDetail(op) {
            var option = sysuserList[op.getAttribute("value")];
            $("#id").val(option.id);
            $("#name").val(option.name);
            $("#userName").val(option.userName);
            $("#department_id").val(option.departmentName);
            $("#department_id").attr("value", option.department_id);
            $("#roleId").val(option.roleId);
            $("#roleId").find("option:selected").text();
            $("#info").val(option.info);
            //当部门负责人=当前人的时候勾选check
            if (option.deptManager == option.id) {
                $("#sysUserId")[0].checked = true;
            }
            else {
                $("#sysUserId")[0].checked = false;
            }
            //不能編輯
            var userform = $("#userform")[0];
            for (var i = 0; i < userform.length; i++) {
                var tname = userform[i].id;//获取表单对象的name
                $("#" + tname).attr("disabled", "disabled");
            }
            $("#changDept").hide();
            layer.open({
                type: 1,
                title: '查看',
                shadeClose: false,
                //shade: 0.8,
                area: ['45%', '75%'],
                content: $('#addForm'),
                btn: ['关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    layer.closeAll();
                }
            });
        }

        //单一删除
        $(document).on("click", ".sysuserDelete", function () {
            var StringArray = []
            StringArray[0] = sysuserList[this.getAttribute("value")].id
            sysuserDelete(StringArray);
        });
        function sysuserDelete(deleteList) {
            layer.confirm("<div style='text-align: center'>确认删除？</div>",
                function () {
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/sysuser/delete.action",
                        traditional: true,
                        data: {
                            "deleteList": deleteList
                        },
                        success: function (result) {
                            re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                sysuserClean();
                                sysuserSelect();
                            } else if (re.status == ("false")) {
                                layer.msg(re.msg, {time: 1000});
                            }
                        },
                        error: function (result) {
                            layer.msg('删除异常！', {time: 1000});
                        }
                    });
                })
        }

        //人员角色授权-只针对密码管理员角色收权
        $(document).on("click", ".sysuserRoleQuanXian", function () {
            var StringArray = []
            StringArray[0] = sysuserList[this.getAttribute("value")];
            selectRoleMenu(StringArray[0]);

        });

        //获取角色对应的模块
        function getdata(user) {
            var data={
                "user":  JSON.stringify(user)
            }
            //ajax获取数据
            $.ajax({
                async:false,
                type: "post",
                dataType: "json",
                url: "/sysuser/selectRoleMenu.action",
                data: data,
                success: function (result) {
                    data= result;
                }
            });
            return data;
        }
        //获取角色菜单
        var userroleaction=null;
        function selectRoleMenu(user) {
            userroleaction=getdata(user);
//          for(var i=0;i<data.len)
//          var userrole={
//
//              roleName:user.roleName,
//              Meun:user.roleName,
//          }
//          for()
            var html = template('roleQuanXian', userroleaction);//利用模板构建table
            document.getElementById('quanxianTable').innerHTML = null;//
            document.getElementById('quanxianTable').innerHTML = html;//
            openRoleQuanXian();
        }

        //授权Win
        function openRoleQuanXian() {
            layer.open({
                type: 1,
                title: '角色授权',
                shadeClose: false,
                //shade: 0.8,
                area: ['45%', '460px'],
                content: $('#Win_Role_QuanXian'),
                btn: ['保存','关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                  re=SaveRoleQuanXian();
                    layer.msg(re.msg, {time: 1000});
                   // layer.closeAll();

                },btn2: function () {
                    layer.closeAll();
                }
            });
        }
        //授权
        function SaveRoleQuanXian() {
            var re=null;
            var data={
                "userroleaction":  JSON.stringify(userroleaction.list)
            }
            $.ajax({
                async:false,
                type: "post",
                dataType: "json",
                url: "/sysuser/insertRoleMenu.action",
                data: data,
                success: function (result) {
                    re=result;
                }
            });
            return re;
        }

        $(document).on("click", ".checkroleaction", function (){
            var index= $(this).parents("tr").find("td").eq(0).text();
            var action= $(this).is(":checked");
            if(action==true){
                action=1;
            }
            else{
                action=0;
            }
            //var index= $(":checkbox:checked").parents("tr").find("td").eq(0).text();
            userroleaction.list[index-1].action=action;
        });
    })


</script>

<link rel="stylesheet" href="../../assets/css/ace.onpage-help.css"/>

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../../assets/js/src/elements.onpage-help.js"></script>
<script src="../../assets/js/src/ace.onpage-help.js"></script>
<script src="/js/template-web.js"></script>

<script id="roleQuanXian" type="text/html">
    {{each list value i}}

    <tr>
        <td style='text-align: center'>{{i + 1}}</td>
        <td style='text-align: center'>{{value.roleName}}</td>
        <td style='text-align: center'>{{value.menuName}}</td>
        <td style='text-align: center'>
            <label class="pos-rel">
                {{if value.action==1}}
                  <input type="checkbox" class="ace checkroleaction" checked="checked"/>
                {{else}}
                <input type="checkbox" class="ace checkroleaction"/>
                {{/if}}
               <%--<input type="checkbox" class="ace checkroleaction"/>--%>
            <span class="lbl"></span>
        </label> <small style="font-size: 12px">仅查看</small> </td>
        {{/each}}
</script>
</body>
</html>