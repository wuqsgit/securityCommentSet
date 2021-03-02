<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>密品清退</title>

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
    <link rel="stylesheet" href="../../assets/css/daterangepicker.css"/>

    <link rel="stylesheet" href="../../css/table.css"/>
    <link rel="stylesheet" href="../../css/tree.css" />

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
                        <i class="ace-icon fa fa-home home-icon"></i>密品清退
                    </li>
                </ul>
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;min-width: 850px;padding-left: 0px;padding-right: 0px">
                        <form id="init_form">
                            <div style="border: 1px solid rgb(221, 221, 221);padding-top: 5px">
                                <table style=" height: 80px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 600px;margin: auto;margin-bottom: 5px"
                                       border="0">
                                    <tr>
                                        <td style="padding-left: 22px">
                                            <a style="padding-left: 30px"></a> 创建时间：<input class="" type="text"
                                                        name="date-range-picker" style="width: 200px"
                                                        readonly="readonly" id="id-date-range-picker-1"/>
                                            <a style="padding-left: 10px"></a>
                                            完成时间：<input class="" type="text"
                                                        name="date-range-picker" style="width: 200px"
                                                        readonly="readonly" id="id-date-range-picker-2"/>

                                        </td>
                                        <td style="padding-left: 20px;width: 150px" rowspan="2">
                                            <button type="button" id="returnobjSelectButton"
                                                    name="returnobjSelectButton" class="btn btn-info btn-xs"
                                                    style="margin-top: 0px">
                                                <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                            </button>&nbsp;
                                            <button type="button" id="returnobjCleanButton" name="returnobjCleanButton"
                                                    class="btn btn-xs btn-purple" style="width: 54.3px">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                            </button>
                                        </td>
                                    </tr>
                             <tr>
                                    <td style="padding-left: 22px">组织机构名称：<input type="text" id="returnobjSelectdepartment" readonly="readonly" style="width: 200px">
                                        <a style="padding-left: 10px"></a>
                                       计划状态：<select class="chosen-select" id="returnobjSelectStatus" style="width: 200px">
                                   <option value=""></option>
                                    <option value="0">草稿</option>
                                   <option value="1">已下发</option>
                                   <option value="2">已完成</option>
                                </select>
                                    </td>
                                </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row" style="padding-top: 35px">
                    <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px">
                        <table id="simple-table" class="table  table-bordered table-hover" style="min-width: 800px;">
                            <thead>
                            <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                                <label style="padding: 6px;font-size: 12px">&nbsp;密品清退列表</label>
                                <span style="float:right;padding-right: 5px">
                                            <button id="returnobjInsertButton" name="returnobjInsertButton"
                                                    class="btn btn-xs btn-success ishow">
                                            <i class="ace-icon fa fa-check"></i>
                                            新增</button>
                                            </span>
                            </div>
                            <tr style="height: 30px;">
                                <th width="50px" style="text-align: center">序号</th>
                                <th>所属组织机构</th>
                                <th>所属系统</th>
                                <th>密品类别</th>
                                <th>位置</th>
                                <th>创建时间</th>
                                <th>完成时间</th>
                                <th>状态</th>
                                <th>备注</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="returnobjTable"></tbody>
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

<!-- 新增信息-->
<div class="row" id="addForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            新增清退计划
        </h4>
    </div>
    <form class="" role="form" style="margin-top: 20px">
        <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
            <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;min-width: 700px;margin: auto;"
                   border="0">
                <tr>
                    <td>单位名称:<a style="padding-left: 4px"></a><input type="text" id="addreturnobj_department" readonly="readonly" style="width: 163px">

                    </td>
                    <td><a style="padding-left: 14px"></a>密品类别:<select class="" id="addreturnobj_dictionary" style="width: 163px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td style="padding-left: 5px;width: 150px;" rowspan="3">
                        <button type="button" id="returnobjInsertSelectButton"
                                name="returnobjInsertSelectButton" class="btn btn-info btn-xs"
                                style="margin-top: 0px">
                            <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                        </button>&nbsp;
                        <button type="button" id="returnobjInsertCleanButton" name="returnobjInsertCleanButton"
                                class="btn btn-xs btn-purple" style="width: 54.3px">
                            <i class="ace-icon fa fa-undo bigger-110"></i>重置
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        系统名称:
                        <select class="chosen-select " id="addreturnobj_application"  style="width: 163px;">
                            <option value=""></option>
                        </select>

                    </td>
                    <td>
                        <a style="padding-left: 38px"></a>位置:
                        <select class="chosen-select " id="addreturnobj_location"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <a style="padding-left: 24px"></a>备注:
                        <input id="addreturnobj_info"
                               name="addreturnobj_info" type="text" maxlength="100"
                               onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"style="width: 81%">
                    </td>
                    <%--<td></td>--%>
                </tr>
            </table>
        </div>
    </form>
    <div class="row" style="padding-top:0px">
        <div class="col-xs-12">
            <table id="returnobj-table" class="table  table-bordered table-hover" style="min-width: 800px;" >
                <thead>

                <tr style="height: 30px;">
                    <th class="detail-col" width="150px">密件</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>密品类别</th>
                    <th>密品型号</th>
                    <th>RFID编号</th>
                    <th>所属系统</th>
                    <th>所属单位</th>
                    <th>位置</th>
                </tr>
                </thead>
                <tbody id="returnobjInsertTable" class="table  table-bordered table-hover"></tbody>

            </table>
            <!--  <div class="padlr" align="right" style="cursor: pointer">
                 <ul id="insert-data-pagination" class="pagination">
                 </ul>
             </div>-->
         </div><!-- /.span -->
    </div><!-- /.row -->
</div>


