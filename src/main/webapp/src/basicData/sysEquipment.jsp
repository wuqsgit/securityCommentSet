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
    <title>Tables - Ace Admin</title>

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
                    <li class="active">设备信息维护</li>
                </ul>

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form>
                            <div style="border: 1px solid rgb(221, 221, 221);height:60px;padding-top: 13px;min-width: 800px">
                                <table style="font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 600px;margin: auto"
                                       border="0">
                                    <td>
                                        设备类型：<input id="sysEquipmentSelectDictionaryValue"
                                                    name="sysEquipmentSelectDictionaryValue" type="text" maxlength="64">
                                        <a style="padding-left: 10px"></a>
                                        所属部门：<input id="sysEquipmentSelectDepartmentName"
                                                    name="sysEquipmentSelectDepartmentName" type="text" maxlength="64"
                                                 ></td>
                                    <td style="padding-left: 5px;width: 150px">
                                        <button type="button" id="sysEquipmentSelectButton"
                                                name="sysEquipmentSelectButton" class="btn btn-info btn-xs"
                                                style="margin-top: 0px">
                                            <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                        </button>&nbsp;
                                        <button type="button" id="sysEquipmentCleanButton"
                                                name="sysEquipmentCleanButton"
                                                class="btn btn-xs btn-purple" style="width: 54.3px">
                                            <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                        </button>
                                    </td>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <%--<div  style="height: 35px;">--%>
                <%--<span>--%>
                <%--<button class="btn btn-xs btn-success" id="btnAdd">--%>
                <%--<i class="ace-icon fa fa-check"></i>--%>
                <%--新增</button>--%>
                <%--<button class="btn btn-xs  btn-danger" id="btnDel">--%>
                <%--<i class="ace-icon fa fa-trash-o align-top bigger-125"></i>--%>
                <%--删除</button>--%>
                <%--</span>--%>
                <%--</div>--%>
                <div class="row">
                    <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px">
                        <table id="simple-table" class="table  table-bordered table-hover">
                            <thead>

                            <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                                <label style="padding: 6px;font-size: 12px">&nbsp;设备信息列表</label>
                                <span style="float:right;padding-right: 5px">
                                        <button id="sysEquipmentInsertButton" name="sysEquipmentInsertButton"
                                                class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-check"></i>
                                        新增</button>
                                        <button id="sysEquipmentDeleteButton" name="sysEquipmentDeleteButton"
                                                class="btn btn-xs  btn-danger">
                                        <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                        删除</button>
                                        </span>
                            </div>
                            <tr style="height: 30px">
                                <th class="center" style="width: 50px">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>

                                <th width="50px" style="text-align: center">序号</th>
                                <th>设备类型</th>
                                <th>设备IP</th>
                                <th>所属部门</th>
                                <th>部署位置</th>
                                <th>责任人</th>
                                <th>设备状态</th>
                                <th hidden="hidden">参数设置</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="sysEquipmentTable">
                            </tbody>
                        </table>
                        <div class="padlr" align="right" style="cursor: pointer">
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
<div class="row" id="addForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            设备信息维护
        </h4>
    </div>
    <form class="form-horizontal" role="form" style="margin-top: 20px">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormDictionary">设备类型： </label>
            <div class="col-sm-9">
                <select class="chosen-select form-control" id="addFormDictionary" class="col-xs-9" style="width: 75%;">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormDepartment">所属部门： </label>
                <div class="col-sm-9">
                    <input type="text" id="addFormDepartment" class="col-xs-9" style="width: 75%;" readonly="readonly">
                </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormLocation">部署位置： </label>
            <div class="col-sm-9">
                <select class="chosen-select form-control" id="addFormLocation" class="col-xs-9" style="width: 75%;">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormIP">设备IP： </label>
            <div class="col-sm-9">
                <input type="text" maxlength="15" id="addFormIP" class="col-xs-9">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormSysuser">责任人： </label>
            <div class="col-sm-9">
                <select class="chosen-select form-control" id="addFormSysuser" class="col-xs-9" style="width: 75%;">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormStatus">设备状态： </label>
            <div class="col-sm-9">
                <select class="chosen-select form-control" id="addFormStatus" class="col-xs-9" style="width: 75%;">
                    <option value="1">开启</option>
                    <option value="0">注销</option>
                </select>
            </div>
        </div>
        <div class="form-group" hidden="hidden">
            <label class="col-sm-3 control-label no-padding-right" for="addFormParam">参数设置： </label>
            <div class="col-sm-9">
                <input id="addFormParam"
                       name="addFormParam" type="text" maxlength="64">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormParam">设备编号： </label>
            <div class="col-sm-9">
                <input id="addFormEquipmentNo"
                       name="addFormEquipmentNo" type="text" maxlength="64" style="width: 75%">
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

        //校验输入
        function checkInput() {
            if (!validateIP($("#addFormIP").val())) {
                layer.msg('IP地址输入有误', {time: 1000});
                return false;
            }
            if (nodes.nodeid==null) {
                layer.msg('未选择部门', {time: 1000});
                return false;
            }
            if ($("#addFormDictionary").val()=="") {
                layer.msg('未选择设备类型', {time: 1000});
                return false;
            }
            if ($("#addFormLocation").val()=="") {
                layer.msg('未选择部署位置', {time: 1000});
                return false;
            }
//            if ($("#addFormSysuser").val()=="") {
//                layer.msg('未选择责任人', {time: 1000});
//                return false;
//            }
            if ($("#addFormStatus").val()=="") {
                layer.msg('未选择设备状态', {time: 1000});
                return false;
            }
            if ($("#addFormEquipmentNo").val()=="") {
                layer.msg('未输入设备编号', {time: 1000});
                return false;
            }
            return true;
        }

        function validateIP(str) {
            return !!str.match(/^((25[0-5]|2[0-4]\d|[01]?\d\d?)($|(?!\.$)\.)){4}$/);
        }

