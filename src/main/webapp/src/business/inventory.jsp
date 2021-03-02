<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>密品清点</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../components/font-awesome/css/font-awesome.css"/>
    <script src="../../js/convertnull.js"></script>

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
                        <i class="ace-icon fa fa-home home-icon"></i>密品清点
                    </li>
                </ul>
            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form id="init_form">
                            <div style="border: 1px solid rgb(221, 221, 221);padding-top: 5px;min-width: 950px">
                                <table style=" height: 80px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;margin: auto;margin-bottom: 5px"
                                       border="0">
                                    <tr>
                                        <td style="padding-left: 22px">
                                            创建时间：<input class="" type="text"
                                                        name="date-range-picker" style="width: 200px"
                                                        readonly="readonly" id="id-date-range-picker-1"/>
                                            <a style="padding-left: 10px"></a>
                                            完成时间：<input class="" type="text"
                                                        name="date-range-picker" style="width: 200px"
                                                        readonly="readonly" id="id-date-range-picker-2"/>


                                            计划状态：<select class="chosen-select" id="inventorySelectStatus" style="width: 163px">
                                            <option value=""></option>
                                            <option value="0">草稿</option>
                                            <option value="1">已下发</option>
                                            <option value="2">已完成</option>
                                        </select>
                                        </td>
                                        <td style="padding-left: 5px;width: 150px" rowspan="1">
                                            <button type="button" id="inventorySelectButton"
                                                    name="inventorySelectButton" class="btn btn-info btn-xs"
                                                    style="margin-top: 0px">
                                                <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                            </button>&nbsp;
                                            <button type="button" id="inventoryCleanButton" name="inventoryCleanButton"
                                                    class="btn btn-xs btn-purple" style="width: 54.3px">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                            </button>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row" style="padding-top: 35px">
                    <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px">
                        <table id="simple-table" class="table  table-bordered table-hover">
                            <thead>
                            <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px;">
                                <label style="padding: 6px;font-size: 12px">&nbsp;密品清点列表</label>
                                <span style="float:right;padding-right: 5px">
                                            <button id="inventoryInsertButton" name="invertoryInsertButton"
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
                                <th> 位置</th>
                                <th>创建人</th>
                                <th>创建时间</th>
                                <th>完成时间</th>
                                <th> 执行人</th>
                                <th>状态</th>
                                <th>清点结果</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="inventoryTable"></tbody>
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

<!-- 新增计划信息-->
<div class="row" id="addForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            新增清点计划
        </h4>
    </div>
    <form class="" role="form" style="margin-top: 20px">
        <div style="border: 1px solid rgb(221, 221, 221);height:100px;padding-top: 5px">
            <table style=" height: 90px;font-family: 'Microsoft YaHei';font-size: 12px;min-width: 600px;margin: auto;"
                   border="0">
                <tr>
                    <td >
                        单位名称:
                        <input type="text" id="search_department" readonly="readonly" style="width: 163px">

                    </td>
                    <td>

                        <span>
                            <a style="padding-left: 10px"></a>密品类别：<select class="chosen-select" id="search_dictionary" style="width: 163px;">
                            <option value=""></option>
                        </select>
                        </span>

                    </td>
                    <td style="padding-left: 10px;width: 150px;" rowspan="2">
                        <button type="button" id="inventoryInsertSelectButton"
                                name="inventoryInsertButton" class="btn btn-info btn-xs"
                                style="margin-top: 0px">
                            <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                        </button>&nbsp;
                        <button type="button" id="inventoryInsertCleanButton" name="inventoryCleanButton"
                                class="btn btn-xs btn-purple" style="width: 54.3px">
                            <i class="ace-icon fa fa-undo bigger-110"></i>重置
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>
                        系统名称:
                        <select class="chosen-select " id="search_application"  style="width: 163px;">
                            <option value=""></option>
                        </select>

                    </td>
                    <td>
                        <a style="padding-left: 30px"></a>位置:
                        <select class="chosen-select " id="search_location"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                    </td>

                </tr>

            </table>
        </div>
    </form>
    <div class="row" style="padding-top: 0px">
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
                </tr>
                </thead>
                <tbody id="insertTable" class="table  table-bordered table-hover"></tbody>

            </table>
            <div class="padlr" align="right" style="cursor: pointer">
                 <ul id="insert-data-pagination" class="pagination">
                 </ul>
             </div>
        </div><!-- /.span -->
    </div><!-- /.row -->
</div>