<div class="row" id="detailForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            清退计划查看
        </h4>
    </div>
    <form class="form-horizontal" role="form" style="margin-top: 20px">
        <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
            <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                   border="0">
                <tr>
                    <td>
                        创建时间:
                        <input id="detail_createtime"
                               name="detail_createtime" type="text" maxlength="100"
                               onkeypress="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                               onkeyup="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                               onkeydown="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                               onafterpaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,''))"
                               onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,''))"
                               onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                        <a style="padding-left: 10px"></a>
                    </td>
                    <td>
                        完成时间：
                        <input id="detail_rettime"
                               name="detail_rettime" type="text" maxlength="100"
                               onkeypress="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                               onkeyup="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                               onkeydown="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                               onafterpaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,''))"
                               onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,''))"
                               onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div class="row" style="padding-top: 35px">
        <div class="col-xs-12">
            <table id="inventory-table" class="table  table-bordered table-hover" style="min-width: 800px;" >
                <thead>
                <tr style="height: 30px;">
                    <th class="detail-col" width="150px">密件</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>密品类别</th>
                    <th>密品型号</th>
                    <th>RFID编号</th>
                    <th>所属系统</th>
                    <th>所属单位</th>
                    <th>位置</th>
                    <th>清退结果</th>
                </tr>
                </thead>
                <tbody id="detailTable" class="table  table-bordered table-hover"></tbody>
            </table>
            <!--  <div class="padlr" align="right" style="cursor: pointer">
                <ul id="detail-data-pagination" class="pagination">
                </ul>
            </div> -->
        </div><!-- /.span -->
    </div><!-- /.row -->
</div>

<!-- 修改计划信息-->
<div class="row" id="editForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            编辑清退计划
        </h4>
    </div>
    <form class="" role="form" style="margin-top: 20px">
        <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
            <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;min-width: 700px;margin: auto;"
                   border="0">
                <tr>
                    <td>
                        单位名称:<a style="padding-left: 4px"></a>
                        <input type="text" id="edit_department" readonly="readonly" style="width: 163px">

                    </td>
                    <td>
                        <a style="padding-left: 14px"></a>密品类别：
                        <select class="chosen-select" id="edit_dictionary" style="width: 163px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        系统名称:
                        <select class="chosen-select" id="edit_application"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td>
                        <a style="padding-left: 30px"></a>位置：&nbsp;
                        <select class="chosen-select" id="edit_location"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        备注:<a style="padding-left: 13px"></a>
                        <input id="editreturnobj_info"
                               name="editreturnobj_info" type="text" maxlength="100"
                               onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"style="width: 81%">
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <div class="row" style="padding-top: 35px">
        <div class="col-xs-12">
            <table id="inventory-table" class="table  table-bordered table-hover" style="min-width: 800px;" >
                <thead>
                <tr style="height: 30px;">
                    <th class="detail-col" width="150px">密件</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>密品类别</th>
                    <th>密品型号</th>
                    <th>RFID编号</th>
                    <th>所属系统</th>
                    <th>所属单位</th>
                    <th>位置</th>
                    <th style="text-align: center;width: 200px">操作</th>
                </tr>

                </thead>
                <tbody id="editTable" class="table  table-bordered table-hover"></tbody>
            </table>
            <!--   <div class="padlr" align="right" style="cursor: pointer">
                  <ul id="edit-data-pagination" class="pagination">
                  </ul>
              </div>-->
          </div><!-- /.span -->
    </div><!-- /.row -->
</div>