//        部门树形弹窗按钮
        $('#addFormDepartment').on('click', function () {
            layer.open({
                type: 1,
                title: '选择部门',
                shadeClose: false,
                //shade: 0.8,
                area: ['40%', '70%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success: function (layero, index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render");
                    //更新位置和责任人

                },
                yes: function (index) {
                    layer.close(index);
                    $("#addFormDepartment").val(nodes.nodetext);
                    $("#addFormDepartment").attr("value", nodes.nodeid);
                    insertUpdateLocation(nodes.nodeid);
                    insertAdmin(nodes.nodeid);
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        });

        function insertUpdateLocation(deptId){
            $.ajax({
                url: "/location/selectLocationByDept.action",
                type: 'POST',
                dataType: 'json',
                data: {
                    "nodeId": deptId},
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var locations=response.data;
                        var locationsHtml = "<option value=\"\"></option>";
                        for (var j = 0; j < locations.length; j++) {
                            locationsHtml += "<option value=\"" + locations[j].id + "\">" + locations[j].locinfo + "</option>"
                        }
                        $("#addFormLocation").empty();
                        $("#addFormLocation").append(locationsHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        function insertAdmin(deptId){
            $.ajax({
                url: "/sysEquipment/selectAdminByDept.action",
                type: 'POST',
                dataType: 'json',
                data: {
                    "deptId": deptId},
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var sysusers = response.data;
                        var sysusersHtml="<option value=\"\"></option>";
                        for (var j = 0; j < sysusers.length; j++) {
                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                        }
                        $("#addFormSysuser").empty();
                        $("#addFormSysuser").append(sysusersHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //        部门树形弹窗内容
        var nodes = {
            nodeid: null,
            nodetext: null
        }
        departmentTree();
        function departmentTree() {
            var remoteUrl = '/dept/select.action';
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

        //数据初始化
        sysEquipmentSelect();
        //查询按钮
        $('#sysEquipmentSelectButton').on('click', function () {
            sysEquipmentSelect(this);
        });
        var sysEquipmentList;

        function sysEquipmentSelect() {
            var sysEquipmentSelectDictionaryValue = $('#sysEquipmentSelectDictionaryValue').val();
            var sysEquipmentSelectDepartmentName = $('#sysEquipmentSelectDepartmentName').val();
            var pageIndex = 1;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/sysEquipment/select.action",
                traditional: true,
                data: {
                    "sysEquipment": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                            "dictionaryValue": sysEquipmentSelectDictionaryValue,
                            "departmentName": sysEquipmentSelectDepartmentName
                        }
                        }
                    )
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    sysEquipmentList = re.list;

                    var sysEquipmentHtml = "";


                    for (var a = 0; a < sysEquipmentList.length; a++) {
                        var temp_status = null;
                        if(sysEquipmentList[a].status==1)temp_status = "开启";
                        else if (sysEquipmentList[a].status==0)temp_status = "注销";

                        var paramtime = '';
                        if(sysEquipmentList[a].paramtime != null){
                            paramtime = sysEquipmentList[a].paramtime;
                        }

                        var sysuserName = '';
                        if(sysEquipmentList[a].sysuserName != null){
                                sysuserName = sysEquipmentList[a].sysuserName;
                        }
                        var page = (re.pageIndex - 1) * 10 + a + 1;

                        var dictionaryValue = sysEquipmentList[a].dictionaryValue==null?"":sysEquipmentList[a].dictionaryValue;
                        var departmentName = sysEquipmentList[a].departmentName==null?"":sysEquipmentList[a].departmentName;
                        var locationiInfo = sysEquipmentList[a].locationiInfo==null?"":sysEquipmentList[a].locationiInfo;
                        var ip = sysEquipmentList[a].ip==null?"":sysEquipmentList[a].ip;

                        sysEquipmentHtml +=
                            "<tr> " +
                            "<td class='center'>" +
                            " <label class='pos-rel'> " +
                            "<input type='checkbox' class='ace'/> " +
                            "<span class='lbl'></span> " +
                            "</label> " +
                            "</td> " +
                            "<td>" + page + "</td> " +
                            "<td>" + dictionaryValue + "</td> " +
                            "<td>" + ip + "</td> " +
                            "<td>" + departmentName + "</td> " +
                            "<td>" + locationiInfo + "</td> " +
                            "<td>" + sysuserName  + "</td> " +
                            "<td>" + temp_status + "</td> " +
                            "<td hidden='hidden'>" + paramtime + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='sysEquipmentDetail' value='" + a + "'> 查看 </a> " +
                            "|<a style='cursor:pointer;text-decoration:none' class='sysEquipmentUpdate' value='" + a + "'> 编辑 </a>" +
                            "|<a style='cursor:pointer;text-decoration:none' class='sysEquipmentDelete' value='" + a + "'> 删除 </a> " +
                            "</span>" +
                            "</td> " +
                            "</tr>"
                    }
                    $("#sysEquipmentTable").empty();
                    $("#sysEquipmentTable").append(sysEquipmentHtml);

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
                                url: "/sysEquipment/select.action",
                                data: {
                                    "sysEquipment": JSON.stringify(
                                        {
                                            "pageIndex": page, "pageSize": "10", "paramEntity": {
                                            "dictionaryValue": sysEquipmentSelectDictionaryValue,
                                            "departmentName": sysEquipmentSelectDepartmentName
                                        }
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = JSON.parse(result);
                                    sysEquipmentList = re.list;

                                    var sysEquipmentHtml = "";

                                    for (var a = 0; a < sysEquipmentList.length; a++) {
                                        var temp_status = null;
                                        if(sysEquipmentList[a].status==1)temp_status = "开启";
                                        else if (sysEquipmentList[a].status==0)temp_status = "注销";

                                        var paramtime = '';
                                        if(sysEquipmentList[a].paramtime != null){
                                            paramtime = sysEquipmentList[a].paramtime;
                                        }

                                        var sysuserName = '';
                                        if(sysEquipmentList[a].sysuserName != null){
                                            sysuserName = sysEquipmentList[a].sysuserName;
                                        }
                                        var page = (re.pageIndex - 1) * 10 + a + 1;

                                        var dictionaryValue = sysEquipmentList[a].dictionaryValue==null?"":sysEquipmentList[a].dictionaryValue;
                                        var departmentName = sysEquipmentList[a].departmentName==null?"":sysEquipmentList[a].departmentName;
                                        var locationiInfo = sysEquipmentList[a].locationiInfo==null?"":sysEquipmentList[a].locationiInfo;
                                        var ip = sysEquipmentList[a].ip==null?"":sysEquipmentList[a].ip;

                                        sysEquipmentHtml +=
                                            "<tr> " +
                                            "<td class='center'>" +
                                            " <label class='pos-rel'> " +
                                            "<input type='checkbox' class='ace'/> " +
                                            "<span class='lbl'></span> " +
                                            "</label> " +
                                            "</td> " +
                                            "<td>" + page + "</td> " +
                                            "<td>" + dictionaryValue + "</td> " +
                                            "<td>" + ip + "</td> " +
                                            "<td>" + departmentName + "</td> " +
                                            "<td>" + locationiInfo + "</td> " +
                                            "<td>" + sysuserName  + "</td> " +
                                            "<td>" + temp_status + "</td> " +
                                            "<td hidden='hidden'>" + paramtime + "</td> " +
                                            "<td style='text-align: center;color: #2283C5;'> " +
                                            "<span>" +
                                            "<a style='cursor:pointer;text-decoration:none' class='sysEquipmentDetail' value='" + a + "'> 查看 </a> " +
                                            "|<a style='cursor:pointer;text-decoration:none' class='sysEquipmentUpdate' value='" + a + "'> 编辑 </a>" +
                                            "|<a style='cursor:pointer;text-decoration:none' class='sysEquipmentDelete' value='" + a + "'> 删除 </a> " +
                                            "</span>" +
                                            "</td> " +
                                            "</tr>"
                                    }
                                    $("#sysEquipmentTable").empty();
                                    $("#sysEquipmentTable").append(sysEquipmentHtml);
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
        $('#sysEquipmentCleanButton').on('click', function () {
            sysEquipmentClean();
        });
        function sysEquipmentClean() {
            $('#sysEquipmentSelectDictionaryValue').val("");
            $('#sysEquipmentSelectDepartmentName').val("");
        }

        //新增窗口查询功能
        $.ajax({
            type: "post",
            dataType: "html",
            url: "/sysEquipment/selectForInsert.action",
            data: {},
            success: function (result) {
                var re = JSON.parse(result);

                var dictionaries = re.dictionaries;
                var dictionariesHtml = "";
                for (var j = 0; j < dictionaries.length; j++) {
                    dictionariesHtml += "<option value=\"" + dictionaries[j].id + "\">" + dictionaries[j].value + "</option>"
                }
              $("#addFormDictionary").append(dictionariesHtml);

                var locations = re.locations;
                var locationsHtml = " ";
                for (var j = 0; j < locations.length; j++) {
                    locationsHtml += "<option value=\"" + locations[j].id + "\">" + locations[j].locinfo + "</option>"
                }
                $("#addFormLocation").append(locationsHtml);

                var sysusers = re.sysusers;
                var sysusersHtml = "";
                for (var j = 0; j < sysusers.length; j++) {
                    sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                }
                $("#addFormSysuser").append(sysusersHtml);
            },
            error: function (result) {
                layer.msg('部门新增选项获取错误！', {time: 1000});
            }
        });
        //新建
        $('#sysEquipmentInsertButton').on('click', function () {
            sysEquipmentInsert(this);
        });
        function sysEquipmentInsert() {
            $("#addFormDictionary").val("");
            $("#addFormDepartment").val("");
            $("#addFormLocation").val("");
            $("#addFormIP").val("");
            $("#addFormSysuser").val("");
            $("#addFormStatus").val("");
            $("addFormEquipmentNo").val("");
            $("#addFormParam").val("");

            $("#addFormDictionary").attr("disabled", false);
            $("#addFormDepartment").attr("disabled", false);
            $("#addFormLocation").attr("disabled", false);
            $("#addFormIP").attr("disabled", false);
            $("#addFormSysuser").attr("disabled", false);
            $("#addFormStatus").attr("disabled", false);
            $("#addFormEquipmentNo").attr("disabled", false);
            $("#addFormParam").attr("disabled", false);
            layer.open({
                type: 1,
                title: '新增',
                shadeClose: false,
                //shade: 0.8,
                area: ['40%', '70%'],
                content: $('#addForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    if (!checkInput())return;
                    var addFormDictionary = $("#addFormDictionary").val();
                    var addFormDepartment = $("#addFormDepartment").attr("value");
                    var addFormLocation = $("#addFormLocation").val();
                    var addFormIP = $("#addFormIP").val();
                    var addFormSysuser = $("#addFormSysuser").val();
                    var addFormStatus = $("#addFormStatus").val();
                    var addFormEquipmentNo = $("#addFormEquipmentNo").val();
                    var addFormParam = $("#addFormParam").val();
                    layer.load(2,{time:1000});
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/sysEquipment/insert.action",
                        traditional: true,
                        data: {
                            "sysEquipment": JSON.stringify(
                                {
                                    "dictionaryid": addFormDictionary,
                                    "departmentid": addFormDepartment,
                                    "locationid": addFormLocation,
                                    "ip": addFormIP,
                                    "sysuserid": addFormSysuser,
                                    "status": addFormStatus,
                                    "equipmentNo": addFormEquipmentNo,
                                    "paramtime": addFormParam
                                }
                            )
                        },
                        success: function (result) {
                            var re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                sysEquipmentClean();
                                sysEquipmentSelect();
                                layer.closeAll();
                            } else if (re.status == ("false")) {
                                layer.msg(re.msg, {time: 1000});
                            }
                        },
                        error: function () {
                            layer.msg('新建设备异常', {time: 1000});
                        }
                    });

                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        //批量删除
        $('#sysEquipmentDeleteButton').on('click', function () {
            var child = $("#sysEquipmentTable").parents('table').find('tbody input[type="checkbox"]');
            var c = [];
            var count = 0;
            child.each(function (index, item) {
                if (item.checked == true) {
                    var index = $("#sysEquipmentTable").children().eq(index).children().eq(1)[0].innerText
                    c[count++] = sysEquipmentList[index%10 - 1].id;
                }
            });
            sysEquipmentDelete(c);
        });

        //导入
        $('#sysEquipmentInputButton').on('click', function () {
            sysEquipmentSelect(this);
        });
        //导出
        $('#sysEquipmentOutputButton').on('click', function () {
            sysEquipmentSelect(this);
        });
        //编辑
        $(document).on("click", ".sysEquipmentUpdate", function () {
            sysEquipmentUpdate(this);
        });
        function sysEquipmentUpdate(op) {
            var option = sysEquipmentList[op.getAttribute("value")];

            $("#addFormDictionary").val(sysEquipmentList[op.getAttribute("value")].dictionaryid);

           // $("#addFormDictionary").attr("text", option.dictionaryValue);
            $("#addFormDictionary").find("option:selected").text();
            $("#addFormDepartment").val(option.departmentName);
            nodes.nodeid=option.id;
            nodes.nodetext=option.departmentName;
            $("#addFormLocation").val(sysEquipmentList[op.getAttribute("value")].locationid);
//            $("#addFormLocation").find("option:selected").text();
            $("#addFormLocation").attr("text", option.locationiInfo);
            $("#addFormIP").val(option.ip);
            $("#addFormSysuser").val(sysEquipmentList[op.getAttribute("value")].sysuserid);
//            $("#addFormSysuser").find("option:selected").text();
            $("#addFormSysuser").attr("text", option.sysuserName);

            $("#addFormStatus").val(sysEquipmentList[op.getAttribute("value")].status);
            $("#addFormStatus").find("option:selected").text();

            $("#addFormEquipmentNo").val(sysEquipmentList[op.getAttribute("value")].equipmentNo);

           // $("#addFormStatus").attr("text", option.status);
            $("#addFormParam").val(sysEquipmentList[op.getAttribute("value")].paramtime);
            $("#addFormParam").find("option:selected").text();
           // $("#addFormParam").attr("text", option.paramtime);

            $("#addFormDictionary").attr("disabled", false);
            $("#addFormDepartment").attr("disabled", false);
            $("#addFormLocation").attr("disabled", false);
            $("#addFormIP").attr("disabled", false);
            $("#addFormSysuser").attr("disabled", false);
            $("#addFormStatus").attr("disabled", false);
            $("#addFormEquipmentNo").attr("disabled", false);
            $("#addFormParam").attr("disabled", false);
            layer.open({
                type: 1,
                title: '编辑',
                shadeClose: false,
                //shade: 0.8,
                area: ['40%', '70%'],
                content: $('#addForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    if (!checkInput()){
                        return;
                    }
                    var addFormDictionary = $("#addFormDictionary").val();
                    var addFormDepartment = $("#addFormDepartment").attr("value");
                    var addFormLocation = $("#addFormLocation").val();
                    var addFormIP = $("#addFormIP").val();
                    var addFormSysuser = $("#addFormSysuser").val();
                    var addFormStatus = $("#addFormStatus").val();
                    var addFormEquipmentNo = $("#addFormEquipmentNo").val();
                    var addFormParam = $("#addFormParam").val();
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/sysEquipment/update.action",
                        traditional: true,
                        data: {
                            "sysEquipment": JSON.stringify(
                                {
                                    "id": option.id,
                                    "dictionaryid": addFormDictionary,
                                    "departmentid": addFormDepartment,
                                    "locationid": addFormLocation,
                                    "ip": addFormIP,
                                    "sysuserid": addFormSysuser,
                                    "status": addFormStatus,
                                    "equipmentNo": addFormEquipmentNo,
                                    "paramtime": addFormParam
                                }
                            ),
                        },
                        success: function (result) {
                            var re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                sysEquipmentClean();
                                sysEquipmentSelect();
                                layer.closeAll();
                            } else if (re.status == ("false")) {
                                layer.msg(re.msg, {time: 1000});
                            }
                        },
                        error: function (result) {
                            layer.msg('编辑设备异常', {time: 1000});
                        }
                    });

                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        //查看
        $(document).on("click", ".sysEquipmentDetail", function () {
            sysEquipmentDetail(this);
        });
        function sysEquipmentDetail(op) {
            var option = sysEquipmentList[op.getAttribute("value")];

            $("[id='addFormDictionary']").val(sysEquipmentList[op.getAttribute("value")].dictionaryid);
           // $("[id='addFormDictionary']").attr("text", option.dictionaryValue);
            $("#addFormDictionary").find("option:selected").text();
            $("#addFormDepartment").val(option.departmentName);
            $("[id='addFormLocation']").val(sysEquipmentList[op.getAttribute("value")].locationid);
            $("#addFormLocation").find("option:selected").text();
           // $("[id='addFormLocation']").attr("text", option.locationiInfo);
            $("#addFormIP").val(option.ip);
            $("[id='addFormSysuser']").val(sysEquipmentList[op.getAttribute("value")].sysuserid);
            $("#addFormSysuser").find("option:selected").text();
            //$("[id='addFormSysuser']").attr("text", option.sysuserName);
            $("[id='addFormStatus']").val(sysEquipmentList[op.getAttribute("value")].status);
            $("#addFormStatus").find("option:selected").text();

            $("[id='addFormEquipmentNo']").val(sysEquipmentList[op.getAttribute("value")].equipmentNo);
            // $("[id='addFormStatus']").attr("text", option.status);
            $("[id='addFormParam']").val(sysEquipmentList[op.getAttribute("value")].paramtime);
            //$("[id='addFormParam']").attr("text", option.paramtime);
            $("#addFormParam").find("option:selected").text();

            $("#addFormDictionary").attr("disabled", true);
            $("#addFormDepartment").attr("disabled", true);
            $("#addFormLocation").attr("disabled", true);
            $("#addFormIP").attr("disabled", true);
            $("#addFormSysuser").attr("disabled", true);
            $("#addFormStatus").attr("disabled", true);
            $("#addFormEquipmentNo").attr("disabled", true);
            $("#addFormParam").attr("disabled", true);

            layer.open({
                type: 1,
                title: '查看',
                shadeClose: false,
                //shade: 0.8,
                area: ['40%', '70%'],
                content: $('#addForm'),
                btn: ['关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    layer.closeAll();
                }
            });
        }

        //单一删除
        $(document).on("click", ".sysEquipmentDelete", function () {
            var StringArray = []
            StringArray[0] = sysEquipmentList[this.getAttribute("value")].id
            sysEquipmentDelete(StringArray);
        });
        function sysEquipmentDelete(deleteList) {
            layer.confirm("<div style='text-align: center'>确认删除？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/sysEquipment/delete.action",
                    traditional: true,
                    data: {
                        "deleteList": deleteList
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            sysEquipmentClean();
                            sysEquipmentSelect();
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
    })

</script>

<link rel="stylesheet" href="../../assets/css/ace.onpage-help.css"/>

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../../assets/js/src/elements.onpage-help.js"></script>
<script src="../../assets/js/src/ace.onpage-help.js"></script>
</body>
</html>