<div class="row" id="detailForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            查看清点计划
        </h4>
    </div>
    <form class="form-horizontal" role="form" style="margin-top: 20px">
        <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
            <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                   border="0">
                <tr>
                    <td>
                        单位名称:
                        <input type="text" id="detail_department" readonly="readonly" style="width: 163px">
                        <a style="padding-left: 10px"></a>
                    </td>
                    <td>

                        密品类别：
                        <select class="chosen-select" id="detail_dictionary" style="width: 163px;">
                            <option value=""></option>
                        </select>
                        <a style="padding-left: 10px"></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        系统名称:
                        <select class="chosen-select" id="detail_application"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                        <a style="padding-left: 10px"></a>
                    </td>
                    <td>
                        <a style="padding-left: 30px"></a>位置：
                        <select class="chosen-select" id="detail_location"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                        <a style="padding-left: 10px"></a>
                    </td>
                    <td>
                        清点结果：
                        <input type="text" id="detail_result" readonly="readonly" style="width: 163px">
                        <a style="padding-left: 10px"></a>
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
                    <th>清点结果</th>
                </tr>
                </thead>
                <tbody id="detailTable" class="table  table-bordered table-hover"></tbody>

            </table>
             <div class="padlr" align="right" style="cursor: pointer">
                 <ul id="detail-data-pagination" class="pagination">
                 </ul>
             </div>
        </div><!-- /.span -->
    </div><!-- /.row -->
</div>