<%--树形控件--%>
<div class="row" id="addFormForDepartmentSelect" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            选择组织机构
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
<script src="../../assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="../../assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="../../assets/js/date-time/moment.min.js"></script>
<script src="../../assets/js/date-time/daterangepicker.min.js"></script>
<script src="../../layer/layer.js"></script>
<script src="../../js/bootstrap-paginator.js"></script>
<script src="../../js/UserRoleAction.js"></script>
<link rel="stylesheet" href="../../css/fontstyle.css" />
<script type="text/javascript">
    jQuery(function ($) {

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

        //日期控件初始化
        $('input[name=date-range-picker]').daterangepicker().prev().on(ace.click_event, function () {
            $(this).next().focus();
        });

        var nodes = {
            nodeid: null,
            nodetext: null
        };
        //表格数据初始化
        returnobjSelect();
        //查询密品清退按钮
        $('#returnobjSelectButton').on('click', function () {
            returnobjSelect(this);
        });

        // 重置
        $('#returnobjCleanButton').on('click', function () {
            returnobjClean();
        });

        //新增清空
        $('#returnobjInsertCleanButton').on('click', function () {
            returnobjInsertClean();
        });

        function returnobjInsertClean() {
            nodes = {
                nodeid: null,
                nodetext: null
            };
            $("#addreturnobj_department").val("");
            $("#addreturnobj_department").attr("value", "");
            $("#addreturnobj_application").val("");
            $("#addreturnobj_location").val("");
            $("#addreturnobj_dictionary").val("");
            $("#addreturnobj_info").val("");
        }

        //        组织机构树形弹窗按钮
        $('#returnobjSelectdepartment').on('click', function () {
            layer.open({
                type: 1,
                title: '选择组织机构',
                shadeClose: true,
                //shade: 0.8,
                area: ['40%', '80%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success:function (layero,index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render") ;
                },
                yes: function (index) {
                    layer.close(index);
                    $("#returnobjSelectdepartment").val(nodes.nodetext);
                    $("#returnobjSelectdepartment").attr("value",nodes.nodeid);
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        });

        $('#edit_department').on('click', function () {
            layer.open({
                type: 1,
                title: '选择组织机构',
                shadeClose: true,
                //shade: 0.8,
                area: ['40%', '80%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success:function (layero,index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render") ;
                },
                yes: function (index) {
                    layer.close(index);
                    $("#edit_department").val(nodes.nodetext);
                    $("#edit_department").attr("value",nodes.nodeid);
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        });


        function returnobjClean() {
            nodes = {
                nodeid: null,
                nodetext: null
            };
            $('#returnobjSelectdepartment').val("");
            $('#returnobjSelectStatus').val("");
            $("#id-date-range-picker-1").val("");
            $("#id-date-range-picker-2").val("");
        }

        //组织机构树形弹窗内容
        departmentTree();
        function departmentTree() {
            var remoteUrl = '/dept/selectByUser.action';
            var remoteDateSource = function (options, callback) {
                var self = this;
                var $data = null;
                var parent_id = 1;

                if (!('text' in options || 'type' in options)) {
                    $.ajax({
                        url: remoteUrl,
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

        var returnobjList;
        var creatStartTime;
        var createEndTime;
        var retStartTime;
        var retEndTime;

        //初始化页面查询
        function returnobjSelect() {
            var departmentId = $("#returnobjSelectdepartment").attr("value");
            var status = $("#returnobjSelectStatus").val();
            //创建时间
            var data = $("#id-date-range-picker-1").val();
            //完成时间
            var retData =  $("#id-date-range-picker-2").val();

            creatStartTime = data.substring(0, 10);
            createEndTime = data.substring(13, 23);

            retStartTime = retData.substring(0, 10);
            retEndTime = retData.substring(13, 23);
            var pageIndex = 1;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Returnobj/select.action",
                traditional: true,
                data: {
                    "returnobject": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                            "creatStartTime": creatStartTime,
                            "createEndTime": createEndTime,
                            "retStartTime":retStartTime,
                            "retEndTime":retEndTime,
                            "status": status,
                            "departmentId":departmentId
                        }
                        }
                    ),
                    "isDetail": "1"
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    returnobjList = re.list;

                    var returnobjHtml = "";
                    for (var a = 0; a < returnobjList.length; a++) {
                            var page = (re.pageIndex - 1) * 10 + a + 1;
                            var statusType= "";
                            if (returnobjList[a].status == '1') {
                                statusType = '已下发';
                            }
                            else if(returnobjList[a].status == '0'){
                                statusType = '草稿';
                            }else if(returnobjList[a].status == '2'){
                                statusType = "已完成";
                            }
                            var dictionaryValue="";
                        if(returnobjList[a].dictionaryValue != null){
                            dictionaryValue = returnobjList[a].dictionaryValue;
                        }
                        var localValue="";
                        if(returnobjList[a].locInfo != null){
                            localValue = returnobjList[a].locInfo;
                        }

                            var applicationName = "";
                            if(returnobjList[a].applicationName != null){
                                applicationName = returnobjList[a].applicationName;
                            }
                            var sysDepartmentName = "";
                            if(returnobjList[a].departmentName != null){
                                sysDepartmentName = returnobjList[a].departmentName;
                            }
                            var sysResult = "";
                            if(returnobjList[a].info != null){
                                sysResult = returnobjList[a].info;
                            }
                            var rettime="";
                        if(returnobjList[a].retTime != null){
                            rettime = returnobjList[a].retTime;
                        }

                        returnobjHtml +=
                                "<tr> " +
                                "<td>" + page + "</td> " +
                                "<td>" + sysDepartmentName + "</td> " +
                                "<td>" + applicationName + "</td> " +
                                "<td>" + dictionaryValue + "</td> " +
                                "<td>" + localValue + "</td> " +
                                "<td>" + returnobjList[a].createTime + "</td> " +
                                "<td>" + rettime + "</td> " +
                                "<td>" + statusType + "</td> " +
                                "<td>" + sysResult + "</td> " +
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>";
                            if (returnobjList[a].status == '0') {
                                returnobjHtml += "<a style='cursor:pointer;text-decoration:none' class='returnobjUpdate ishow' value='" + a + "'> 编辑 </a> " +
                                    "<a style='cursor:pointer;text-decoration:none' class='returnobjSend ishow' value='" + a + "'>| 下发 </a>" +
                                    "<a style='cursor:pointer;text-decoration:none' class='returnobjDelete ishow' value='" + a + "'>| 删除 </a> ";
                            } else {
                                returnobjHtml += "<a style='cursor:pointer;text-decoration:none' class='returnobjDetail' value='" + a + "'> 查看 </a> ";
                            }

                        returnobjHtml += "</span>" +
                                "</td> " +
                                "</tr>";
                            var page = (re.pageIndex - 1) * 10 + a + 1
                        }

                    $("#returnobjTable").empty();
                    $("#returnobjTable").append(returnobjHtml);
                    QuanXian();

                        if( re.totalPages == 0) {
                            $('#data-pagination').hide();
                            return;
                        }
                    var   options = {
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
                                        url: "/Returnobj/select.action",
                                        traditional: true,
                                        data: {
                                            "returnobject": JSON.stringify(
                                                {
                                                    "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                    "creatStartTime": creatStartTime,
                                                    "createEndTime": createEndTime,
                                                    "retStartTime":retStartTime,
                                                    "retEndTime":retEndTime,
                                                    "status": status,
                                                    "departmentId":departmentId
                                                }
                                                }
                                            ),
                                            "isDetail": "1"
                                        },
                                        success: function (result) {
                                            var re = JSON.parse(result);
                                            returnobjList = re.list;

                                            var returnobjHtml = "";

                                            for (var a = 0; a < returnobjList.length; a++) {
                                                var page = (re.pageIndex - 1) * 10 + a + 1;
                                                var statusType= "";
                                                if (returnobjList[a].status == '1') {
                                                    statusType = '已下发';
                                                }
                                                else if(returnobjList[a].status == '0'){
                                                    statusType = '草稿';
                                                }else if(returnobjList[a].status == '2'){
                                                    statusType = "已完成";
                                                }

                                                var dictionaryValue="";
                                                if(returnobjList[a].dictionaryValue != null){
                                                    dictionaryValue = returnobjList[a].dictionaryValue;
                                                }
                                                var applicationName = "";
                                                if(returnobjList[a].applicationName != null){
                                                    applicationName = returnobjList[a].applicationName;
                                                }
                                                var sysDepartmentName = "";
                                                if(returnobjList[a].departmentName != null){
                                                    sysDepartmentName = returnobjList[a].departmentName;
                                                }
                                                var localValue="";
                                                if(returnobjList[a].locInfo != null){
                                                    localValue = returnobjList[a].locInfo;
                                                }
                                                var sysResult = "";
                                                if(returnobjList[a].info != null){
                                                    sysResult = returnobjList[a].info;
                                                }
                                                var rettime="";
                                                if(returnobjList[a].retTime != null){
                                                    rettime = returnobjList[a].retTime;
                                                }
                                                returnobjHtml +=
                                                    "<tr> " +
                                                    "<td>" + page + "</td> " +
                                                    "<td>" + sysDepartmentName + "</td> " +
                                                    "<td>" + applicationName + "</td> " +
                                                    "<td>" + dictionaryValue + "</td> " +
                                                    "<td>" + localValue + "</td> " +
                                                    "<td>" + returnobjList[a].createTime + "</td> " +
                                                    "<td>" + rettime + "</td> " +
                                                    "<td>" + statusType + "</td> " +
                                                    "<td>" + sysResult + "</td> " +
                                                    "<td style='text-align: center;color: #2283C5;'> " +
                                                    "<span>";
                                                if (returnobjList[a].status == '0') {
                                                    returnobjHtml += "<a style='cursor:pointer;text-decoration:none' class='returnobjUpdate ishow' value='" + a + "'> 编辑 </a> " +
                                                        "<a style='cursor:pointer;text-decoration:none' class='returnobjSend ishow' value='" + a + "'>| 下发 </a>" +
                                                        "<a style='cursor:pointer;text-decoration:none' class='returnobjDelete ishow' value='" + a + "'>| 删除 </a> ";
                                                } else {
                                                    returnobjHtml += "<a style='cursor:pointer;text-decoration:none' class='returnobjDetail' value='" + a + "'> 查看 </a> ";
                                                }

                                                returnobjHtml += "</span>" +
                                                    "</td> " +
                                                    "</tr>";
                                                var page = (re.pageIndex - 1) * 10 + a + 1
                                            }
                                            $("#returnobjTable").empty();
                                            $("#returnobjTable").append(returnobjHtml);
                                            QuanXian();
                                        }
                                    });
                                }
                            };
                            $('#data-pagination').children().remove();
                            $('#data-pagination').show();
                            $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {
                }
            });
        }

        //新增
        function initSelect(){
            nodes = {
                nodeid: null,
                nodetext: null
            };
            GetApplication();
            GetDictionary();
            GetLocation();
        }

        //新建按钮点击事件
        $('#returnobjInsertButton').on('click', function () {
            //初始化
            initSelect();
            returnobjInsert(this);
        });

        //获取密品类型
        function GetDictionary() {
            var dictionary="<option value=\"\"></option>";
            $.ajax({
                url: "/product/selectDictionary.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        for(var i=0;i<response.data.length;i++){
                            var code=response.data[i].code;
                            var value=response.data[i].value;
                            if(response.data[i].type == 'productType') {
                                dictionary += "<option value=\"" + code + "\">" + value + "</option>"
                            }
                        }
                        $("#addreturnobj_dictionary").empty();
                        $("#addreturnobj_dictionary").append(dictionary);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取所属系统
        function GetApplication() {
            $.ajax({
                url: "/application/selectApplication.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var applicationListHtml="<option value=\"\"></option>";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            applicationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].name + "</option>"
                        }
                        $("#addreturnobj_application").empty();
                        $("#addreturnobj_application").append(applicationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取位置信息
        function GetLocation() {
            $.ajax({
                url: "/location/selectLocation.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var locationListHtml="<option value=\"\"></option>";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            locationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].locinfo + "</option>"
                        }
                        $("#addreturnobj_location").empty();
                        $("#addreturnobj_location").append(locationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //根据department获取相应的Location信息   新增
        function  searchLoopLocation(nodeid) {
            $.ajax({
                url: "/location/selectLocationByDept.action",
                type: 'POST',
                dataType: 'json',
                data: {
                    "nodeId": nodeid},
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var locationListHtml="<option value=\"\"></option>";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            locationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].locinfo + "</option>"
                        }
                        $("#addreturnobj_location").empty();
                        $("#addreturnobj_location").append(locationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //        组织机构树形弹窗按钮
        $('#addreturnobj_department').on('click', function () {
            layer.open({
                type: 1,
                title: '选择组织机构',
                shadeClose: true,
                //shade: 0.8,
                area: ['40%', '80%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success:function (layero,index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render") ;
                },
                yes: function (index) {
                    searchLoopLocation(nodes.nodeid);
                    layer.close(index);
                    $("#addreturnobj_department").val(nodes.nodetext);
                    $("#addreturnobj_department").attr("value", nodes.nodeid);
                },
                btn2: function (index) {
                    $("#addreturnobj_department").val("");
                    $("#addreturnobj_department").attr("value", null);
                    layer.close(index);
                }
            });
        });

        var returnobjApplication;
        var returnobjDepartment;
        var returnobjLocation;
        var returnobjDictionary;
        var returnobjInfo;
        var inserTableList;

        $('#returnobjInsertSelectButton').on('click', function(){
            returnobjInsertSelectButton(1);
        });

        //新建查询按钮
        function returnobjInsertSelectButton(pageIndex) {
            returnobjApplication = $("#addreturnobj_application").val();
            returnobjDepartment = $("#addreturnobj_department").attr("value");
            returnobjLocation = $("#addreturnobj_location").val();
            returnobjDictionary = $("#addreturnobj_dictionary").val();
            returnobjInfo = $("#addreturnobj_info").val();

            if(returnobjApplication == "" && returnobjDepartment == "" && returnobjLocation==""
                && returnobjDictionary == "" && returnobjInfo == ""){
                $("#returnobjInsertTable").empty();
                inserTableList = '';
                $('#insert-data-pagination').hide();
                return;
            }

            if(returnobjDepartment == null ||　returnobjDepartment == ''){
                layer.msg('组织机构名称不能为空', {time: 2000});
                $("#returnobjInsertTable").empty();
                inserTableList = '';
                $('#insert-data-pagination').hide();
                return;
            }

            var pageIndex =pageIndex; //当前页码
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Returnobj/select.action",
                traditional: true,
                data: {
                    "returnobject": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                            "searchDepartment": returnobjDepartment,
                            "applicationId": returnobjApplication,
                            "locationId":returnobjLocation,
                            "dictionaryId":returnobjDictionary
                            //"info": returnobjInfo
                        }
                        }
                    ),
                    "isDetail": "3"
                },
                success: function (result) {
                    var re = JSON.parse(result);

                    inserTableList = re.list;

                    var inserTableHtml = "";
                    var productMiJian ="";
                    $("#returnobjInsertTable").empty();

                    for (var i = 0; i < inserTableList.length; i++) {
                        var page;
                        if (inserTableList[i].productId == null) {
                            page = (re.pageIndex - 1) * 10 + i + 1
                            var id = inserTableList[i].id;
                            var rfidCode = "";
                            if (inserTableList[i].rfidCode != null) {
                                rfidCode = inserTableList[i].rfidCode;
                            }
                            var departmentName = "";
                            if (inserTableList[i].departmentName != null) {
                                departmentName = inserTableList[i].departmentName;
                            }
                            var applicationName = "";
                            if (inserTableList[i].applicationName != null) {
                                applicationName = inserTableList[i].applicationName;
                            }


                            //判断该密品下是否有密件a
                            var mijianList = new Array();//随机密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < inserTableList.length; j++) {
                                if (inserTableList[j].productId != null && inserTableList[j].productId == id) {
                                    mijianList.push(inserTableList[j]);
                                }
                            }

                            inserTableHtml = "<tr> ";

                            if (mijianList.length != 0) {
                                inserTableHtml += "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>Details</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            }else{
                                inserTableHtml += "<td class='center'>" +
                                "<div class='action-buttons'>" +
                                "</div>" +
                                "</td>";

                            }

                            inserTableHtml += "<td hidden=hidden>" + id + "</td> " +
                                "<td>" + inserTableList[i].proCode + "</td> " +
                                "<td>" + inserTableList[i].serNum + "</td> " +
                                "<td>" + inserTableList[i].dictionaryvalue + "</td> " +
                                "<td>" + inserTableList[i].model + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "<td>" + applicationName + "</td> " +
                                "<td>" + departmentName + "</td> " +
                                "<td>" + inserTableList[i].locationInfo + "</td> " +
                                "</tr>";

                            if (mijianList.length != 0) {
                                inserTableHtml += "<tr class='detail-row'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>随机密件</h6>" +
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                $.each(mijianList, function (index, item) {
                                    var id = item.id;
                                    var rfidCode = "";
                                    if (item.rfidCode != null) {
                                        rfidCode = item.rfidCode;
                                    }
                                    var dictionaryValue = "";
                                    if (item.dictionaryvalue != null) {
                                        dictionaryValue = item.dictionaryvalue;
                                    }
                                    inserTableHtml += "<tr style='height: 30px'>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >+id+</td>" +
                                        "<td style='padding-left: 20px'>" + "类别 ：" + dictionaryValue + "</td>" +
                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                        "</tr>";
                                })
                                inserTableHtml +=
                                    "</table>" +
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                            $("#returnobjInsertTable").append(inserTableHtml);
                        }
                       // var page = (re.pageIndex - 1) * 10 + i + 1;

                    }
                    var Page = {
                        pageIndex: re.pageIndex,
                        totalPages: re.totalPages
                    }
                        //分页
                        //fenye(Page);

                        //展开table关键代码
                        $(".show-details-btn").on('click', function(e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                    },
                error: function (result) {
                    }
            });
        }

        function fenye(Page) {
            var options;
            if(Page.totalPages!=0){
                options = {
                    bootstrapMajorVersion: 3,
                    currentPage: Page.pageIndex,    //变量名必须为currentPage
                    totalPages: Page.totalPages,    //变量名必须为totalPages
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
                        returnobjInsertSelectButton(page);
                    }
                }
                $('#insert-data-pagination').show();
                $('#insert-data-pagination').bootstrapPaginator(options);
            }
            else{
                $('#insert-data-pagination').hide();
            }

        }
        //新增
        function returnobjInsert(){
            $("#addreturnobj_department").val("");
            $("#addreturnobj_application").val("");
            $("#addreturnobj_location").val("");
            $("#addreturnobj_dictionary").val("");
            $("#addreturnobj_info").val("");

            $("#addreturnobj_department").attr("disabled", false);
            $("#addreturnobj_application").attr("disabled", false);
            $("#addreturnobj_location").attr("disabled", false);
            $("#addreturnobj_dictionary").attr("disabled", false);
            $("#addreturnobj_info").attr("disabled", false);
            $("#returnobjInsertTable").empty();

            layer.open({
                type: 1,
                title: '新增',
                shadeClose: true,
                //shade: 0.8,
                offset:'0px',
                area: ['100%', '100%'],
                content: $('#addForm'),
                btn: ['保存', '取消'],
                btnAlign: 'c', //按钮居中
                yes: function () {//保存
                    returnobjApplication = $("#addreturnobj_application").val();
                    returnobjDepartment = nodes.nodeid;
                    returnobjLocation = $("#addreturnobj_location").val();
                    returnobjDictionary = $("#addreturnobj_dictionary").val();
                    returnobjInfo = $("#addreturnobj_info").val();

                    if(inserTableList == undefined ||　inserTableList.length == 0){
                        inserTableList = '';
                        layer.msg('密品信息为空', {time: 2000});
                        return;
                    }
                    if(returnobjDepartment == undefined && returnobjDepartment == null){
                        layer.msg('单位名称不能为空', {time: 2000});
                        return ;
                    }
                    layer.load(2);
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/Returnobj/insert.action",
                        traditional: true,
                        data: {
                            "returnobj":  JSON.stringify(
                                {
                                    "dictionaryId": returnobjDictionary,
                                    "applicationId": returnobjApplication,
                                    "departmentId": returnobjDepartment,
                                    "locationId": returnobjLocation,
                                    "info": returnobjInfo
                                }
                            )
                        },
                        success: function (result) {
                            var re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                returnobjInsertClean();
                                layer.closeAll();
                                returnobjSelect();
                                returnobjClean();
                            } else if (re.status == ("false")) {
                                layer.msg(re.msg, {time: 2000});
                                layer.closeAll();
                            }
                        },
                        error: function () {
                            layer.msg('保存异常', {time: 2000});
                            layer.closeAll();
                        }
                    });

                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        //查看密品详情
        $(document).on("click", ".returnobjDetail", function () {
            returnobjDetail(this);
        });

        function returnobjDetail(op) {
            var option = returnobjList[op.getAttribute("value")];
            itemId = option.id;
            $("#detail_createtime").val(option.createTime);
            $("#detail_rettime").val(option.retTime);

            $("#detail_createtime").attr("disabled", true);
            $("#detail_rettime").attr("disabled", true);

            returnobjDetailSelectButton(1, itemId);//初始化查询

            layer.open({
                type: 1,
                title: '查看计划',
                shadeClose: true,
                //shade: 0.8,
                offset:'0px',
                area: ['100%', '100%'],
                content: $('#detailForm'),
                btn: ['确认'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    layer.closeAll();
                }
            });
        }

        var detailTableList;
        var itemId;

        //查看
        function returnobjDetailSelectButton(pageIndex, Stringid){
            var pageIndex = pageIndex;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Returnobj/select.action",
                traditional: true,
                data: {
                    "returnobject": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                            "Stringid": Stringid
                        }
                        }
                    ),
                    "isDetail": "4"
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    detailTableList = re.list;

                    var detailTableHtml = "";

                    var productMiJian ="";
                    $("#detailTable").empty();
                    for (var i = 0; i < detailTableList.length; i++) {
                        var page;
                        if(detailTableList[i].productId==null){
                            page = (re.pageIndex - 1) * 10 + i + 1
                            var id=detailTableList[i].id;
                            var rfidCode="";
                            if(detailTableList[i].rfidCode!=null){
                                rfidCode=detailTableList[i].rfidCode;
                            }
                            var departmentName = "";
                            if(detailTableList[i].depName != null){
                                departmentName = detailTableList[i].depName;
                            }
                            var localInfo = "";
                            if(detailTableList[i].locInfo != null){
                                localInfo = detailTableList[i].locInfo;
                            }
                            var result = "无";
                            if(detailTableList[i].result == '1'){
                                result = "清点中";
                            }

                            var mijianList=new Array();//随机密件List
                            //判断该密品下是否有密件
                            //for(var j=0;j<detailTableList.length;j++)
                            //{
                              //  if(detailTableList[j].productId!=null&&detailTableList[j].productId==id)
                               // {
                                 //   mijianList.push(detailTableList[j]);
                                //}
                            //}
                            if(detailTableList[i].productList != null){
                                for(var j=0;j<detailTableList[i].productList.length;j++)
                                {
                                    mijianList.push(detailTableList[i].productList[j]);
                                }
                            }

                            detailTableHtml = "<tr> " ;
                            if(mijianList.length!=0){
                                detailTableHtml += "<td class='center'>"+
                                "<div class='action-buttons'>"+
                                "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>"+
                                "<i class='ace-icon fa fa-angle-double-down showtable' ></i>"+
                                "<span class='sr-only'>Details</span>"+
                                "</a>"+
                                "</div>"+
                                "</td>";
                            }else{
                                detailTableHtml += "<td class='center'>"+
                                    "<div class='action-buttons'>"+
                                    "</div>"+
                                    "</td>";
                            }
                            detailTableHtml += "<td hidden=hidden>" + id + "</td> " +
                                "<td>" + detailTableList[i].proCode + "</td> " +
                                "<td>" + detailTableList[i].serNum + "</td> " +
                                "<td>" + detailTableList[i].dictionaryValue + "</td> " +
                                "<td>" + detailTableList[i].model + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "<td>" + detailTableList[i].applicationName + "</td> " +
                                "<td>" + departmentName + "</td> " +
                                "<td>" + localInfo + "</td> " +
                                "<td>" + result + "</td> " +
                                "</tr>";

                            if(mijianList.length!=0){
                                detailTableHtml +="<tr class='detail-row'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>随机密件</h6>"+
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>" ;
                                $.each(mijianList,function (index,item) {
                                    var id=item.id;
                                    var rfidCode="";
                                    if( item.rfidCode!=null){
                                        rfidCode=item.rfidCode;
                                    }
                                    var dictionaryValue = "";
                                    if( item.dictionaryValue!=null){
                                        dictionaryValue=item.dictionaryValue;
                                    }
                                    var result = "无";
                                    if(item.result == '1'){
                                        result = "清点中";
                                    }
                                    detailTableHtml += "<tr style='height: 30px'>"+
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >+id+</td>" +
                                        "<td style='padding-left: 20px'>" +"类别 ：" +dictionaryValue  +"</td>" +
                                        "<td style='padding-left: 40px'>"+" RFID编码 : "+ rfidCode+"</td>" +
                                        "<td style='padding-left: 40px'>"+" 备注 : "+ item.info+"</td>" +
                                        "<td style='padding-left: 40px'>"+" 清退结果 : "+ result+"</td>" +
                                        "</tr>" ;
                                })
                                detailTableHtml +=
                                    "</table>"+
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }

                            $("#detailTable").append(detailTableHtml);
                        }
                        var page = (re.pageIndex - 1) * 10 + i + 1;
                    }
                    var Page={
                        pageIndex:re.pageIndex,
                        totalPages:re.totalPages
                    }

                    //分页
                   // fenyeDetail(Page, Stringid);
                    //展开table关键代码
                    $(".show-details-btn").on('click', function(e) {
                        e.preventDefault();
                        $(this).closest('tr').next().toggleClass('open');
                        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                    });
                },
                error: function (result) {
                }
            });
        }

        function fenyeDetail(Page, Stringid) {
            var options;
                if( Page.totalPages != 0){
                    options = {
                        bootstrapMajorVersion: 3,
                        currentPage: Page.pageIndex,    //变量名必须为currentPage
                        totalPages: Page.totalPages,    //变量名必须为totalPages
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
                            returnobjDetailSelectButton(page, Stringid);
                        }
                    };
                    $('#detail-data-pagination').show();
                    $('#detail-data-pagination').bootstrapPaginator(options);
                }else{
                    options = {
                        bootstrapMajorVersion: 3,
                        currentPage: Page.pageIndex,    //变量名必须为currentPage
                        totalPages: Page.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {

                        }
                    };
                    $('#detail-data-pagination').hide();
                }

        }

        var editTableList;
        var editInfo;
        var editDepartment;
        var editApplication;
        var editLocation;
        var editDictionary;
        //编辑界面查询
        function returnobjEditSelectButton(pageIndex,Stringid){
            editDepartment =  $("#edit_department").attr("value");
            editApplication = $("#edit_application").val();
            editLocation = $("#edit_location").val();
            editDictionary = $("#edit_dictionary").val();
            editInfo =  $("#editreturnobj_info").val();

            var pageIndex = pageIndex;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Returnobj/select.action",
                traditional: true,
                data: {
                    "returnobject": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                            "Stringid": Stringid
                        }
                        }
                    ),
                    "isDetail": "4"
                },
                success: function (result) {
                    var re = JSON.parse(result);

                    editTableList = re.list;

                    var editTableHtml = "";

                    var productMiJian ="";
                    $("#editTable").empty();
                    for (var i = 0; i < editTableList.length; i++) {

                            var page;
                            if(editTableList[i].productId==null){
                                page = (re.pageIndex - 1) * 10 + i + 1
                                var id=editTableList[i].id;
                                var rfidCode="";
                                if(editTableList[i].rfidCode!=null){
                                    rfidCode=editTableList[i].rfidCode;
                                }
                                var departmentName = "";
                                if(editTableList[i].depName != null){
                                    departmentName = editTableList[i].depName;
                                }
                                var localInfo = "";
                                if(editTableList[i].locInfo != null){
                                    localInfo = editTableList[i].locInfo;
                                }
                                var result = "";
                                if(editTableList[i].result != null){
                                    result = editTableList[i].result;
                                }
                                var applicationName = "";
                                if(editTableList[i].applicationName != null){
                                    applicationName = editTableList[i].applicationName;
                                }

                                var mijianList=new Array();//随机密件List
                                //判断该密品下是否有密件
                               // for(var j=0;j<editTableList.length;j++)
                             //   {
                                ///    if(editTableList[j].productId!=null&&editTableList[j].productId==id)
                               //     {
                              //          mijianList.push(editTableList[j]);
                                //    }
                             ///   }
                                //判断该密品下是否有密件
                                if(editTableList[i].productList != null){
                                    for(var j=0;j<editTableList[i].productList.length;j++)
                                    {
                                        mijianList.push(editTableList[i].productList[j]);
                                    }
                                }

                            editTableHtml = "<tr> ";

                                if(mijianList.length!=0){
                                    editTableHtml +=  "<td class='center'>"+
                                        "<div class='action-buttons'>"+
                                        "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>"+
                                        "<i class='ace-icon fa fa-angle-double-down showtable' ></i>"+
                                        "<span class='sr-only'>Details</span>"+
                                        "</a>"+
                                        "</div>"+
                                        "</td>";
                                }else{
                                    editTableHtml +=  "<td class='center'>"+
                                        "<div class='action-buttons'>"+
                                        "</div>"+
                                        "</td>";
                                }

                                editTableHtml += "<td hidden=hidden>" + id + "</td> " +
                                "<td>" + editTableList[i].proCode + "</td> " +
                                "<td>" + editTableList[i].serNum + "</td> " +
                                "<td>" + editTableList[i].dictionaryValue + "</td> " +
                                "<td>" + editTableList[i].model + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "<td>" + applicationName + "</td> " +
                                "<td>" + departmentName + "</td> " +
                                "<td>" + editTableList[i].locInfo + "</td> " +
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>" +
                                "<a style='cursor:pointer;text-decoration:none' class='editDelete' value='" + i + "'> 删除 </a> " +
                                "</span>" +
                                "</td> " +
                                "</tr>";

                            if(mijianList.length!=0){
                                editTableHtml +="<tr class='detail-row'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>随机密件</h6>"+
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>" ;
                                $.each(mijianList,function (index,item) {
                                    var id=item.id;
                                    var rfidCode="";
                                    if( item.rfidCode!=null){
                                        rfidCode=item.rfidCode;
                                    }
                                    var dictionaryValue="";
                                    if( item.dictionaryValue!=null){
                                        dictionaryValue=item.dictionaryValue;
                                    }
                                    editTableHtml += "<tr style='height: 30px'>"+
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >+id+</td>" +
                                        "<td style='padding-left: 20px'>" +"类别 ：" +dictionaryValue  +"</td>" +
                                        "<td style='padding-left: 40px'>"+" RFID编码 : "+ rfidCode+"</td>" +
                                        "<td style='padding-left: 40px'>"+" 备注 : "+ item.info+"</td>" +
                                        "</tr>" ;
                                })
                                editTableHtml +=
                                    "</table>"+
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                            $("#editTable").append(editTableHtml);
                        }
                        var page = (re.pageIndex - 1) * 10 + i + 1;
                    }
                    var Page={
                        pageIndex:re.pageIndex,
                        totalPages:re.totalPages
                    }
                    //分页
                    //fenyeEdit(Page, Stringid);
                    //展开table关键代码
                    $(".show-details-btn").on('click', function(e) {
                        e.preventDefault();
                        $(this).closest('tr').next().toggleClass('open');
                        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                    });
                },
                error: function (result) {
                }
            });
        }

        //编辑删除
        $(document).on("click", ".editDelete", function () {
            var StringArray = [];
            var StringId;
            StringArray[0] = editTableList[this.getAttribute("value")].itemId;
            StringId = editTableList[this.getAttribute("value")].returnobjId;//
            itemDelete(StringArray, StringId);
        });

        function itemDelete(deleteList, StringId) {
            layer.confirm("<div style='text-align: center;'>确认删除？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/Returnobj/deleteItem.action",
                    traditional: true,
                    data: {
                        "deleteList": deleteList,
                        "returnobjId" : StringId
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            returnobjEditSelectButton(1, StringId);
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

        function fenyeEdit(Page, Stringid) {
            var options;
            if(Page.totalPages != 0){
                options  = {
                    bootstrapMajorVersion: 3,
                    currentPage: Page.pageIndex,    //变量名必须为currentPage
                    totalPages: Page.totalPages,    //变量名必须为totalPages
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
                        returnobjEditSelectButton(page, Stringid);
                    }
                };
                $('#edit-data-pagination').show();
                $('#edit-data-pagination').bootstrapPaginator(options);
            }else{
                options  = {
                    bootstrapMajorVersion: 3,
                    currentPage: Page.pageIndex,    //变量名必须为currentPage
                    totalPages: Page.totalPages,    //变量名必须为totalPages
                    itemTexts: function (type, page, current) {
                    }
                };
                $('#edit-data-pagination').hide();
            }


        }

        //编辑
        $(document).on("click", ".returnobjUpdate", function () {
            returnobjUpdate(this);
        });

        //获取密品类型
        function GetEditDictionary() {
            var dictionary="<option value=\"\"></option>";
            $.ajax({
                url: "/product/selectDictionary.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        for(var i=0;i<response.data.length;i++){
                            var code=response.data[i].code;
                            var value=response.data[i].value;
                            if(response.data[i].type == 'productType'){
                                dictionary += "<option value=\"" + code + "\">" + value + "</option>"
                            }
                        }
                        $("#edit_dictionary").empty();
                        $("#edit_dictionary").append(dictionary);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取所属系统
        function GetEditApplication() {
            $.ajax({
                url: "/application/selectApplication.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var applicationListHtml="<option value=\"\"></option>";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            applicationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].name + "</option>"
                        }
                        $("#edit_application").empty();
                        $("#edit_application").append(applicationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        function  editLoopLocation(nodeid) {
            $.ajax({
                url: "/location/selectLocationByDept.action",
                type: 'POST',
                dataType: 'json',
                data: {
                    "nodeId": nodeid},
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var locationListHtml="<option value=\"\"></option>";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            locationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].locinfo + "</option>"
                        }
                        $("#edit_location").empty();
                        $("#edit_location").append(locationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取位置信息
        function GetEditLocation(departmentId) {

            if(departmentId != null && departmentId != ""){
                editLoopLocation(departmentId);
            }else {
                $.ajax({
                    url: "/location/selectLocation.action",
                    type: 'POST',
                    dataType: 'json',
                    cache: false,
                    async: false,
                    success: function (response) {
                        if (response.status == "true") {
                            var locationListHtml = "<option value=\"\"></option>";
                            var data = response.data;
                            for (var j = 0; j < data.length; j++) {
                                locationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].locinfo + "</option>"
                            }
                            $("#edit_location").empty();
                            $("#edit_location").append(locationListHtml);
                        }
                    },
                    error: function (response) {

                    }
                })
            }
        }

        function initEditSelect(departmentId){
            GetEditApplication();
            GetEditDictionary();
            GetEditLocation(departmentId);
        }

        var itemId;
        function returnobjUpdate(op) {
            var option = returnobjList[op.getAttribute("value")];
            itemId = option.id;
            initEditSelect(option.departmentId);
            $("#edit_department").val(option.departmentName);
            $("#edit_application").val(option.applicationId);
            $("#edit_application").trigger("chosen:updated");
            $("#edit_location").val(option.locationId);
            $("#edit_location").trigger("chosen:updated");
            $("#edit_dictionary").val(option.dictionaryId);
            $("#edit_dictionary").trigger("chosen:updated");
            $("#editreturnobj_info").val(option.info);

          /*  if(option.departmentName != null){
                $("#edit_department").attr("disabled", true);
                $("#edit_location").attr("disabled", true);
            }else if(option.locationId != ""){
                $("#edit_department").attr("disabled", true);
                $("#edit_location").attr("disabled", true);
            }else{
                $("#edit_department").attr("disabled", false);
                $("#edit_location").attr("disabled", false);
            }

            if(option.applicationId != ""){
                $("#edit_application").attr("disabled", true);
            }else{
                $("#edit_application").attr("disabled", false);
            }

            if(option.dictionaryId != ""){
                $("#edit_dictionary").attr("disabled", true);
            }else{
                $("#edit_dictionary").attr("disabled", false);
            }*/
            $("#edit_department").attr("disabled", true);
            $("#edit_location").attr("disabled", true);
            $("#edit_dictionary").attr("disabled", true);
            $("#edit_application").attr("disabled", true);
            $("#editreturnobj_info").attr("disabled", false);

            returnobjEditSelectButton(1 ,itemId);//初始化查询
            layer.open({
                type: 1,
                title: '编辑',
                shadeClose: true,
                //shade: 0.8,
                offset:'0px',
                area: ['100%', '100%'],
                content: $('#editForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    //进行保存
                    editDepartment = nodes.nodeid;
                    editApplication = $("#edit_application").val();
                    editLocation = $("#edit_location").val();
                    editDictionary = $("#edit_dictionary").val();
                    editInfo = $("#editreturnobj_info").val();
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/Returnobj/update.action",
                        traditional: true,
                        data: {
                            "returnobj": JSON.stringify(
                                {
                                    "id":itemId,
                                    "dictionaryId": editDictionary,
                                    "applicationId": editApplication,
                                    "departmentId": editDepartment,
                                    "locationId": editLocation,
                                    "info": editInfo
                                }
                            )
                        },
                        success: function (result) {
                            var re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                layer.closeAll();
                                returnobjSelect();
                                returnobjClean();
                            } else if (re.status == ("false")) {
                                layer.msg(re.msg, {time: 1000});
                            }
                        },
                        error: function (result) {
                            layer.msg('编辑计划异常', {time: 1000});
                        }
                    });

                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        //删除计划
        $(document).on("click", ".returnobjDelete", function () {
            var StringArray = [];
            StringArray[0] = returnobjList[this.getAttribute("value")].id
            returnobjDelete(StringArray);
        });

        function returnobjDelete(deleteList) {
            layer.confirm("<div style='text-align: center;'>确认删除？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/Returnobj/delete.action",
                    traditional: true,
                    data: {
                        "deleteList": deleteList
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            returnobjSelect();
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

        //确认下发
        $(document).on("click", ".returnobjSend", function(){
            returnobjSend(this);
        });
        function returnobjSend(op){
            var id = returnobjList[op.getAttribute("value")].id;

            layer.confirm("<div style='text-align: center;'>确认下发？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/Returnobj/send.action",
                    traditional: true,
                    data: {
                        "returnobjId": id
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            returnobjClean();
                            returnobjSelect();
                        } else if (re.status == ("false")) {
                            layer.msg(re.msg, {time: 1000});
                        }
                    },
                    error: function (result) {
                        layer.msg('下发异常！', {time: 1000});
                    }
                });
            })
        }

        var userroleaction={
            uid:'',
            menuId:'4'
        }
        function QuanXian() {
            //获取权限
            var re_data= getuserroleaction_data(userroleaction);
            if(re_data.data!=null){
                var action=re_data.data.action;
                if(action==1){
                    var a= $(".ishow").hide();
                }
            }
        }

    })
</script>

<link rel="stylesheet" href="../../assets/css/ace.onpage-help.css"/>

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../../assets/js/src/elements.onpage-help.js"></script>
<script src="../../assets/js/src/ace.onpage-help.js"></script>
</body>
</html>