<!-- 修改计划信息-->
<div class="row" id="editForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            编辑清点计划
        </h4>
    </div>
    <form class="form-horizontal" role="form" style="margin-top: 20px">
        <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
            <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                   border="0">
                <tr>
                    <td>
                        单位名称:
                        <input type="text" id="edit_department" readonly="readonly" style="width: 163px">
                        <a style="padding-left: 10px"></a>
                    </td>
                    <td>

                        密品类别：
                        <select class="chosen-select" id="edit_dictionary" style="width: 163px;">
                            <option value=""></option>
                        </select>
                        <a style="padding-left: 10px"></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        系统名称:
                        <select class="chosen-select" id="edit_application"  style="width: 163px;">
                            <option value=""></option>
                        </select>
                        <a style="padding-left: 10px"></a>
                    </td>
                    <td>
                        位置：
                        <select class="chosen-select" id="edit_location"  style="width: 163px; margin-left: 15px;">
                            <option value=""></option>
                        </select>
                        <a style="padding-left: 10px"></a>
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
             <%--<div class="padlr" align="right" style="cursor: pointer">
                 <ul id="edit-data-pagination" class="pagination">
                 </ul>
             </div>--%>
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

        //表格数据初始化
        inventorySelect();
        //查询密品清点按钮
        $('#inventorySelectButton').on('click', function () {
            inventorySelect(this);
        });

        $('#inventoryInsertSelectButton').on('click', function(){
            inventoryInsertSelectButton(1);
        });

        $('#inventoryInsertCleanButton').on('click', function(){
            inventoryInsertCleanButton();
        });

        //初始化查询
        var inventList;
        var creattime;
        var rettime;
        var retStarttime;
        var retEndtime;
        var status;

        function inventorySelect() {
            status = $('#inventorySelectStatus').val();
            //创建时间
            var data = $("#id-date-range-picker-1").val();
            //完成时间
            var retData =  $("#id-date-range-picker-2").val();
            creattime = data.substring(0, 10);
            rettime = data.substring(13, 23);

            retStarttime = retData.substring(0, 10);
            retEndtime = retData.substring(13, 23);
            var pageIndex = 1;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Invent/select.action",
                traditional: true,
                data: {
                    "invertory": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "creattime": creattime,
                                "rettime": rettime,
                                "retStarttime":retStarttime,
                                "retEndtime":retEndtime,
                                "status": status
                            }
                            }
                    ),
                    "isDetail": "4"
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    inventList = re.list;

                    var inventoryHtml = "";
                    var ids = [];
                    $("#inventoryTable").empty();
                    if(!inventList){
                        $('#data-pagination').hide();
                        return;
                    }

                    for (var a = 0; a < inventList.length; a++) {
                        var m = 0;
                        for (var i = 0; i < ids.length; i++) {
                            if (ids[i] == inventList[a].id) {
                                m = 1;
                                break;
                            }
                        }
                        if (m == 0) {
                            ids[ids.length] = inventList[a].id;
                            var page = (re.pageIndex - 1) * 10 + a + 1;
                            var statusType;
                            if (inventList[a].status == '2') {
                                statusType = '已完成';
                            }
                            else if ('0' == inventList[a].status) {
                                statusType = '草稿';
                            } else {
                                statusType = '已下发';
                            }

                            var sysUserName = "";
                            if(inventList[a].sysuserName != null){
                                sysUserName = inventList[a].sysuserName;
                            }
                            var sysDepartmentName = "";
                            if(inventList[a].departmentName != null){
                                sysDepartmentName = inventList[a].departmentName;
                            }
                            var sysPerformerName = "";
                            if(inventList[a].performerName != null){
                                sysPerformerName = inventList[a].performerName;
                            }
                            var sysResult = "";
                            if(inventList[a].status == '0'){
                                sysResult = "无";
                            }
                            else if(inventList[a].status == '1'){
                                sysResult = "清点中";
                            }else if(inventList[a].status == '2'){
                                sysResult = inventList[a].result;
                            }
                            var createTime = "";
                            if(inventList[a].creattime != null){
                                createTime =  inventList[a].creattime;
                            }
                            var application = "";
                            if(inventList[a].applicationName != null){
                                application = inventList[a].applicationName;
                            }
                            var rettimeDate = "";
                            if(inventList[a].rettime != null){
                                rettimeDate = inventList[a].rettime;
                            }
                            var dictionaryValue="";
                            if(inventList[a].dictionaryValue != null){
                                dictionaryValue = inventList[a].dictionaryValue;
                            }
                            var TypelocInfo = "";
                            if(inventList[a].locInfo != null){
                                TypelocInfo = inventList[a].locInfo;
                            }

                            inventoryHtml +=
                                    "<tr> " +
                                    "<td>" + page + "</td> " +
                                    "<td>" + sysDepartmentName + "</td> " +
                                    "<td>" + application + "</td> " +
                                    "<td>" + dictionaryValue + "</td> " +
                                    "<td>" + TypelocInfo + "</td> " +
                                    "<td>" + sysUserName + "</td> " +
                                    "<td>" + createTime + "</td> " +
                                    "<td>" + rettimeDate + "</td> " +
                                    "<td>" + sysPerformerName + "</td> " +
                                    "<td>" + statusType + "</td> " +
                                    "<td>" + sysResult + "</td> " +
                                    "<td style='text-align: center;color: #2283C5;'> " +
                                    "<span>";
                            if (inventList[a].status == '0') {
                                inventoryHtml += "<a style='cursor:pointer;text-decoration:none' class='inventoryUpdate ishow' value='" + a + "'> 编辑 </a> " +
                                        "<a style='cursor:pointer;text-decoration:none' class='inventorySend ishow' value='" + a + "'>| 下发 </a>" +
                                        "<a style='cursor:pointer;text-decoration:none' class='inventoryDelete ishow' value='" + a + "'>| 删除 </a> ";
                            } else {
                                inventoryHtml += "<a style='cursor:pointer;text-decoration:none' class='inventoryDetail' value='" + a + "'> 查看 </a> ";
                                /*  "|<a style='cursor:pointer;text-decoration:none' class='checkInUpdate' value='" + a + "'> 打印 </a>";*/
                            }

                            inventoryHtml += "</span>" +
                                    "</td> " +
                                    "</tr>";
                            var page = (re.pageIndex - 1) * 10 + a + 1
                        }
                    }

                    $("#inventoryTable").append(inventoryHtml);

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
                                url: "/Invent/select.action",
                                traditional: true,
                                data: {
                                    "invertory": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "creattime": creattime,
                                                "rettime": rettime,
                                                "retStarttime":retStarttime,
                                                "retEndtime":retEndtime,
                                                "status": status
                                            }
                                            }
                                    ),
                                    "isDetail": "4"
                                },
                                success: function (result) {
                                    var re = JSON.parse(result);

                                    inventList = re.list;

                                    var inventoryHtml = "";
                                    var ids = [];
                                    for (var a = 0; a < inventList.length; a++) {
                                        var m = 0;
                                        for (var i = 0; i < ids.length; i++) {
                                            if (ids[i] == inventList[a].id) {
                                                m = 1;
                                                break;
                                            }
                                        }
                                        if (m == 0) {
                                            ids[ids.length] = inventList[a].id;
                                            var page = (re.pageIndex - 1) * 10 + a + 1;

                                            var statusType;
                                            if (inventList[a].status == '2') {
                                                statusType = '已完成';
                                            }
                                            else if ('0' == inventList[a].status) {
                                                statusType = '草稿';
                                            } else {
                                                statusType = '已下发';
                                            }

                                            var sysUserName = "";
                                            if(inventList[a].sysuserName != null){
                                                sysUserName = inventList[a].sysuserName;
                                            }
                                            var sysDepartmentName = "";
                                            if(inventList[a].departmentName != null){
                                                sysDepartmentName = inventList[a].departmentName;
                                            }
                                            var sysPerformerName = "";
                                            if(inventList[a].performerName != null){
                                                sysPerformerName = inventList[a].performerName;
                                            }
                                            var sysResult = "";
                                            if(inventList[a].status == '0'){
                                                sysResult = "无";
                                            }
                                            else if(inventList[a].status == '1'){
                                                sysResult = "清点中";
                                            }else if(inventList[a].status == '2'){
                                                sysResult = inventList[a].result;
                                            }
                                            var createTime = "";
                                            if(inventList[a].creattime != null){
                                                createTime =  inventList[a].creattime;
                                            }
                                            var application = "";
                                            if(inventList[a].applicationName != null){
                                                application = inventList[a].applicationName;
                                            }
                                            var rettimeDate = "";
                                            if(inventList[a].rettime != null){
                                                rettimeDate = inventList[a].rettime;
                                            }
                                            var dictionaryValue="";
                                            if(inventList[a].dictionaryValue != null){
                                                dictionaryValue = inventList[a].dictionaryValue;
                                            }
                                            var TypelocInfo = "";
                                            if(inventList[a].locInfo != null){
                                                TypelocInfo = inventList[a].locInfo;
                                            }
                                            inventoryHtml +=
                                                    "<tr> " +
                                                    "<td>" + page + "</td> " +
                                                    "<td>" + sysDepartmentName + "</td> " +
                                                    "<td>" + application + "</td> " +
                                                    "<td>" + dictionaryValue + "</td> " +
                                                    "<td>" + TypelocInfo + "</td> " +
                                                    "<td>" + sysUserName + "</td> " +
                                                    "<td>" + createTime + "</td> " +
                                                    "<td>" + rettimeDate + "</td> " +
                                                    "<td>" + sysPerformerName + "</td> " +
                                                    "<td>" + statusType + "</td> " +
                                                    "<td>" + sysResult + "</td> " +
                                                    "<td style='text-align: center;color: #2283C5;'> " +
                                                    "<span>";
                                            if (inventList[a].status == '0') {
                                                inventoryHtml += "<a style='cursor:pointer;text-decoration:none' class='inventoryUpdate' value='" + a + "'> 编辑 </a> " +
                                                        "|<a style='cursor:pointer;text-decoration:none' class='inventorySend' value='" + a + "'> 下发 </a>" +
                                                        "|<a style='cursor:pointer;text-decoration:none' class='inventoryDelete' value='" + a + "'> 删除 </a> ";
                                            } else {
                                                inventoryHtml += "<a style='cursor:pointer;text-decoration:none' class='inventoryDetail' value='" + a + "'> 查看 </a> " ;
                                                /*   "|<a style='cursor:pointer;text-decoration:none' class='checkInUpdate' value='" + a + "'> 打印 </a>";*/
                                            }

                                            inventoryHtml += "</span>" +
                                                    "</td> " +
                                                    "</tr>";
                                            var page = (re.pageIndex - 1) * 10 + a + 1
                                        }
                                    }
                                    $("#inventoryTable").empty();
                                    $("#inventoryTable").append(inventoryHtml);
                                    QuanXian();

                                }
                            });
                        }
                    };
                    $('#data-pagination').show();
                    $('#data-pagination').children().remove();
                    $('#data-pagination').bootstrapPaginator(options);
                    QuanXian();
                },
                error: function (result) {
                }

            });
        }

        function inventoryInsertCleanButton(){
            //$("#search_department").val("");
            $("#search_application").val("");
            $("#search_location").val("");
            $("#search_dictionary").val("");
        }

        //新增
        var inserTableList;
        var searchDepartment;
        var  searchApplication;
        var searchLocation;
        var searchDictionary;

        //新建页面 查询按钮
        function inventoryInsertSelectButton(pageIndex){
            //searchDepartment = $("#search_department").attr("value");
            searchApplication = $("#search_application").val();
            searchLocation = $("#search_location").val();
            searchDictionary = $("#search_dictionary").val();

            if(searchApplication == "" && searchDepartment == "" && searchLocation==""
                    && searchDictionary == "" ){
                $("#insertTable").empty();
                inserTableList = '';
                $('#insert-data-pagination').hide();
                return;
            }

            var pageIndex =pageIndex; //当前页码
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Invent/select.action",
                traditional: true,
                data: {
                    "invertory": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "searchDepartment": searchDepartment,
                                "applicationId": searchApplication,
                                "locationId":searchLocation,
                                "dictionaryId":searchDictionary,
                            }
                            }
                    ),
                    "isDetail": "5"
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    inserTableList = re.list;

                    var inserTableHtml = "";
                    var productMiJian ="";
                    $("#insertTable").empty();
                    if(!inserTableList){
                        $('#insert-data-pagination').hide();

                        return;
                    }

                    for (var i = 0; i < inserTableList.length; i++) {
                        var page;

                        page = (re.pageIndex - 1) * 10 + i + 1
                        var id=inserTableList[i].id;
                        var rfidCode="";
                        if(inserTableList[i].rfidCode!=null){
                            rfidCode=inserTableList[i].rfidCode;
                        }
                        var departmentName = "";
                        if(inserTableList[i].departmentName != null){
                            departmentName = inserTableList[i].departmentName;
                        }
                        var mijianList=new Array();//随机密件List

                        //判断该密品下是否有密件
                        if(inserTableList[i].productViewList != null){
                            for(var j=0;j<inserTableList[i].productViewList.length;j++)
                            {
                                mijianList.push(inserTableList[i].productViewList[j]);
                            }
                        }
                        if(inserTableList[i].isTrue=="1"){
                            inserTableHtml =
                                    "<tr> ";
                        }else{
                            inserTableHtml =
                                    "<tr style='background-color:lightgray'> ";
                        }

                        inserTableHtml +=
                                "<td class='center'>"+
                                "<div class='action-buttons'>";
                        if(mijianList.length!=0){
                            inserTableHtml +=
                                    "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>"+
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>"+
                                    "<span class='sr-only'>Details</span>"+
                                    "</a>";
                        }
                        var applicationPName = "";
                        if(inserTableList[i].applicationName != null){
                            applicationPName = inserTableList[i].applicationName;
                        }
                        inserTableHtml +=
                                "</div>"+
                                "</td>"+
                                "<td hidden=hidden>" + id + "</td> " +
                                "<td>" + convertNull(inserTableList[i].proCode) + "</td> " +
                                "<td>" + convertNull(inserTableList[i].serNum) + "</td> " +
                                "<td>" + convertNull(inserTableList[i].dictionaryvalue) + "</td> " +
                                "<td>" + convertNull(inserTableList[i].model) + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "<td>" + applicationPName + "</td> " +
                                "<td>" + departmentName + "</td> " +
                                "<td>" + convertNull(inserTableList[i].locationInfo) + "</td> " +
                                "</tr>"

                        if(mijianList.length!=0){
                            inserTableHtml +="<tr class='detail-row'>" +
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
                                if( item.dictionaryvalue!=null){
                                    dictionaryValue=item.dictionaryvalue;
                                }
                                inserTableHtml += "<tr style='height: 30px'>"+
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >+id+</td>" +
                                        "<td style='padding-left: 20px'>" +"类别 ：" + dictionaryValue  +"</td>" +
                                        "<td style='padding-left: 40px'>"+" RFID编码 : "+ rfidCode+"</td>" +
                                        "<td style='padding-left: 40px'>"+" 备注 : "+ item.info+"</td>" +
                                        "</tr>" ;
                            })
                            inserTableHtml +=
                                    "</table>"+
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                        }
                        $("#insertTable").append(inserTableHtml);
                        $('#insert-data-pagination').show();
                        var page = (re.pageIndex - 1) * 10 + i + 1;

                    }
                     var Page={
                     pageIndex:re.pageIndex,
                     totalPages:re.totalPages
                     }
                    //分页
                     fenye(Page)
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
            if(Page.totalPages == 0){
                $('#insert-data-pagination').hide();
                return;
            }
            var options = {
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
                    inventoryInsertSelectButton(page);
                }
            }
            $('#insert-data-pagination').show();
            $('#insert-data-pagination').bootstrapPaginator(options);
        }

        var editTableList;

        var editDepartment;
        var editApplication;
        var editLocation;
        var editDictionary;

        function inventoryEditSelectButton(pageIndex,Stringid){
            editDepartment = $("#edit_department").attr("value");
            editApplication = $("#edit_application").val();
            editLocation = $("#edit_location").val();
            editDictionary = $("#edit_dictionary").val();

            var pageIndex = pageIndex;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Invent/select.action",
                traditional: true,
                data: {
                    "invertory": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "Stringid": Stringid
                            }
                            }
                    ),
                    "isDetail": "6"
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    editTableList = re.list;
                    var editTableHtml = "";

                    var productMiJian ="";
                    $("#editTable").empty();
                    for (var i = 0; i < editTableList.length; i++) {
                        var page;

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

                        var mijianList=new Array();//随机密件List
                        if(editTableList[i].productList != null){
                            for(var j=0;j<editTableList[i].productList.length;j++)
                            {
                                mijianList.push(editTableList[i].productList[j]);
                            }
                        }

                        editTableHtml =
                                "<tr> "+
                                "<td class='center'>"+
                                "<div class='action-buttons'>";
                        if(mijianList.length!=0){
                            editTableHtml +=
                                    "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>"+
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>"+
                                    "<span class='sr-only'>Details</span>"+
                                    "</a>";
                        }
                        editTableHtml +=
                                "</div>"+
                                "</td>"+
                                "<td hidden=hidden>" + id + "</td> " +
                                "<td>" + convertNull(editTableList[i].proCode) + "</td> " +
                                "<td>" + convertNull(editTableList[i].serNum) + "</td> " +
                                "<td>" + convertNull(editTableList[i].dictionaryValue) + "</td> " +
                                "<td>" + convertNull(editTableList[i].model) + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "<td>" + convertNull(editTableList[i].applicationName) + "</td> " +
                                "<td>" + departmentName + "</td> " +
                                "<td>" + convertNull(editTableList[i].locInfo) + "</td> " +
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
                                        "<td style='padding-left: 20px'>" +"类别 ：" + dictionaryValue  +"</td>" +
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

                        var page = (re.pageIndex - 1) * 10 + i + 1;
                    }
                     var Page={
                     pageIndex:re.pageIndex,
                     totalPages:re.totalPages
                     }
                    //分页
                    fenyeEdit(Page, Stringid);
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

        function fenyeEdit(Page, Stringid) {
            if(Page.totalPages == 0){
                $('#edit-data-pagination').hide();
                return;
            }
            var options = {
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
                    inventoryEditSelectButton(page, Stringid);
                }
            }
            $('#edit-data-pagination').show();
            $('#edit-data-pagination').bootstrapPaginator(options);
        }

        function fenyeDetail(Page, Stringid) {
            if(Page.totalPages == 0){
                $('#detail-data-pagination').hide();
                return;
            }
            var options = {
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
                    inventoryDetailSelectButton(page, Stringid);
                }
            }
            $('#detail-data-pagination').show();
            $('#detail-data-pagination').bootstrapPaginator(options);
        }

        // 重置
        $('#inventoryCleanButton').on('click', function () {
            inventoryClean();
        });
        function inventoryClean() {
            $('#inventorySelectStatus').val("");
            $("#id-date-range-picker-1").val("");
            $("#id-date-range-picker-2").val("");
        }

        $('#inventoryInsertCleanButton').on('click', function () {
            inventoryInsertClean();
        });

        function inventoryInsertClean() {
           /* nodes = {
                nodeid: null,
                nodetext: null
            };*/
            //$("#search_department").val("");
            $("#search_application").val("");
            $("#search_location").val("");
            $("#search_dictionary").val("");
        }


        $('#addFormDept').on('click', function () {
            layer.open({
                type: 1,
                title: '选择组织机构',
                shadeClose: true,
                //shade: 0.8,
                area: ['80%', '80%'],
                content: $('#addFormForDepartmentSelect'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                success: function (layero, index) {
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render");
                },
                yes: function (index) {
                    layer.close(index);
                    $("#addFormDept").val(nodes.nodetext);
                    $("#addFormDept").attr("value", nodes.nodeid)
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        });
//        组织机构树形弹窗内容
        var nodes = {
            nodeid: null,
            nodetext: null
        };
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

        //新增
        $('#inventoryInsertButton').on('click', function () {
            //初始化
            initSelect();
            inventoryInsert(this);
        });

        //新建保存
        function inventoryInsert() {
            //仅仅查询本部门的
            $.ajax({
                async:false,
                type: "post",
                dataType: "html",
                url: "/dept/selectDeptUser.action",
                traditional: true,
                data: {
                },
                success: function (result) {

                    var re = JSON.parse(result)
                    nodes = {
                        nodeid: re.nodeId,
                        nodetext: re.nodeText
                    };
                },
                error: function () {
                    layer.msg('获取部门异常', {time: 1000});
                }
            });

            /*   nodes = {
             nodeid: null,
             nodetext: null
             };*/
            $("#search_department").val(nodes.nodetext);
            $("#search_application").val("");
            $("#search_location").val("");
            $("#search_dictionary").val("");

            $("#search_department").attr("disabled", true);
            $("#search_application").attr("disabled", false);
            $("#search_location").attr("disabled", false);
            $("#search_dictionary").attr("disabled", false);
            $("#insertTable").empty();

            layer.open({
                type: 1,
                title: '新增',
                shadeClose: true,
                //shade: 0.8,
                area: ['100%', '100%'],
                content: $('#addForm'),
                btn: ['保存', '取消'],
                btnAlign: 'c', //按钮居中
                yes: function () {//保存
                    searchApplication = $("#search_application").val();
                    searchDepartment = nodes.nodeid;
                    searchLocation = $("#search_location").val();
                    searchDictionary = $("#search_dictionary").val();

                    if(inserTableList == undefined ||　inserTableList.length == 0){
                        inserTableList = '';
                        layer.msg('密品信息为空', {time: 1000});
                    }
                    layer.load(2);
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/Invent/insert.action",
                        traditional: true,
                        data: {
                            "inventory":  JSON.stringify(
                                    {
                                        "dictionaryId": searchDictionary,
                                        "applicationId": searchApplication,
                                        "searchDepartment": searchDepartment,
                                        "locationId": searchLocation
                                    }
                            )
                        },
                        success: function (result) {

                            var re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                inventoryInsertClean();
                                layer.closeAll();
                                inventorySelect();
                                inventoryClean();
                            } else if (re.status == ("false")) {
                                layer.msg(re.msg, {time: 1000});
                            }
                        },
                        error: function () {
                            layer.msg('保存异常', {time: 1000});
                        }
                    });

                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        }

        function initSelect(){
            GetApplication();
            GetDictionary();
            GetLocation();
        }

        function initEditSelect(depId){
            GetEditApplication();
            GetEditDictionary();
            GetEditLocation(depId);
        }

        function initDetailSelect(){
            GetDetailApplication();
            GetDetailDictionary();
            GetDetailLocation();
        }

        //        组织机构树形弹窗按钮
        $('#search_department').on('click', function () {
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
                    $("#search_department").val(nodes.nodetext);
                    $("#search_department").attr("value", nodes.nodeid);
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
                    editLoopLocation(nodes.nodeid);
                    layer.close(index);
                    $("#edit_department").val(nodes.nodetext);
                    $("#edit_department").attr("value", nodes.nodeid);
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        });

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

        //根据department获取相应的Location信息
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
                        $("#search_location").empty();
                        $("#search_location").append(locationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取密品类型
        function GetDetailDictionary() {
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
                            dictionary += "<option value=\"" + code + "\">" + value + "</option>"
                        }
                        $("#detail_dictionary").empty();
                        $("#detail_dictionary").append(dictionary);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取所属系统
        function GetDetailApplication() {
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
                        $("#detail_application").empty();
                        $("#detail_application").append(applicationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //获取位置信息
        function GetDetailLocation() {
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
                        $("#detail_location").empty();
                        $("#detail_location").append(locationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

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
                        $("#search_dictionary").empty();
                        $("#search_dictionary").append(dictionary);
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
                        $("#search_application").empty();
                        $("#search_application").append(applicationListHtml);
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
                        $("#search_location").empty();
                        $("#search_location").append(locationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }

        //编辑
        $(document).on("click", ".inventoryUpdate", function () {
            inventoryUpdate(this);
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


        //获取位置信息
        function GetEditLocation(depId) {

            if(depId != null && depId != ""){
                editLoopLocation(depId);
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

        var itemId;
        function inventoryUpdate(op) {
            var option = inventList[op.getAttribute("value")];

            itemId = option.id;
            initEditSelect(option.depId);
            $("#edit_department").val(option.departmentName);
            $("#edit_application").val(option.applicationid);
            $("#edit_application").trigger("chosen:updated");
            $("#edit_location").val(option.locationid);
            $("#edit_location").trigger("chosen:updated");
            $("#edit_dictionary").val(option.dictionaryid);
            $("#edit_dictionary").trigger("chosen:updated");

            $("#edit_department").attr("disabled", true);
            $("#edit_application").attr("disabled", true);
            $("#edit_location").attr("disabled", true);
            $("#edit_dictionary").attr("disabled", true);

            inventoryEditSelectButton(1 ,itemId);//初始化查询
            layer.open({
                type: 1,
                title: '编辑',
                shadeClose: true,
                //shade: 0.8,
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
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/Invent/update.action",
                        traditional: true,
                        data: {
                            "inventory": JSON.stringify(
                                    {
                                        "id":itemId,
                                        "dictionaryid": editDictionary,
                                        "applicationid": editApplication,
                                        "departmentid": editDepartment,
                                        "locationid": editLocation
                                    }
                            )
                        },
                        success: function (result) {
                            var re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                layer.closeAll();
                                inventorySelect();
                                inventoryClean();
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

        //确认下发
        $(document).on("click", ".inventorySend", function(){
            inventorySend(this);
        });
        function inventorySend(op){
            var id = inventList[op.getAttribute("value")].id;

            layer.confirm("<div style='text-align: center;'>确认下发？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/Invent/send.action",
                    traditional: true,
                    data: {
                        "inventoryId": id
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            inventoryClean();
                            inventorySelect();
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

        //查看密品详情
        $(document).on("click", ".inventoryDetail", function () {
            inventoryDetail(this);
        });

        var detailDepartment;
        var detailApplication;
        var detailLocation;
        var detailDictionary;
        var detailTableList;
        var detailResult;
        //查看
        function inventoryDetailSelectButton(pageIndex, Stringid){
            detailDepartment = nodes.nodeid;
            detailApplication = $("#detail_application").val();
            detailLocation = $("#detail_location").val();
            detailDictionary = $("#detail_dictionary").val();
            detailResult= $("#detail_result").val();


            var pageIndex = pageIndex;
            $.ajax({
                type: "post",
                dataType: "html",
                url: "/Invent/select.action",
                traditional: true,
                data: {
                    "invertory": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "Stringid": Stringid
                            }
                            }
                    ),
                    "isDetail": "6"
                },
                success: function (result) {
                    var re = JSON.parse(result);
                    detailTableList = re.list;
                    var detailTableHtml = "";

                    var productMiJian ="";
                    $("#detailTable").empty();
                    for (var i = 0; i < detailTableList.length; i++) {
                        var page;
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

                        var dictionaryValue = "";
                        if(detailTableList[i].dictionaryValue != null){
                            dictionaryValue = detailTableList[i].dictionaryValue;
                        }

                        var locInfoTemp = "";
                        if(detailTableList[i].locInfo != null){
                            locInfoTemp = detailTableList[i].locInfo;
                        }
                        var resultTemp = "";
                        if(detailTableList[i].result != null){
                            resultTemp = detailTableList[i].result;
                        }
                        var mijianList=new Array();//随机密件List
                        //判断该密品下是否有密件
                        if(detailTableList[i].productList != null){
                            for(var j=0;j<detailTableList[i].productList.length;j++)
                            {
                                mijianList.push(detailTableList[i].productList[j]);
                            }
                        }


                        detailTableHtml =
                                "<tr> " +
                                "<td class='center'>"+
                                "<div class='action-buttons'>";
                        if(mijianList.length!=0){
                            detailTableHtml +=
                                    "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>"+
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>"+
                                    "<span class='sr-only'>Details</span>"+
                                    "</a>";
                        }
                        detailTableHtml +=
                                "</div>"+
                                "</td>"+
                                "<td hidden=hidden>" + id + "</td> " +
                                "<td>" + convertNull(detailTableList[i].proCode) + "</td> " +
                                "<td>" + convertNull(detailTableList[i].serNum) + "</td> " +
                                "<td>" + dictionaryValue + "</td> " +
                                "<td>" + convertNull(detailTableList[i].model) + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "<td>" + convertNull(detailTableList[i].applicationName) + "</td> " +
                                "<td>" + departmentName + "</td> " +
                                "<td>" + locInfoTemp + "</td> " +
                                "<td>" + resultTemp + "</td> " +
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
                                var dictionaryValue="";
                                if( item.dictionaryValue!=null){
                                    dictionaryValue=item.dictionaryValue;
                                }
                                var itemResult="";
                                if( item.result!=null){
                                    itemResult=item.result;
                                }
                                detailTableHtml += "<tr style='height: 30px'>"+
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >+id+</td>" +
                                        "<td style='padding-left: 20px'>" +"类别 ：" +dictionaryValue  +"</td>" +
                                        "<td style='padding-left: 40px'>"+" RFID编码 : "+ rfidCode+"</td>" +
                                        "<td style='padding-left: 40px'>"+" 备注 : "+ item.info+"</td>" +
                                        "<td style='padding-left: 40px'>"+" 结果 : "+ itemResult+"</td>" +
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

                        var page = (re.pageIndex - 1) * 10 + i + 1;
                    }
                    var Page={
                        pageIndex:re.pageIndex,
                        totalPages:re.totalPages
                    }
                    //分页
                    //fenyeDetail(Page, Stringid);
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

        function inventoryDetail(op) {
            var option = inventList[op.getAttribute("value")];

            initDetailSelect();
            itemId = option.id;
            $("#detail_department").val(option.departmentName);
            $("#detail_application").val(option.applicationid);
            $("#detail_application").trigger("chosen:updated");
            $("#detail_location").val(option.locationid);
            $("#detail_location").trigger("chosen:updated");
            $("#detail_dictionary").val(option.dictionaryid);
            $("#detail_dictionary").trigger("chosen:updated");
            $("#detail_result").val(option.result);

            $("#detail_department").attr("disabled", true);
            $("#detail_application").attr("disabled", true);
            $("#detail_location").attr("disabled", true);
            $("#detail_dictionary").attr("disabled", true);
            $("#detail_result").attr("disabled", true);

            inventoryDetailSelectButton(1, itemId);//初始化查询

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

        $(document).on("click", ".inventoryDelete", function () {
            var StringArray = [];
            StringArray[0] = inventList[this.getAttribute("value")].id;
            inventDelete(StringArray);
        });

        //编辑删除
        $(document).on("click", ".editDelete", function () {
            var StringArray = [];
            var StringId;
            StringArray[0] = editTableList[this.getAttribute("value")].itemId;
            StringId = editTableList[this.getAttribute("value")].inventId;//inventId
            itemDelete(StringArray, StringId);
        });

        function itemDelete(deleteList, StringId) {
            layer.confirm("<div style='text-align: center;'>确认删除？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/Invent/deleteItem.action",
                    traditional: true,
                    data: {
                        "deleteList": deleteList,
                        "inventId" : StringId
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            inventoryEditSelectButton(1, StringId);
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

        function inventDelete(deleteList) {
            layer.confirm("<div style='text-align: center;'>确认删除？</div>", function () {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/Invent/delete.action",
                    traditional: true,
                    data: {
                        "deleteList": deleteList
                    },
                    success: function (result) {
                        re = JSON.parse(result)
                        if (re.status == ("true")) {
                            layer.msg(re.msg, {time: 1000});
                            inventorySelect();
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

        var userroleaction={
            uid:'',
            menuId:'3'
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
