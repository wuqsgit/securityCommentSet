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
    <title>密品出库</title>

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

    <link rel="stylesheet" href="../../assets/css/datepicker.css"/>

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
                        <i class="ace-icon fa fa-home home-icon"></i>密品出库
                    </li>

                </ul>

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form id="edit_form">
                            <div style="border: 1px solid rgb(221, 221, 221);padding-top: 5px;min-width: 950px">
                                <table style=" height: 80px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;margin-bottom: 5px"
                                       border="0">
                                    <tr>
                                        <td style="padding-left: 22px">密件类别：<select class="chosen-select" id="checkOutSelectProductDictionaryId"
                                                         name="checkOutSelectProductDictionaryId"
                                                         data-placeholder="" style="width: 163px">
                                            <option></option>

                                        </select>
                                            <a style="padding-left: 10px"></a>密品型号：<input id="checkOutSelectProductModel"
                                                        name="checkOutSelectProductModel" type="text" maxlength="64"
                                                        style="width: 200px"
                                                        onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                            <a style="padding-left: 8px"></a>所属系统：<select class="chosen-select" id="checkOutSelectApplicationId"
                                                         name="checkOutSelectApplicationId" data-placeholder=""
                                                         style="width: 163px">
                                            <option></option>
                                        </select>
                                        </td>
                                        <td rowspan="3" style="padding-left: 20px">
                                            <button type="button" id="checkOutSelectButton"
                                                    name="checkOutSelectButton" class="btn btn-info btn-xs"
                                                    style="margin-top: 0px">
                                                <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                            </button>&nbsp;
                                            <button type="button" id="checkOutCleanButton" name="checkOutCleanButton"
                                                    class="btn btn-xs btn-purple" style="width: 54.3px">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                            </button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-left: 22px">出库状态：<select class="chosen-select" id="checkOutSelectStatus"
                                                         style="width: 163px">
                                            <option value=""></option>
                                            <option value="1">已完成</option>
                                            <option value="0">未完成</option>
                                        </select>
                                            <a style="padding-left: 10px"></a>时间范围：<input class="" type="text"
                                                        name="date-range-picker" style="width: 200px"
                                                        readonly="readonly" id="id-date-range-picker-1"/>
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
                                <label style="padding: 6px;font-size: 12px">&nbsp;密品出库列表</label>
                                <span style="float:right;padding-right: 5px">
                                            <button id="checkOutInsertButton" name="checkOutInsertButton"
                                                    class="btn btn-xs btn-success ishow">
                                            <i class="ace-icon fa fa-check"></i>
                                            新增出库</button>
                                            <%--<button id="checkOutDeleteButton" name="checkOutDeleteButton"--%>
                                                    <%--class="btn btn-xs  btn-danger">--%>
                                            <%--<i class="ace-icon fa fa-trash-o align-top bigger-125"></i>--%>
                                            <%--删除</button>--%>
                                            </span>
                            </div>
                            <tr style="height: 30px;">
                                <%--<th class="center" style="width: 50px">--%>
                                <%--<label class="pos-rel">--%>
                                <%--<input type="checkbox" class="ace"/>--%>
                                <%--<span class="lbl"></span>--%>
                                <%--</label>--%>
                                <%--</th>--%>
                                <th width="50px" style="text-align: center">序号</th>
                                <th>单据号</th>
                                <th>接收单位</th>
                                <th>来源单位</th>
                                <th>出库时间</th>
                                <th>备注</th>
                                <th>出库状态</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="checkOutTable"></tbody>
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

<!--密品详情表单 -->
<div class="row" id="detailForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密品出库列表
        </h4>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12" style="height: 68px;">
                <form>
                    <div style="border: 1px solid rgb(221, 221, 221);height:100px;padding-top: 5px">
                        <table style=" height: 90px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                               border="0">
                            <tr>
                                <td>
                                    单据号： <input type="text" maxlength="64" id="detailFormBillCode"
                                                onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                </td>
                                <td>
                                    <a style="padding-left: 10px"></a>
                                    接收单位： <input type="text" id="detailFormDesDepartmentName" placeholder=""
                                                 readonly="readonly">
                                </td>
                                <td>
                                    使用位置： <select class="chosen-select " id="detailFormLocationId"
                                                  style="height: 32px; width: 163px; ">
                                    <option value=""></option>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    交接人： <input type="text" maxlength="64" id="detailFormPersonName"
                                                onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                </td>
                                <td>
                                    <a style="padding-left: 22px"></a>
                                    领用人： <select class="chosen-select " id="detailFormSysUserId"
                                                 style="width: 163px; height: 32px;">
                                    <option value=""></option>
                                </select>
                                </td>
                                <td>
                                    <a style="padding-left: 27px"></a>
                                    备注：<input type="text" id="detailFormInfo"
                                              style="width: 163px; height: 32px;">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
        <div style="height: 35px;">
        </div>
        <div class="row" style="padding-top: 10px">
            <table class="table table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                    <label style="padding: 6px;font-size: 12px">&nbsp;密品出库列表</label>
                    <span style="float:right;padding-right: 5px">
                                     <button type="button" id="detailFormAddProduct"
                                             name="detailFormAddProduct" class="btn btn-info btn-xs"
                                             style="margin-top: 0px">
                                        <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>添加密品
                                    </button>&nbsp;
                                    <button type="button" id="detailFormDeleteProduct"
                                            name="detailFormDeleteProduct" class="btn btn-xs btn-danger"
                                            style="margin-top: 0px">
                                        <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>删除
                                    </button>&nbsp;
                                </span>
                </div>
                <tr style="height: 30px;">
                    <th class="detailFormSwitchCheckBox center" style="width: 50px">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace"/>
                            <span class="lbl"></span>
                        </label>
                    </th>
                    <th class="detailFormSwitchDetail" id="detailFormSwitchDetail1" style="text-align: center;width: 50px">密件</th>
                    <th width="50px" style="text-align: center">序号</th>
                    <th class="detailFormSwitchDetailType">分类</th>
                    <th>密件类别</th>
                    <th>密品型号</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>RFID编号</th>
                    <th class="detailFormSwitchInsert">所属系统</th>
                    <th class="detailFormSwitchInsert">备注</th>
                    <th class="detailFormSwitchDetail">出库时间</th>
                    <th class="detailFormSwitchConfirm" style="text-align: center;width: 200px">操作</th>
                </tr>
                </thead>
                <tbody id="checkOutDetailTable"></tbody>
            </table>
            <div class="padlr" align="right" style="cursor: pointer">
                <ul id="data-pagination-detail" class="pagination">
                </ul>
            </div>
        </div><!-- /.span -->
    </div><!-- /.row -->
</div>

<!--密品详情表单 -->
<div class="row" id="itemDetailForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            出库明细
        </h4>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12" style="height: 68px;">
                <form>
                    <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
                        <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                               border="0">
                            <tr>
                                <td>
                                    单据号：<input id="itemDetailFormBillCode"
                                               name="itemDetailFormBillCode" type="text"
                                               maxlength="64">
                                    <a style="padding-left: 10px"></a>
                                    来源单位：<input id="itemdetailFormDesDepartmentName"
                                                name="itemdetailFormDesDepartmentName" type="text" maxlength="64">
                                    <a style="padding-left: 10px"></a>
                                    创建时间：<input id="itemDetailFormCreateTime"
                                                name="itemDetailFormCreateTime" type="text" maxlength="64">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    接收人：<input id="itemDetailFormDesDepartmentSysUser"
                                               name="itemDetailFormDesDepartmentSysUser" type="text" maxlength="64">
                                    <a style="padding-left: 10px"></a>
                                    备注：<input id="itemDetailFormInfo"
                                              name="itemDetailFormInfo" type="text" maxlength="64">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
        <div style="height: 35px;">
        </div>
        <div class="row" style="padding-top: 35px">
            <div class="col-xs-12">
                <table class="table table-bordered table-hover" style="min-width: 800px;">
                    <thead>
                    <tr style="height: 30px;">
                        <th width="50px" style="text-align: center">序号</th>
                        <th>密件类别</th>
                        <th>密品型号</th>
                        <th>列装号</th>
                        <th>出厂编号</th>
                        <th>RFID编号</th>
                        <th>出库时间</th>
                    </tr>
                    </thead>
                    <tbody id="checkOutItemDetailTable"></tbody>
                </table>
                <div class="padlr" align="right" style="cursor: pointer">
                    <ul id="data-pagination-item-detail" class="pagination">
                    </ul>
                </div>
            </div><!-- /.span -->
        </div><!-- /.row -->
    </div>
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

<!--添加密品 -->
<div class="row" id="addForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            添加密品
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <form>
                <div style="border: 1px solid rgb(221, 221, 221);height:100px;padding-top: 5px">
                    <table style=" height: 90px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                           border="0">
                        <tr>
                            <td>
                                密件类别：
                                <select class="chosen-select "
                                        id="addFormSelectDictionaryId"
                                        style=" width: 163px;height: 32px;">
                                    <option value=""></option>
                                </select>
                            </td>
                            <td>
                                <a style="padding-left: 20px"></a>
                                密品型号： <input type="text" maxlength="64" id="addFormSelectModel"
                                             onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                            </td>
                            <td>
                                <a style="padding-left: 20px"></a>
                                列装号： <input type="text" maxlength="64" id="addFormSelectProcode"
                                            onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')"
                                            style="margin-left: 15px;">
                            </td>
                            <td rowspan="2" style="padding-left: 20px">
                                <button type="button" id="addFormSelectButton"
                                        name="addFormSelectButton" class="btn btn-info btn-xs"
                                        style="margin-top: 0px">
                                    <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                </button>&nbsp;
                                <button type="button" id="addFormCleanButton"
                                        name="addFormCleanButton" class="btn btn-xs btn-danger"
                                        style="margin-top: 0px">
                                    <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>重置
                                </button>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                出厂编号： <input type="text" maxlength="64" id="addFormSelectSerNum"
                                             onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                            </td>
                            <td>
                                <a style="padding-left: 20px"></a>
                                所属系统：
                                <select class="chosen-select "
                                        id="addFormSelectApplicationId"
                                        style=" width: 163px;height: 32px;">
                                    <option value=""></option>
                                </select>
                            </td>
                            <td>
                                <a style="padding-left: 20px"></a>
                                RFID编号： <input type="text" maxlength="64" id="addFormSelectRfidCode"
                                               onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </row>
    <row>
        <div class="col-xs-12">
            <table id="mijian-table" class="table  table-bordered table-hover" style="min-width: 800px;">
                <thead>

                <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                    <label style="padding: 6px;font-size: 12px">&nbsp;密件</label>
                </div>
                <tr style="height: 30px;">
                    <th class="addFormSwitchCheckBox center" style="width: 50px">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace"/>
                            <span class="lbl"></span>
                        </label>
                    </th>
                    <th class="addFormSelectRandom" style="text-align: center;width: 50px">密件</th>
                    <th width="50px" style="text-align: center">序号</th>
                    <th>密件类别</th>
                    <th>密品型号</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>所属系统</th>
                    <th>RFID编号</th>
                </tr>
                </thead>
                <tbody id="addFormSelectTable" class="table  table-bordered table-hover"></tbody>
            </table>
        </div>
    </row>


</div>

<%--密件表单--%>
<div class="row" id="addFormRandom" style="display: none;margin: 20px;font-family: '微软雅黑';font-size: 12px">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密件信息
        </h4>
    </div>
    <form class="form-horizontal" style="margin-top: 20px">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormRandomDictionaryId">密件类别： </label>

            <div class="col-sm-9">
                <select class="chosen-select" id="addFormRandomDictionaryId" name="addFormRandomDictionaryId"
                        data-placeholder="" class="col-xs-9" style="width: 75%">
                    <option></option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormRandomLocationId"> 所属位置：</label>
            <div class="col-sm-9">
                <select class="chosen-select" id="addFormRandomLocationId" name="addFormRandomLocationId"
                        data-placeholder="" class="col-xs-9" style="width: 75%">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="addFormRandomInfo"> 备注： </label>

            <div class="col-sm-9">
                <textarea class="form-control" id="addFormRandomInfo" style="width: 75%;height: 100px"></textarea>
            </div>
        </div>

    </form>

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

            //获取当前日期
            function getNowFormatDate(date) {
                var seperator = "-";
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = date.getFullYear() + seperator + month + seperator + strDate;
                return currentdate;
            }

            //日期控件初始化
            $('input[name=date-range-picker]').daterangepicker().prev().on(ace.click_event, function () {
                $(this).next().focus();
            });
            $('.date-picker').datepicker({autoclose: true}).next().on(ace.click_event, function () {
                $(this).prev().focus();
            });
            //查询条件select框初始化
            var dictionaries;
            var applications;
            var sysusers;
            var locations;
            checkOutInitSelectOption();
            function checkOutInitSelectOption() {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/checkOutInitSelectOption.action",
                    data: {},
                    success: function (result) {
                        var re = JSON.parse(result);

                        dictionaries = re.dictionaries;
                        var dictionariesHtml = "";
                        for (var j = 0; j < dictionaries.length; j++) {
                            dictionariesHtml += "<option value=\"" + dictionaries[j].id + "\">" + dictionaries[j].value + "</option>"
                        }
                        $("#checkOutSelectProductDictionaryId").append(dictionariesHtml);
                        $("#addFormRandomDictionaryId").append(dictionariesHtml);
                        $("#addFormDictionaryId").append(dictionariesHtml);
                        $("#addFormSelectDictionaryId").append(dictionariesHtml);

                        applications = re.applications;
                        var applicationsHtml = "";
                        for (var j = 0; j < applications.length; j++) {
                            applicationsHtml += "<option value=\"" + applications[j].id + "\">" + applications[j].name + "</option>"
                        }
                        $("#checkOutSelectApplicationId").append(applicationsHtml);
                        $("#addFormApplicationId").append(applicationsHtml);
                        $("#addFormSelectApplicationId").append(applicationsHtml);

                        sysusers = re.sysusers;
                        var sysusersHtml = "";
                        for (var j = 0; j < sysusers.length; j++) {
                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                        }
                        $("#addFormSysUserId").append(sysusersHtml);
                        $("#detailFormSysUserId").append(sysusersHtml);

                        locations = re.locations;
                        var locationsHtml = "";
                        for (var j = 0; j < locations.length; j++) {
                            locationsHtml += "<option value=\"" + locations[j].id + "\">" + locations[j].locinfo + "</option>"
                        }
                        $("#addFormRandomLocationId").append(locationsHtml);
                        $("#addFormLocationId").append(locationsHtml);
                        $("#detailFormLocationId").append(locationsHtml);
                    },
                    error: function (result) {
                        layer.msg('组织机构新增选项获取错误！', {time: 1000});
                    }
                });
            }

            var deptLocations;

            function changeSelectLocationId(nodeid) {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/checkOutInitSelectOption.action",
                    traditional: true,
                    data: {
                        "deptNodeid": nodeid
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        deptLocations = re.deptLocations;
                        var locationsHtml = "<option value=\"\"></option>";
                        for (var j = 0; j < deptLocations.length; j++) {
                            locationsHtml += "<option value=\"" + deptLocations[j].id + "\">" + deptLocations[j].locinfo + "</option>"
                        }
                        $("#detailFormLocationId").children().remove();
                        $("#detailFormLocationId").append(locationsHtml);

                        deptSysusers = re.deptSysusers;
                        var SysusersHtml = "<option value=\"\"></option>";
                        for (var j = 0; j < deptSysusers.length; j++) {
                            SysusersHtml += "<option value=\"" + deptSysusers[j].id + "\">" + deptSysusers[j].name + "</option>"
                        }
                        $("#detailFormSysUserId").children().remove();
                        $("#detailFormSysUserId").append(SysusersHtml);

                    }
                });
            }

            //表格数据初始化
            checkOutSelect();
            //查询出库单按钮
            $('#checkOutSelectButton').on('click', function () {
                checkOutSelect(this);
            });
            var checkOutList;
            var startTime;
            var endTime;

            function checkOutSelect() {
                var productDictionaryId = $('#checkOutSelectProductDictionaryId').val();
                var productModel = $('#checkOutSelectProductModel').val();
                var applicationId = $('#checkOutSelectApplicationId').val();
                var data = $("#id-date-range-picker-1").val();
                startTime = data.substring(0, 10);
                endTime = data.substring(13, 23);
                var result = $('#checkOutSelectStatus').val();
                var pageIndex = 1;
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/select.action",
                    traditional: true,
                    data: {
                        "checkoutbill": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "productDictionaryId": productDictionaryId,
                                "productModel": productModel,
                                "applicationId": applicationId,
                                "startTime": startTime,
                                "endTime": endTime,
                                "result": result
                            }
                            }
                        ),
                        "isDetail": "1"
                    },
                    success: function (result1) {
                        var re = JSON.parse(result1);
                        checkOutList = re.list;

                        var checkOutHtml = "";

                        for (var a = 0; a < checkOutList.length; a++) {
                            var page = (re.pageIndex - 1) * 10 + a + 1
                            checkOutHtml +=
                                "<tr> " +
//                                "<td class='center'>" +
//                                " <label class='pos-rel'> " +
//                                "<input type='checkbox' class='ace'/> " +
//                                "<span class='lbl'></span> " +
//                                "</label> " +
//                                "</td> " +
                                "<td>" + page + "</td> " +
                                "<td>" + checkOutList[a].billCode + "</td> " +
                                "<td>" + checkOutList[a].desDepartmentName + "</td> " +
                                "<td>" + checkOutList[a].resDepartmentName + "</td> " +
                                "<td>" + checkOutList[a].updateTime + "</td> " +
                                "<td>" + checkOutList[a].info + "</td> "
                            if (checkOutList[a].result == ("0")) {
                                checkOutHtml += "<td>未完成</td> "
                            } else if (checkOutList[a].result == ("1")) {
                                checkOutHtml += "<td>已完成</td> "
                            }
                            checkOutHtml +=
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>" +
                                "<a style='cursor:pointer;text-decoration:none' class='checkOutDetail' value='" + a + "'> 查看 </a> ";
                            if (checkOutList[a].result == ("0")) {
                                checkOutHtml += "|<a style='cursor:pointer;text-decoration:none' class='checkOutConfirmButton ishow' value='" + checkOutList[a].id + "'> 确认 </a> ";
                            }
                            checkOutHtml += "</span>" +
                                "</td> " +
                                "</tr>";
                        }
                        $("#checkOutTable").empty();
                        $("#checkOutTable").append(checkOutHtml);
                        QuanXian();

                        $(document).on("click", ".checkOutConfirmButton", function () {
                            id = $(this).attr("value");
                            layer.confirm(
                                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认出库？</div>",
                                function (index) {
                                    layer.load(2, {time: 1000});
                                    $.ajax({
                                        type: "post",
                                        dataType: "html",
                                        url: "/checkOut/update.action",
                                        traditional: true,
                                        data: {
                                            "checkout": JSON.stringify({
                                                "checkoutbill": {
                                                    "id": id,
                                                    "result": "1"
                                                }
                                            })
                                        },
                                        success: function (result) {
                                            re = JSON.parse(result);
                                            if (re.status == ("true")) {
                                                layer.msg(re.msg, {time: 1000});
                                                checkOutSelect();
                                                layer.close(index);
                                                time
                                            } else if (re.status == ("false")) {
                                                layer.msg(re.msg, {time: 1000});
                                            }
                                        },
                                        error: function (result) {
                                            layer.msg('状态更新异常！', {time: 1000});
                                        }
                                    });
                                })
                        });
                        if (checkOutList.length == 0) {
                            $('#data-pagination').children().remove();
                            return;
                        }
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
                                    url: "/checkOut/select.action",
                                    data: {
                                        "checkoutbill": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "productDictionaryId": productDictionaryId,
                                                "productModel": productModel,
                                                "applicationId": applicationId,
                                                "startTime": startTime,
                                                "endTime": endTime,
                                                "result": result
                                            }
                                            }
                                        ),
                                        "isDetail": "1"
                                    },
                                    success: function (result1) {
                                        var re = JSON.parse(result1);
                                        checkOutList = re.list;

                                        var checkOutHtml = "";

                                        for (var a = 0; a < checkOutList.length; a++) {
                                            var page = (re.pageIndex - 1) * 10 + a + 1
                                            checkOutHtml +=
                                                "<tr> " +
//                                "<td class='center'>" +
//                                " <label class='pos-rel'> " +
//                                "<input type='checkbox' class='ace'/> " +
//                                "<span class='lbl'></span> " +
//                                "</label> " +
//                                "</td> " +
                                                "<td>" + page + "</td> " +
                                                "<td>" + checkOutList[a].billCode + "</td> " +
                                                "<td>" + checkOutList[a].desDepartmentName + "</td> " +
                                                "<td>" + checkOutList[a].resDepartmentName + "</td> " +
                                                "<td>" + checkOutList[a].updateTime + "</td> " +
                                                "<td>" + checkOutList[a].info + "</td> "
                                            if (checkOutList[a].result == ("0")) {
                                                checkOutHtml += "<td>未完成</td> "
                                            } else if (checkOutList[a].result == ("1")) {
                                                checkOutHtml += "<td>已完成</td> "
                                            }
                                            checkOutHtml +=
                                                "<td style='text-align: center;color: #2283C5;'> " +
                                                "<span>" +
                                                "<a style='cursor:pointer;text-decoration:none' class='checkOutDetail' value='" + a + "'> 查看 </a> ";
                                            if (checkOutList[a].result == ("0")) {
                                                checkOutHtml += "<a style='cursor:pointer;text-decoration:none' class='checkOutConfirmButton ishow' value='" + checkOutList[a].id + "'>| 确认 </a> ";
                                            }
                                            checkOutHtml += "</span>" +
                                                "</td> " +
                                                "</tr>";
                                        }
                                        $("#checkOutTable").empty();
                                        $("#checkOutTable").append(checkOutHtml);
                                        QuanXian();
                                    }
                                });
                            }
                        };
                        $('#data-pagination').children().remove();
                        $('#data-pagination').bootstrapPaginator(options);
                    },
                    error: function (result) {
                    }
                });
            }

            //重置
            $('#checkOutCleanButton').on('click', function () {
                checkOutClean();
            });
            function checkOutClean() {
                $('#checkOutSelectProductDictionaryId').val("");
                $('#checkOutSelectProductModel').val("");
                $('#checkOutSelectApplicationId').val("");
                $('#checkOutSelectStatus').val("");
                $("#id-date-range-picker-1").val("");
            }

            //组织机构树形弹窗按钮
            $('#detailFormDesDepartmentName').on('click', function () {
                layer.open({
                    type: 1,
                    title: '选择组织机构',
                    shadeClose: false,
                    offset: '0px',
                    area: ['40%', '60%'],
                    content: $('#addFormForDepartmentSelect'),
                    btn: ['保存', '关闭'],
                    btnAlign: 'c', //按钮居中
                    success: function (layero, index) {
                        $('#treeview').find("li:not([data-template])").remove();
                        $('#treeview').tree("render");
                    },
                    yes: function (index) {
                        layer.close(index);
                        $("#detailFormDesDepartmentName").val(nodes.nodetext)
                        changeSelectLocationId(nodes.nodeid);
                    },
                    btn2: function (index) {
                        nodes = {
                            nodeid: null,
                            nodetext: null
                        }
                        $("#detailFormDesDepartmentName").val("")
                        layer.close(index);
                    },
                    cancel: function (index) {
                        nodes = {
                            nodeid: null,
                            nodetext: null
                        }
                        $("#detailFormDesDepartmentName").val("")
                        layer.close(index);
                    }

                });
            });
            //组织机构树形弹窗内容
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

            //新增出库
            $('#checkOutInsertButton').on('click', function () {
                checkOutInsert(this);
            });
            function checkOutInsert() {
                $("#detailFormBillCode").val("");
                $("#detailFormDesDepartmentName").val("");
                $("#detailFormDesDepartmentSysUser").children().remove();

                var sysusersHtml = "<option value=\"\"></option>";
                for (var j = 0; j < sysusers.length; j++) {
                    sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                }

                $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                $("#detailFormInfo").val("");
                $("#detailFormLocationId").val("");

                $("#detailFormPersonName").val("");
                $("#detailFormSysUserId").val("");
                $("#detailFormBillCode").attr("disabled", false);
                $("#detailFormDesDepartmentName").attr("disabled", false);
                $("#detailFormDesDepartmentSysUser").attr("disabled", false);
                $("#detailFormInfo").attr("disabled", false);
                $("#detailFormLocationId").attr("disabled", false);
                $("#detailFormPersonName").attr("disabled", false);
                $("#detailFormSysUserId").attr("disabled", false);
                var today = new Date();
                $("#detailFormCreateTime").val(getNowFormatDate(today));
                $("#detailFormCreateTime").attr("disabled", true);
                $("#detailFormAddProduct").show();
                $("#detailFormDeleteProduct").show();
                $("#detailFormSwitchInsert").show();
                $("#detailFormSwitchDetail").hide();
                $("#data-pagination-detail").hide();
                checkOutInsertRefresh();

                $(".detailFormSwitchDetailType").show();
                layer.open({
                    type: 1,
                    title: '新增出库',
                    shadeClose: false,
                    offset: '0px',
                    area: ['100%', '100%'],
                    content: $('#detailForm'),
                    btn: ['保存', '关闭'],
                    btnAlign: 'c', //按钮居中
                    yes: function () {
                        layer.confirm(
                            "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认出库？</div>",
                            function (index) {
                                var detailFormBillCode = $("#detailFormBillCode").val();
                                var detailFormDesDepartmentId = nodes.nodeid;
                                var detailFormLocationId = $("#detailFormLocationId").val();
                                var detailFormPersonName = $("#detailFormPersonName").val();
                                var detailFormSysUserId = $("#detailFormSysUserId").val();
                                var detailFormInfo = $("#detailFormInfo").val();
                                if (detailFormDesDepartmentId == null || detailFormDesDepartmentId == "") {
                                    layer.msg('接收单位为空', {time: 1000});
                                    return;
                                }
                                if (deptLocations.length != 0 && (detailFormLocationId == null || detailFormLocationId == "")) {
                                    layer.msg('使用位置为空', {time: 1000});
                                    return;
                                }
                                if (detailFormSysUserId == null || detailFormSysUserId == "") {
                                    layer.msg('领用人为空', {time: 1000});
                                    return;
                                }
                                if (addFormEntity == null || addFormEntity.length == 0) {
                                    layer.msg('入库单为空', {time: 1000});
                                    return;
                                }
                                layer.load(2, {time: 1000});
                                $.ajax({
                                    type: "post",
                                    dataType: "html",
                                    url: "/checkOut/insert.action",
                                    traditional: true,
                                    data: {
                                        "checkout": JSON.stringify({
                                            "checkoutbillitemList": addFormEntity, "checkoutbill": {
                                                "billCode": detailFormBillCode,
                                                "desDepartmentId": detailFormDesDepartmentId,
                                                "locationId": detailFormLocationId,
                                                "personName": detailFormPersonName,
                                                "sysuserId": detailFormSysUserId,
                                                "info": detailFormInfo
                                            }
                                        })
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result)
                                        if (re.status == ("true")) {
                                            layer.msg(re.msg, {time: 1000});
                                            checkOutClean();
                                            checkOutSelect();
                                            addFormEntity = [];
                                            checkOutDetailList = [];
                                            $("#checkOutDetailTable").empty();
                                            layer.closeAll();
                                        } else if (re.status == ("false")) {
                                            layer.msg(re.msg, {time: 1000});
                                        }
                                    },
                                    error: function () {
                                        layer.msg('新增出库异常', {time: 1000});
                                    }
                                });
                            });
                    },
                    btn2: function () {
                        layer.closeAll();
                    },
                    success: function () {
                        $('#data-pagination-detail').children().remove();
                        $(".detailFormSwitchInsert").show();
                        $(".detailFormSwitchCheckBox").show();
                        $(".detailFormSwitchDetail").hide();
                    }
                });
            }

            //动态创建json对象
            function createJson(jsonObj, prop, val) {
                // 如果 val 被忽略
                if (typeof val === "undefined") {
                    // 删除属性
                    delete jsonObj[prop];
                }
                else {
                    // 添加 或 修改
                    jsonObj[prop] = val;
                }
            }

            //查询密品
            $('#addFormSelectButton').on('click', function () {
                addFormSelect();
            });
            var addFormSelectList = [];

            function addFormSelect() {
                $("#addFormSelectTable").empty();

                var addFormSelect = $("#addFormSelect").val();
                $("#addFormAddProduct").hide();
                $("#addFormDeleteProduct").hide();
                $("#data-pagination-detail").show();

                var addFormSelectDictionaryId = $("#addFormSelectDictionaryId").val();
                var addFormSelectModel = $("#addFormSelectModel").val();
                var addFormSelectProcode = $("#addFormSelectProcode").val();
                var addFormSelectSerNum = $("#addFormSelectSerNum").val();
                var addFormSelectApplicationId = $("#addFormSelectApplicationId").val();
                var addFormSelectRfidCode = $("#addFormSelectRfidCode").val();

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/addFormSelect.action",
                    traditional: true,
                    data: {
                        "page": JSON.stringify(
                            {
                                "pageIndex": 1, "paramEntity": {
                                "dictionaryId": addFormSelectDictionaryId,
                                "model": addFormSelectModel,
                                "proCode": addFormSelectProcode,
                                "serNum": addFormSelectSerNum,
                                "applicationId": addFormSelectApplicationId,
                                "rfidCode": addFormSelectRfidCode
                            }
                            }
                        )
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        addFormSelectList = [];
                        var checkOutDetailList = re.p.list;//这个是所有的父节点
                        var productList = re.productsRandom;//子节点
                        for (var i = 0; i < checkOutDetailList.length; i++) {
                            var count = addFormSelectList.length;
                            addFormSelectList[count] = checkOutDetailList[i];
                            createJson(addFormSelectList[count], "type", "密品");
                        }
                        for (var i = 0; i < productList.length; i++) {
                            var count = addFormSelectList.length;
                            addFormSelectList[count] = productList[i];
                            createJson(addFormSelectList[count], "type", "密件");
                        }
                        var checkOutHtml = "";
                        if (checkOutDetailList.length == 0) {
                            layer.msg('查询结果为空', {time: 1000});
                            $("#addFormSelectTable").empty();
                            return;
                        }
                        for (var a = 0; a < checkOutDetailList.length; a++) {
                            var page = (re.p.pageIndex - 1) * 10 + a + 1;

                            var dictionaryValue = checkOutDetailList[a].dictionaryValue == null ? '' : checkOutDetailList[a].dictionaryvalue;
                            var model = checkOutDetailList[a].model == null ? '' : checkOutDetailList[a].model;
                            var proCode = checkOutDetailList[a].proCode == null ? '' : checkOutDetailList[a].proCode;
                            var serNum = checkOutDetailList[a].serNum == null ? '' : checkOutDetailList[a].serNum;
                            var rfidCode = checkOutDetailList[a].rfidCode == null ? '' : checkOutDetailList[a].rfidCode;
                            var applicationName = checkOutDetailList[a].applicationName == null ? '' : checkOutDetailList[a].applicationName;

                            checkOutHtml +=""
                            if (checkOutDetailList[a].isTrue == 0) {
                                checkOutHtml +=
                                    "<tr type='0'> "+
                                    "<td class='center'>" +
                                    "</td> ";
                            } else {
                                var isIn = true;
                                for (var i = 0; i < addFormEntity.length; i++) {
                                    if (checkOutDetailList[a].id == addFormEntity[i].id) {
                                        isIn = false;
                                        break;
                                    }
                                }
                                if (isIn == true) {
                                    checkOutHtml +=
                                        "<tr type='0'> "+
                                        "<td class='center'>" +
                                        "<label class='pos-rel'> " +
                                        "<input type='checkbox' class='ace'/> " +
                                        "<span class='lbl'></span> " +
                                        "</label> " +
                                        "</td> ";
                                } else {
                                    checkOutHtml +=
                                        "<tr type='0' style='background-color:lightgray'>" +
                                        "<td class='center'>" +
                                        "</td> ";
                                }
                            }
                            var mijianList = new Array();//密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < productList.length; j++) {
                                if (productList[j].productId != null && productList[j].productId == checkOutDetailList[a].id) {
                                    mijianList.push(productList[j]);
                                }
                            }
                            if (mijianList.length != 0) {
                                checkOutHtml +=
                                    "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 checkOutItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>详情</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            } else {
                                checkOutHtml +=
                                    "<td class='center'>" +
                                    "</td>";
                            }
                            checkOutHtml +=
                                "<td hidden=hidden>" + checkOutDetailList[a].id + "</td> " +
                                "<td>" + page + "</td> " +
                                "<td>" + dictionaryValue + "</td> " +
                                "<td>" + model + "</td> " +
                                "<td>" + proCode + "</td> " +
                                "<td>" + serNum + "</td> " +
                                "<td>" + applicationName + "</td> " +
                                "<td>" + rfidCode + "</td> " +
                                "</tr>";
                            if (mijianList.length != 0) {
                                var allSelect = 0;
                                for (var mijianListCount = 0; mijianListCount < mijianList.length; mijianListCount++) {
                                    for (var i = 0; i < addFormEntity.length; i++) {
                                        if (mijianList[mijianListCount].id == addFormEntity[i].id) {
                                            allSelect += 1;
                                            break;
                                        }
                                    }
                                }
                                if (allSelect < mijianList.length) {
                                    checkOutHtml += "<tr class='detail-row' type='1'>" +
                                        "<td colspan='12'>" +
                                        "<div class='table-detail'>" +
                                        "<div class='row'>" +
                                        "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                        "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                    $.each(mijianList, function (index, item) {
                                        var id = item.id;
                                        var isIn1 = true;
                                        for (var i = 0; i < addFormEntity.length; i++) {
                                            if (id == addFormEntity[i].id) {
                                                isIn1 = false;
                                                break;
                                            }
                                        }
                                        if (isIn1 == true) {
                                            var rfidCode = "";
                                            if (item.rfidCode != null) {
                                                rfidCode = item.rfidCode;
                                            }
                                            var dictionaryValue = item.dictionaryValue == null ? "" : item.dictionaryValue;
                                            var rfidCode = rfidCode == null ? "" : rfidCode;
                                            var info = item.info == null ? "" : item.info;
                                            checkOutHtml +=
                                                "<tr style='height: 30px' type='2'>";
                                            if (item.storage == "0") {
                                                checkOutHtml +=
                                                    "<td class='center'>" +
                                                    "</td> ";
                                            } else {
                                                checkOutHtml +=
                                                    "<td class='center' >" +
                                                    "<label class='pos-rel'>" +
                                                    "<input type='checkbox' class='ace'> " +
                                                    "<span class='lbl'>" +
                                                    "</span>" +
                                                    "</label>" +
                                                    "</td>";
                                            }

                                            checkOutHtml +=
                                                "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                                "<td hidden=hidden >" + id + "</td>" +
                                                "<td style='padding-left: 20px'>" + " 类别 ：" + dictionaryValue + "</td>" +
                                                "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                                "<td style='padding-left: 40px'>" + " 备注 : " + info + "</td>" +
                                                "</tr>";
                                        }
                                    });
                                    checkOutHtml +=
                                        "</table>" +
                                        "</div>" +
                                        "</div>" +
                                        "</td>" +
                                        "</tr>";
                                }
                            }
                        }
                        $("#addFormSelectTable").empty();
                        $("#addFormSelectTable").append(checkOutHtml);

                        //出库确认
                        $(document).off("click", ".checkOutConfirmButton");
                        $(document).on("click", ".checkOutConfirmButton", function () {
                            id = $(this).attr("value");
                            layer.confirm(
                                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认出库？</div>",
                                function (index) {
                                    layer.load(2, {time: 1000});
                                    $.ajax({
                                        type: "post",
                                        dataType: "html",
                                        url: "/checkOut/update.action",
                                        traditional: true,
                                        data: {
                                            "checkout": JSON.stringify({
                                                "checkoutbillitemList": [{
                                                    "id": id,
                                                    "result": "1"
                                                }]
                                            })
                                        },
                                        success: function (result) {
                                            re = JSON.parse(result);
                                            if (re.status == ("true")) {
                                                layer.msg(re.msg, {time: 1000});
                                                layer.close(index);
                                                checkOutConfirm(re.data.checkoutbillitemList[0].checkoutbillId, 'notOpen');
                                            } else if (re.status == ("false")) {
                                                layer.msg(re.msg, {time: 1000});
                                            }
                                        },
                                        error: function (result) {
                                            layer.msg('状态更新异常！', {time: 1000});
                                        }
                                    });
                                })
                        });
                        //查看密品详情的密件
                        $(document).off("click", ".checkOutItemDetailInDatabase");
                        $(document).on("click", ".checkOutItemDetailInDatabase", function (e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                    },
                    error: function (result) {
                    }
                });
            }

            //刷新新增出库列表
            function checkOutInsertRefresh() {
                var checkOutHtml = "";
                for (var a = 0; a < addFormEntity.length; a++) {
                    var index = a + 1;

                    var dictionaryValue = addFormEntity[a].dictionaryValue == null ? "" : addFormEntity[a].dictionaryValue;
                    var model = addFormEntity[a].model == null ? "" : addFormEntity[a].model;
                    var proCode = addFormEntity[a].proCode == null ? "" : addFormEntity[a].proCode;
                    var serNum = addFormEntity[a].serNum == null ? "" : addFormEntity[a].serNum;
                    var rfidCode = addFormEntity[a].rfidCode == null ? "" : addFormEntity[a].rfidCode;
                    var applicationName = addFormEntity[a].applicationName == null ? "" : addFormEntity[a].applicationName;
                    var info = addFormEntity[a].info == null ? "" : addFormEntity[a].info;
                    var type = addFormEntity[a].type;

                    checkOutHtml +=
                        "<tr> " +
                        "<td class=' detailFormSwitchCheckBox center'>" +
                        " <label class='pos-rel'> " +
                        "<input type='checkbox' class='ace'/> " +
                        "<span class='lbl'></span> " +
                        "</label> " +
                        "</td> " +
                        "<td>" + index + "</td> " +
                        "<td>" + type + "</td> " +
                        "<td>" + dictionaryValue + "</td> " +
                        "<td>" + model + "</td> " +
                        "<td>" + proCode + "</td> " +
                        "<td>" + serNum + "</td> " +
                        "<td>" + rfidCode + "</td> " +
                        "<td>" + applicationName + "</td> " +
                        "<td>" + info + "</td> " +
                        "<td style='text-align: center;color: #2283C5;'> " +
                        "<span>" +
                        "<a style='cursor:pointer;text-decoration:none' class='checkOutInsertDeleteButton' value='" + index + "'> 删除 </a>" +
                        "</span>" +
                        "</td> " +
                        "</tr>"
                }
                $("#checkOutDetailTable").empty();
                $("#checkOutDetailTable").append(checkOutHtml);
                $(".detailFormSwitchConfirm").show();
                $('.checkOutInsertDeleteButton').on('click', function () {
                    var first = this.getAttribute("value");
                    layer.confirm(
                        "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",
                        function (index) {
                            addFormEntity.splice(first - 1, 1);
                            checkOutInsertRefresh();
                            layer.close(index);
                        });
                });
            }


            //重置查询密品
            $('#addFormCleanButton').on('click', function () {
                addFormCleanButton();
            });
            function addFormCleanButton() {
                $('#addFormSelectDictionaryId').val("");
                $('#addFormSelectModel').val("");
                $('#addFormSelectProcode').val("");
                $('#addFormSelectSerNum').val("");
                $('#addFormSelectApplicationId').val("");
                $('#addFormSelectRfidCode').val("");
            }

            //添加密品
            var addFormEntity = [];
            $('#detailFormAddProduct').on('click', function () {
                detailFormAddProduct(this);
            });
            function detailFormAddProduct() {
                $("#addFormDictionaryId").val("");
                $("#addFormModel").val("");
                $("#addFormSerNum").val("");
                $("#addFormApplicationId").val("");
                $("#addFormLocationId").val("");
                $("#addFormSysUserId").val("");
                $("#addFormProCode").val("");
                $("#addFormProCodeCount").val("");
                $("#addFormInfo").val("");
                $("#addFormDictionaryId").attr("disabled", false);
                $("#addFormModel").attr("disabled", false);
                $("#addFormSerNum").attr("disabled", false);
                $("#addFormApplicationId").attr("disabled", false);
                $("#addFormLocationId").attr("disabled", false);
                $("#addFormSysUserId").attr("disabled", false);
                $("#addFormProCode").attr("disabled", false);
                $("#addFormProCodeCount").attr("disabled", false);
                $("#addFormInfo").attr("disabled", false);

                $("#addFormRandomTable").empty();
                $("#addFormRandomButton").show();
                $("#addFormProductButton").show();
                layer.open({
                    type: 1,
                    title: '新增出库',
                    shadeClose: false,
                    offset: '0px',
                    area: ['100%', '100%'],
                    content: $('#addForm'),
                    btn: ['添加已勾选的密品至出库单', '添加完成，返回出库单'],
                    btnAlign: 'c', //按钮居中
                    yes: function (index) {
                        layer.confirm(
                            "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认加入？</div>",

                            function (index) {
                                var trs = $("#addFormSelectTable").find("tr");
                                var rfidList = [];

                                var rows = [];//被选中的数据Id
                                var count = 0;
                                trs.each(function (index, item) {
                                    var check = $("#addFormSelectTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');//判断是否选中
                                    if (check[0] != undefined) {
                                        if (check[0].checked == true) {
                                            rows[count++] = $("#addFormSelectTable").find("tr").eq(index).find("td").eq(2).text();
                                        }
                                    }
                                    var type = $("#addFormSelectTable").find("tr").eq(index).attr("type");//获取自定义类型判断是密品还是密件0-密品 1-密件
                                    if (type == 0) {
                                        var check = $("#addFormSelectTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');//判断是否选中
                                        if (check[0] != undefined && check[0].checked == true) {
                                            var id = $("#addFormSelectTable").find("tr").eq(index).find("td").eq(2).text();
                                            var proCode = $("#addFormSelectTable").find("tr").eq(index).find("td").eq(5).text();
                                            var rfid = {
                                                proCode: proCode,
                                                state: "0"
                                            }
                                            rfidList.push(rfid);
                                        }
                                    }
                                    else if (type == 2) {
                                        var check = $("#addFormSelectTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');
                                        if (check[0] != undefined && check[0].checked == true) {
                                            var proCode = $("#addFormSelectTable").find("tr").eq(index).find("td").eq(3).text();
                                            var rfid = {
                                                proCode: proCode,
                                                state: "2"
                                            }
                                            rfidList.push(rfid);
                                        }
                                    }
                                });
                                if (rows.length == 0) {
                                    layer.msg('未选择密品', {time: 2500});
                                    return;
                                }
                                var addFormEntityCount = 0;
                                for (var i = 0; i < rows.length; i++) {
                                    if (rows[i] == "")continue;
                                    for (var j = 0; j < addFormSelectList.length; j++) {
                                        if (addFormSelectList[j].id == rows[i]) {
                                            var isInput = true;
                                            for (var k = 0; k < addFormEntity.length; k++) {
                                                if (rows[i] == addFormEntity[k].id) {
                                                    isInput = false;
                                                    break;
                                                }
                                            }
                                            if (isInput == true) {
                                                addFormEntity[addFormEntity.length] = addFormSelectList[j];
                                                addFormEntityCount++;
                                            }
                                            break;
                                        }
                                    }
                                }
                                if (addFormEntityCount == 0) {
                                    layer.msg('选择的密品已经添加过了', {time: 2500});
                                    return;
                                }
                                checkOutInsertRefresh();
                                layer.msg('已添加所选密品，您可以继续添加！', {time: 2000});

                            });
                    },
                    btn2: function (index) {
                        addFormCleanButton();
                        layer.close(index);
                    },
                    cancel: function (index) {
                        addFormCleanButton();
                        layer.close(index);
                    },
                    success: function () {
                        addFormSelect();
                    }

                });
            }

            function reverseAdd(str, add) {
                var strReverse = str.split('').reverse().join('');
                var numReverse = strReverse.match(/\d+/gi)[0];
                var num = numReverse.split('').reverse().join('');
                var sum = parseInt(num) + parseInt(add);
                var addZero = numReverse.length - (sum + "").length;
                for (var a = 0; a < addZero; a++)sum = "0" + sum;
                return str.substring(0, str.length - num.length) + sum;
            }

            //查看新增出库列表的具体密品信息
            $(document).on("click", ".checkOutItemDetail", function () {
                checkOutItemDetail(this);
            });
            function checkOutItemDetail(op) {
                var option = addFormEntity[op.getAttribute("value")];

                $("#addFormDictionaryId").val(option.addFormDictionaryId);
                $("#addFormDictionaryId").attr("text", option.addFormDictionaryText);
                $("#addFormModel").val(option.addFormModel);
                $("#addFormSerNum").val(option.addFormSerNum);
                $("#addFormApplicationId").val(option.addFormApplicationId);
                $("#addFormApplicationId").attr("text", option.addFormApplicationText);
                $("#addFormLocationId").val(option.addFormLocationId);
                $("#addFormLocationId").attr("text", option.addFormLocationText);
                $("#addFormSysUserId").val(option.addFormSysUserId);
                $("#addFormSysUserId").attr("text", option.addFormSysUserText);
                $("#addFormProCode").val(option.addFormProCode);
                $("#addFormProCodeCount").val(option.addFormProCodeCount);
                $("#addFormInfo").val(option.addFormInfo);
                $("#addFormDictionaryId").attr("disabled", true);
                $("#addFormModel").attr("disabled", true);
                $("#addFormSerNum").attr("disabled", true);
                $("#addFormApplicationId").attr("disabled", true);
                $("#addFormLocationId").attr("disabled", true);
                $("#addFormSysUserId").attr("disabled", true);
                $("#addFormProCode").attr("disabled", true);
                $("#addFormProCodeCount").attr("disabled", true);
                $("#addFormInfo").attr("disabled", true);

                $("#addFormRandomButton").hide();
                $("#addFormProductButton").hide();
                var checkOutRandomHtml = "";
                for (var i = 0; i < option.addFormRandomList.length; i++) {
                    var index = i + 1
                    checkOutRandomHtml +=
                        "<tr> " +
                        "<td>" + index + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomDictionaryText + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomLocationText + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomInfo + "</td> " +
                        "<td style='text-align: center;color: #2283C5;'> " +
                        "<span>" +
                        "</span>" +
                        "</td> " +
                        "selectPageListUseDyc</tr>"
                }
                $("#addFormRandomTable").empty();
                $("#addFormRandomTable").append(checkOutRandomHtml);

                layer.open({
                    type: 1,
                    title: '新增出库',
                    shadeClose: false,
                    offset: '0px',
                    area: ['100%', '100%'],
                    content: $('#addForm'),
                    btn: ['确定'],
                    btnAlign: 'c', //按钮居中
                    yes: function (index) {
                        layer.close(index);
                    }
                });

            }

            //删除新增出库列表的密品
            $(document).on("click", ".checkOutItemDelete", function () {
                checkOutItemDelete(this);
            });
            function checkOutItemDelete(op) {
//                var option = addFormEntity[op.getAttribute("value")];
                layer.confirm(
                    "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",
                    function (index) {
                        addFormEntity.splice(op.getAttribute("value"), 1);
                        checkOutInsertRefresh();
                        layer.close(index);
                    });
            }

            //批量删除新增出库列表的密品
            $('#detailFormDeleteProduct').on('click', function () {
                layer.confirm(
                    "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",

                    function (index) {
                        var trs = $("#checkOutDetailTable").find("tr");

                        var rows = [];//被选中的数据Id
                        var count = 0;
                        trs.each(function (index, item) {
                            var check = $("#checkOutDetailTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');//判断是否选中
                            if (check[0].checked == true) {
                                rows[count++] = $("#checkOutDetailTable").find("tr").eq(index).find("td").eq(1).text();
                            }
                        });
                        for (var a = rows.length; a > 0; a--) {
                            addFormEntity.splice(parseInt(rows[a - 1]) - 1, 1);
                        }
                        checkOutInsertRefresh();
                        layer.close(index);
                    });
            });


            //密品出库列表确认
            $(document).on("click", ".checkOutConfirm", function () {
                var option = checkOutList[this.getAttribute("value")];
                checkOutConfirm(option.id, 'open');
            });
            function checkOutConfirm(id, isOpen) {
                var pageIndex = 1;
                $("#detailFormAddProduct").hide();
                $("#detailFormDeleteProduct").hide();
                $("#data-pagination-detail").show();

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/select.action",
                    traditional: true,
                    data: {
                        "checkoutbillitem": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "checkoutbillId": id
                            }
                            }
                        ),
                        "isDetail": "2"
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        var checkOutDetailList = re.p.list;
                        var productList = re.checkoutbillitemSelectList;
                        var checkOutHtml = "";
                        if (checkOutDetailList.length == 0) {
                            layer.msg('订单详情为空', {time: 1000});
                            return;
                        }
                        $("#detailFormBillCode").val(checkOutDetailList[0].billCode);
                        $("#detailFormDesDepartmentName").val(checkOutDetailList[0].desDepartmentName);
                        $("#detailFormCreateTime").val(checkOutDetailList[0].createTime);

                        $("#detailFormDesDepartmentSysUser").children().remove();
                        var sysusersHtml = "<option value=\"\"></option>";
                        for (var j = 0; j < sysusers.length; j++) {
                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                        }
                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                        $("[id='detailFormDesDepartmentSysUser']").val(checkOutDetailList[0].desDepartmentSysUserId);
                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkOutDetailList[0].desDepartmentSysUser);

                        $("#detailFormInfo").val(checkOutDetailList[0].info);
                        $("#detailFormBillCode").attr("disabled", true);
                        $("#detailFormDesDepartmentName").attr("disabled", true);
                        $("#detailFormCreateTime").attr("disabled", true);
                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                        $("#detailFormInfo").attr("disabled", true);
                        for (var a = 0; a < checkOutDetailList.length; a++) {
                            var mijianList = new Array();//密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < productList.length; j++) {
                                if (productList[j].productId != null && productList[j].productId == checkOutDetailList[a].id) {
                                    mijianList.push(productList[j]);
                                }
                            }
                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                            checkOutHtml +=
                                "<tr> " +
                                "<td class='detailFormSwitchCheckBox center'>" +
                                " <label class='pos-rel'> " +
                                "<input type='checkbox' class='ace'/> " +
                                "<span class='lbl'></span> " +
                                "</label> ";
                            if (mijianList.length != 0) {
                                checkOutHtml +=
                                    "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 checkOutItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>详情</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            } else {
                                checkOutHtml +=
                                    "<td class='center'>" +
                                    "</td>";
                            }
                            checkOutHtml +=
                                "<td>" + page + "</td> " +
                                "<td hidden=hidden >" + checkOutDetailList[a].id + "</td> " +
                                "<td>" + checkOutDetailList[a].productDictionaryValue + "</td> " +
                                "<td>" + checkOutDetailList[a].productModel + "</td> " +
                                "<td>" + checkOutDetailList[a].productProCode + "</td> " +
                                "<td>" + checkOutDetailList[a].productSerNum + "</td> " +
                                "<td>" + checkOutDetailList[a].productRfidCode + "</td> " +
                                "<td>" + checkOutDetailList[a].checkoutTime + "</td> " +
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>";
                            if (checkOutDetailList[a].checkoutTime == "") {
                                checkOutHtml += "<a style='cursor:pointer;text-decoration:none' class='checkOutConfirmButton' value='" + checkOutDetailList[a].id + "'> 确认出库 </a>";
                            } else {
                                checkOutHtml += "<a style='cursor:pointer;text-decoration:none' value='" + checkOutDetailList[a].id + "'> 已出库 </a>";
                            }
                            checkOutHtml += "</span>" +
                                "</td> " +
                                "</tr>";
                            if (mijianList.length != 0) {
                                checkOutHtml += "<tr class='detail-row' type='1'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                $.each(mijianList, function (index, item) {
                                    var id = item.id;
                                    var rfidCode = "";
                                    if (item.rfidCode != null) {
                                        rfidCode = productList[j].rfidCode;
                                    }
                                    checkOutHtml += "<tr style='height: 30px' type='2'>" +
                                        "<td class='detailFormSwitchCheckBox' >" +
                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden type='密件'>" + id + "</td>" +
                                        "<td style='padding-left: 20px'>" + " 类别 ：" + item.productDictionaryValue + "</td>" +
                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                        "<td style='text-align: center;color: #2283C5;'> " +
                                        "<span>";
                                    if (item.checkoutTime == "") {
                                        checkOutHtml += "<a style='cursor:pointer;text-decoration:none' class='checkOutConfirmButton' value='" + item.id + "'> 确认出库 </a>";
                                    } else {
                                        checkOutHtml += "<a style='cursor:pointer;text-decoration:none' value='" + item.id + "'> 已出库 </a>";
                                    }
                                    checkOutHtml += "</span>" +
                                        "</td> " +
                                        "</tr>";
                                })
                                checkOutHtml +=
                                    "</table>" +
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                        }
                        $("#checkOutDetailTable").empty();
                        $("#checkOutDetailTable").append(checkOutHtml);

                        //出库确认
                        $(document).off("click", ".checkOutConfirmButton");
                        $(document).on("click", ".checkOutConfirmButton", function () {
                            id = $(this).attr("value");
                            layer.confirm(
                                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认出库？</div>",
                                function (index) {
                                    layer.load(2, {time: 1000});
                                    $.ajax({
                                        type: "post",
                                        dataType: "html",
                                        url: "/checkOut/update.action",
                                        traditional: true,
                                        data: {
                                            "checkout": JSON.stringify({
                                                "checkoutbillitemList": [{
                                                    "id": id,
                                                    "result": "1"
                                                }]
                                            })
                                        },
                                        success: function (result) {
                                            re = JSON.parse(result);
                                            if (re.status == ("true")) {
                                                layer.msg(re.msg, {time: 1000});
                                                layer.close(index);
                                                checkOutConfirm(re.data.checkoutbillitemList[0].checkoutbillId, 'notOpen');
                                            } else if (re.status == ("false")) {
                                                layer.msg(re.msg, {time: 1000});
                                            }
                                        },
                                        error: function (result) {
                                            layer.msg('状态更新异常！', {time: 1000});
                                        }
                                    });
                                })
                        });
                        //查看密品详情的密件
                        $(document).off("click", ".checkOutItemDetailInDatabase");
                        $(document).on("click", ".checkOutItemDetailInDatabase", function (e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                        if (isOpen == 'open')
                            layer.open({
                                type: 1,
                                title: '出库单确认',
                                shadeClose: false,
                                offset: '0px',
                                area: ['100%', '100%'],
                                content: $('#detailForm'),
                                btn: ['关闭'],
                                btnAlign: 'c', //按钮居中
                                yes: function () {
                                    layer.closeAll();
                                },
                                success: function () {
                                    $(".detailFormSwitchInsert").hide();
                                    $(".detailFormSwitchCheckBox").hide();
                                    $(".detailFormSwitchDetail").show();
                                    $(".detailFormSwitchConfirm").show();
                                }
                            });
                        if (checkOutDetailList.length == 0) {
                            $('#data-pagination-detail').children().remove();
                            return;
                        }
                        var options = {
                            bootstrapMajorVersion: 3,
                            currentPage: re.p.pageIndex,    //变量名必须为currentPage
                            totalPages: re.p.totalPages,    //变量名必须为totalPages
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
                                    url: "/checkOut/select.action",
                                    data: {
                                        "checkoutbillitem": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "checkoutbillId": id
                                            }
                                            }
                                        ),
                                        "isDetail": "2"
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result);
                                        var checkOutDetailList = re.p.list;
                                        var productList = re.checkoutbillitemSelectList;
                                        var checkOutHtml = "";
                                        if (checkOutDetailList.length == 0) {
                                            layer.msg('订单详情为空', {time: 1000});
                                            return;
                                        }
                                        $("#detailFormBillCode").val(checkOutDetailList[0].billCode);
                                        $("#detailFormDesDepartmentName").val(checkOutDetailList[0].desDepartmentName);
                                        $("#detailFormCreateTime").val(checkOutDetailList[0].createTime);

                                        $("#detailFormDesDepartmentSysUser").children().remove();
                                        var sysusersHtml = "<option value=\"\"></option>";
                                        for (var j = 0; j < sysusers.length; j++) {
                                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                                        }
                                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                                        $("[id='detailFormDesDepartmentSysUser']").val(checkOutDetailList[0].desDepartmentSysUserId);
                                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkOutDetailList[0].desDepartmentSysUser);

                                        $("#detailFormInfo").val(checkOutDetailList[0].info);
                                        $("#detailFormBillCode").attr("disabled", true);
                                        $("#detailFormDesDepartmentName").attr("disabled", true);
                                        $("#detailFormCreateTime").attr("disabled", true);
                                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                                        $("#detailFormInfo").attr("disabled", true);
                                        for (var a = 0; a < checkOutDetailList.length; a++) {
                                            var mijianList = new Array();//密件List
                                            //判断该密品下是否有密件
                                            for (var j = 0; j < productList.length; j++) {
                                                if (productList[j].productId != null && productList[j].productId == checkOutDetailList[a].id) {
                                                    mijianList.push(productList[j]);
                                                }
                                            }
                                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                                            checkOutHtml +=
                                                "<tr> ";
                                            if (mijianList.length != 0) {
                                                checkOutHtml +=
                                                    "<td class='center'>" +
                                                    "<div class='action-buttons'>" +
                                                    "<a href='#' class='green bigger-140 checkOutItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                                    "<span class='sr-only'>详情</span>" +
                                                    "</a>" +
                                                    "</div>" +
                                                    "</td>";
                                            } else {
                                                checkOutHtml +=
                                                    "<td class='center'>" +
                                                    "</td>";
                                            }
                                            checkOutHtml +=
                                                "<td>" + page + "</td> " +
                                                "<td hidden=hidden >" + checkOutDetailList[a].id + "</td> " +
                                                "<td>" + checkOutDetailList[a].productDictionaryValue + "</td> " +
                                                "<td>" + checkOutDetailList[a].productModel + "</td> " +
                                                "<td>" + checkOutDetailList[a].productProCode + "</td> " +
                                                "<td>" + checkOutDetailList[a].productSerNum + "</td> " +
                                                "<td>" + checkOutDetailList[a].productRfidCode + "</td> " +
                                                "<td>" + checkOutDetailList[a].checkoutTime + "</td> " +
                                                "<td style='text-align: center;color: #2283C5;'> " +
                                                "<span>";
                                            if (checkOutDetailList[a].checkoutTime == "") {
                                                checkOutHtml += "<a style='cursor:pointer;text-decoration:none' class='checkOutConfirmButton' value='" + checkOutDetailList[a].id + "'> 确认出库 </a>";
                                            } else {
                                                checkOutHtml += "<a style='cursor:pointer;text-decoration:none' value='" + checkOutDetailList[a].id + "'> 已出库 </a>";
                                            }
                                            checkOutHtml += "</span>" +
                                                "</td> " +
                                                "</tr>";
                                            if (mijianList.length != 0) {
                                                checkOutHtml += "<tr class='detail-row' type='1'>" +
                                                    "<td colspan='12'>" +
                                                    "<div class='table-detail'>" +
                                                    "<div class='row'>" +
                                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                                $.each(mijianList, function (index, item) {
                                                    var id = item.id;
                                                    var rfidCode = "";
                                                    if (item.rfidCode != null) {
                                                        rfidCode = productList[j].rfidCode;
                                                    }
                                                    checkOutHtml += "<tr style='height: 30px' type='2'>" +
//                                                        "<td class='detailFormSwitchCheckBox' >" +
//                                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                                        "<td hidden=hidden type='密件'>" + id + "</td>" +
                                                        "<td style='padding-left: 20px'>" + " 类别 ：" + item.productDictionaryValue + "</td>" +
                                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                                        "<td style='text-align: center;color: #2283C5;'> " +
                                                        "<span>";
                                                    if (item.checkoutTime == "") {
                                                        checkOutHtml += "<a style='cursor:pointer;text-decoration:none' class='checkOutConfirmButton' value='" + item.id + "'> 确认出库 </a>";
                                                    } else {
                                                        checkOutHtml += "<a style='cursor:pointer;text-decoration:none' value='" + item.id + "'> 已出库 </a>";
                                                    }
                                                    checkOutHtml += "</span>" +
                                                        "</td> " +
                                                        "</tr>";
                                                })
                                                checkOutHtml +=
                                                    "</table>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</td>" +
                                                    "</tr>"
                                            }
                                        }
                                        $("#checkOutDetailTable").empty();
                                        $("#checkOutDetailTable").append(checkOutHtml);

                                        //出库确认
                                        $(document).off("click", ".checkOutConfirmButton");
                                        $(document).on("click", ".checkOutConfirmButton", function () {
                                            id = $(this).attr("value");
                                            layer.confirm(
                                                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认出库？</div>",
                                                function (index) {
                                                    layer.load(2, {time: 1000});
                                                    $.ajax({
                                                        type: "post",
                                                        dataType: "html",
                                                        url: "/checkOut/update.action",
                                                        traditional: true,
                                                        data: {
                                                            "checkout": JSON.stringify({
                                                                "checkoutbillitemList": [{
                                                                    "id": id,
                                                                    "result": "1"
                                                                }]
                                                            })
                                                        },
                                                        success: function (result) {
                                                            re = JSON.parse(result);
                                                            if (re.status == ("true")) {
                                                                layer.msg(re.msg, {time: 1000});
                                                                layer.close(index);
                                                                checkOutConfirm(re.data.checkoutbillitemList[0].checkoutbillId, 'notOpen');
                                                            } else if (re.status == ("false")) {
                                                                layer.msg(re.msg, {time: 1000});
                                                            }
                                                        },
                                                        error: function (result) {
                                                            layer.msg('状态更新异常！', {time: 1000});
                                                        }
                                                    });
                                                })
                                        });
                                        //查看密品详情的密件
                                        $(document).off("click", ".checkOutItemDetailInDatabase");
                                        $(document).on("click", ".checkOutItemDetailInDatabase", function (e) {
                                            e.preventDefault();
                                            $(this).closest('tr').next().toggleClass('open');
                                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                                        });
                                    }
                                });
                            }
                        };
                        $('#data-pagination-detail').bootstrapPaginator(options);
                    },
                    error: function (result) {
                    }
                });

            }

            $("#addFormRandomButton").on('click', function () {
                addFormRandom("添加至出库单")
            })
            //新增密件
            function addFormRandom(_title) {
                layer.open({
                    type: 1,
                    title: _title,
                    shadeClose: false,
                    area: ['45%', '50%'],
                    content: $('#addFormRandom'),
                    btn: ['保存', '关闭'],
                    btnAlign: 'c', //按钮居中
                    yes: function () {
                        var addFormRandomDictionaryId = $("#addFormRandomDictionaryId").val();
                        var addFormRandomDictionaryText = $("#addFormRandomDictionaryId").find("option:selected").text();
                        var addFormRandomLocationId = $("#addFormRandomLocationId").val();
                        var addFormRandomLocationText = $("#addFormRandomLocationId").find("option:selected").text();
                        var addFormRandomInfo = $("#addFormRandomInfo").val();
                        if (addFormRandomDictionaryId == null || addFormRandomDictionaryId == "") {
                            layer.msg('密品类型为空', {time: 1000});
                            return;
                        }
                        if (addFormRandomLocationId == null || addFormRandomLocationId == "") {
                            layer.msg('所属位置为空', {time: 1000});
                            return;
                        }
                        //动态插入密件
                        var indexString = $("#addFormRandomTable").children().eq($("#addFormRandomTable").children().length - 1).children().eq(0).text();
                        var index = parseInt(indexString == "" || indexString == NaN ? 0 : indexString) + 1;
                        var addFormRandomTableHtml =
                            "<tr> " +
                            "<td>" + index + "</td> " +
                            "<td value='" + addFormRandomDictionaryId + "'>" + addFormRandomDictionaryText + "</td> " +
                            "<td value='" + addFormRandomLocationId + "'>" + addFormRandomLocationText + "</td> " +
                            "<td>" + addFormRandomInfo + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='addFormRandomDelete' value='" + index + "'> 删除 </a> " +
                            "</span>" +
                            "</td> " +
                            "</tr>"

                        $("#addFormRandomTable").append(addFormRandomTableHtml);
                        $("#addFormRandomDictionaryId").val("");
                        $("#addFormRandomLocationId").val("");
                        $("#addFormRandomInfo").val("");

                        //删除密件
                        $('.addFormRandomDelete').on('click', function () {
                            this.parentNode.parentNode.parentNode.remove();
                        });
                    },
                    btn2: function (index) {
                        $("#addFormRandomDictionaryId").val("");
                        $("#addFormRandomLocationId").val("");
                        $("#addFormRandomInfo").val("");
                        layer.close(index);
                    },
                    cancel: function (index) {
                        $("#addFormRandomDictionaryId").val("");
                        $("#addFormRandomLocationId").val("");
                        $("#addFormRandomInfo").val("");
                        layer.close(index);
                    }
                })
            }

            //批量删除
            $('#checkOutDeleteButton').on('click', function () {
                var child = $("#checkOutTable").parents('table').find('tbody input[type="checkbox"]');
                var c = [];
                var count = 0;
                child.each(function (index, item) {
                    if (item.checked == true) {
                        var index = $("#checkOutTable").children().eq(index).children().eq(1)[0].innerText
                        c[count++] = checkOutList[index%10 - 1].id;
                    }
                });
                checkOutDelete(c);
            });

            //导入
            $('#checkOutInputButton').on('click', function () {
                checkOutSelect(this);
            });
            //导出
            $('#checkOutOutputButton').on('click', function () {
                checkOutSelect(this);
            });
            //编辑
//            $(document).on("click", ".checkOutUpdate", function () {
//                checkOutUpdate(this);
//            });
//            function checkOutUpdate(op) {
//                var option = checkOutList[op.getAttribute("value")];
//
//                $("#addFormName").val(option.name);
//                $("#addFormUserName").val(option.userName);
//                $("#addFormPassWord").val("");
//                $("#detailFormDesDepartmentName").val(option.departmentName);
//                $("[id='addFormRole']").val(option.roleId);
//                $("[id='addFormRole']").attr("text", option.roleName);
//                $("#addFormInfo").val(option.info);
//
//                $("#addFormName").attr("disabled", false);
//                $("#addFormUserName").attr("disabled", true);
//                $("#addFormPassWord").attr("disabled", true);
//                $("#detailFormDesDepartmentName").attr("disabled", false);
//                $("#addFormRole").attr("disabled", false);
//                $("#addFormInfo").attr("disabled", false);
//                layer.open({
//                    type: 1,
//                    title: '编辑人员',
//                    shadeClose: false,
//                    //shade: 0.8,
//                    area: ['100%', '100%'],
//                    content: $('#addForm'),
//                    btn: ['保存', '关闭'],
//                    btnAlign: 'c', //按钮居中
//                    yes: function () {
//                        // $(that).click();
//                        var addFormName = $("#addFormName").val();
//                        var detailFormDesDepartmentName = nodes.nodeid;
//                        var addFormRole = $("#addFormRole").val();
//                        var addFormInfo = $("#addFormInfo").val();
//                        $.ajax({
//                            type: "post",
//                            dataType: "html",
//                            url: "/checkOut/update.action",
//                            traditional: true,
//                            data: {
//                                "checkout": JSON.stringify(
//                                    {
//                                        "id": option.id,
//                                        "name": addFormName,
//                                        "departmentId": detailFormDesDepartmentName,
//                                        "info": addFormInfo
//                                    }
//                                )
//                            },
//                            success: function (result) {
//                                var re = JSON.parse(result)
//                                if (re.status == ("true")) {
//                                    layer.msg(re.msg, {time: 1000});
//                                    checkOutClean();
//                                    checkOutSelect();
//                                    layer.closeAll();
//                                } else if (re.status == ("false")) {
//                                    layer.msg(re.msg, {time: 1000});
//                                }
//                            },
//                            error: function (result) {
//                                layer.msg('编辑人员异常', {time: 1000});
//                            }
//                        });
//
//                    },
//                    btn2: function () {
//                        layer.closeAll();
//                    }
//                });
//            }

            //查看密品详情
            $(document).on("click", ".checkOutDetail", function () {
                var option = checkOutList[this.getAttribute("value")]
                checkOutDetail(option.id);
            });
            var checkOutDetailList;

            function checkOutDetail(id) {
                var pageIndex = 1;
                $("#detailFormAddProduct").hide();
                $("#detailFormDeleteProduct").hide();
                $("#data-pagination-detail").show();

                $("#detailFormBillCode").val("");
                $("#detailFormDesDepartmentName").val("");
                $("#detailFormLocationId").val("");
                $("#detailFormPersonName").val("");
                $("#detailFormSysUserId").val("");
                $("#detailFormInfo").val("");

                $(".detailFormSwitchDetailType").hide();
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/select.action",
                    traditional: true,
                    data: {
                        "checkoutbill": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "id": id
                            }
                            }
                        ),
                        "isDetail": "1"
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        var checkOutList = re.list;
                        $("#detailFormBillCode").val(checkOutList[0].billCode);
                        $("#detailFormDesDepartmentName").val(checkOutList[0].desDepartmentName);
                        $("#detailFormLocationId").val(checkOutList[0].locationId);
                        $("#detailFormLocationId").attr("text", checkOutList[0].locInfo);
                        $("#detailFormPersonName").val(checkOutList[0].personName);
                        $("#detailFormSysUserId").val(checkOutList[0].sysuserId);
                        $("#detailFormSysUserId").attr("text", checkOutList[0].sysUserName);
                        $("#detailFormInfo").val(checkOutList[0].info);

                        $("#detailFormLocationId").attr("disabled", true);
                        $("#detailFormPersonName").attr("disabled", true);
                        $("#detailFormSysUserId").attr("disabled", true);
                    }
                });

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkOut/select.action",
                    traditional: true,
                    data: {
                        "checkoutbillitem": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "checkoutbillId": id
                            }
                            }
                        ),
                        "isDetail": "2"
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        var checkOutDetailList = re.p.list;
                        var productList = re.checkoutbillitemSelectList;
                        var checkOutHtml = "";
                        if (checkOutDetailList.length == 0) {
                            layer.msg('订单详情为空', {time: 1000});
                            return;
                        }
                        $("#detailFormBillCode").val(checkOutDetailList[0].billCode);
                        $("#detailFormDesDepartmentName").val(checkOutDetailList[0].desDepartmentName);
                        $("#detailFormCreateTime").val(checkOutDetailList[0].createTime);

                        $("#detailFormDesDepartmentSysUser").children().remove();
                        var sysusersHtml = "<option value=\"\"></option>";
                        for (var j = 0; j < sysusers.length; j++) {
                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                        }
                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                        $("[id='detailFormDesDepartmentSysUser']").val(checkOutDetailList[0].desDepartmentSysUserId);
                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkOutDetailList[0].desDepartmentSysUser);

                        $("#detailFormBillCode").attr("disabled", true);
                        $("#detailFormDesDepartmentName").attr("disabled", true);
                        $("#detailFormCreateTime").attr("disabled", true);
                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                        $("#detailFormInfo").attr("disabled", true);
                        for (var a = 0; a < checkOutDetailList.length; a++) {
                            var mijianList = new Array();//密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < productList.length; j++) {
                                if (productList[j].productId != null && productList[j].productId == checkOutDetailList[a].id) {
                                    mijianList.push(productList[j]);
                                }
                            }
                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                            checkOutHtml +=
                                "<tr> " +
                                "<td class='detailFormSwitchCheckBox center'>" +
                                " <label class='pos-rel'> " +
                                "<input type='checkbox' class='ace'/> " +
                                "<span class='lbl'></span> " +
                                "</label> ";
                            if (mijianList.length != 0) {
                                checkOutHtml +=
                                    "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 checkOutItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>详情</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            } else {
                                checkOutHtml +=
                                    "<td class='center' hidden=hidden>" +
                                    "</td>";
                            }
                            checkOutHtml +=
                                "<td>" + page + "</td> " +
                                "<td hidden=hidden >" + checkOutDetailList[a].id + "</td> " +
                                "<td>" + checkOutDetailList[a].productDictionaryValue + "</td> " +
                                "<td>" + checkOutDetailList[a].productModel + "</td> " +
                                "<td>" + checkOutDetailList[a].productProCode + "</td> " +
                                "<td>" + checkOutDetailList[a].productSerNum + "</td> " +
                                "<td>" + checkOutDetailList[a].productRfidCode + "</td> " +
                                "<td>" + checkOutDetailList[a].checkoutTime + "</td> " +
                                "</tr>";
                            if (mijianList.length != 0) {
                                checkOutHtml += "<tr class='detail-row' type='1'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                $.each(mijianList, function (index, item) {
                                    var id = item.id;
                                    var rfidCode = "";
                                    if (item.rfidCode != null) {
                                        rfidCode = productList[j].rfidCode;
                                    }
                                    checkOutHtml += "<tr style='height: 30px' type='2'>" +
                                        "<td class='detailFormSwitchCheckBox' >" +
                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden type='密件'>" + id + "</td>" +
                                        "<td style='padding-left: 20px'>" + " 类别 ：" + item.productDictionaryValue + "</td>" +
                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                        "</tr>";
                                })
                                checkOutHtml +=
                                    "</table>" +
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                        }
                        $("#checkOutDetailTable").empty();
                        $(document).off("click", ".checkOutItemDetailInDatabase");
                        $("#checkOutDetailTable").append(checkOutHtml);
                        //查看密品详情的密件
                        $(document).on("click", ".checkOutItemDetailInDatabase", function (e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                        layer.open({
                            type: 1,
                            title: '出库单查看',
                            shadeClose: false,
                            offset: '0px',
                            area: ['100%', '100%'],
                            content: $('#detailForm'),
                            btn: ['关闭'],
                            btnAlign: 'c', //按钮居中
                            yes: function () {
                                layer.closeAll();
                            },
                            success: function () {
                                $(".detailFormSwitchInsert").hide();
                                $(".detailFormSwitchCheckBox").hide();
                                $(".detailFormSwitchDetail").show();
                                $("#detailFormSwitchDetail1").hide();
                                $(".detailFormSwitchConfirm").hide();
                            }
                        });
                        if (checkOutDetailList.length == 0) {
                            $('#data-pagination-detail').children().remove();
                            return;
                        }
                        var options = {
                            bootstrapMajorVersion: 3,
                            currentPage: re.p.pageIndex,    //变量名必须为currentPage
                            totalPages: re.p.totalPages,    //变量名必须为totalPages
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
                                    url: "/checkOut/select.action",
                                    data: {
                                        "checkoutbillitem": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "checkoutbillId": id
                                            }
                                            }
                                        ),
                                        "isDetail": "2"
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result);
                                        var checkOutDetailList = re.p.list;
                                        var productList = re.checkoutbillitemSelectList;
                                        var checkOutHtml = "";
                                        if (checkOutDetailList.length == 0) {
                                            layer.msg('订单详情为空', {time: 1000});
                                            return;
                                        }
                                        $("#detailFormBillCode").val(checkOutDetailList[0].billCode);
                                        $("#detailFormDesDepartmentName").val(checkOutDetailList[0].desDepartmentName);
                                        $("#detailFormCreateTime").val(checkOutDetailList[0].createTime);

                                        $("#detailFormDesDepartmentSysUser").children().remove();
                                        var sysusersHtml = "<option value=\"\"></option>";
                                        for (var j = 0; j < sysusers.length; j++) {
                                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                                        }
                                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                                        $("[id='detailFormDesDepartmentSysUser']").val(checkOutDetailList[0].desDepartmentSysUserId);
                                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkOutDetailList[0].desDepartmentSysUser);

                                        $("#detailFormBillCode").attr("disabled", true);
                                        $("#detailFormDesDepartmentName").attr("disabled", true);
                                        $("#detailFormCreateTime").attr("disabled", true);
                                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                                        $("#detailFormInfo").attr("disabled", true);
                                        for (var a = 0; a < checkOutDetailList.length; a++) {
                                            var mijianList = new Array();//密件List
                                            //判断该密品下是否有密件
                                            for (var j = 0; j < productList.length; j++) {
                                                if (productList[j].productId != null && productList[j].productId == checkOutDetailList[a].id) {
                                                    mijianList.push(productList[j]);
                                                }
                                            }
                                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                                            checkOutHtml +=
                                                "<tr> ";
                                            if (mijianList.length != 0) {
                                                checkOutHtml +=
                                                    "<td class='center'>" +
                                                    "<div class='action-buttons'>" +
                                                    "<a href='#' class='green bigger-140 checkOutItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                                    "<span class='sr-only'>详情</span>" +
                                                    "</a>" +
                                                    "</div>" +
                                                    "</td>";
                                            } else {
                                                checkOutHtml +=
                                                    "<td class='center' hidden=hidden>" +
                                                    "</td>";
                                            }
                                            checkOutHtml +=
                                                "<td>" + page + "</td> " +
                                                "<td hidden=hidden >" + checkOutDetailList[a].id + "</td> " +
                                                "<td>" + checkOutDetailList[a].productDictionaryValue + "</td> " +
                                                "<td>" + checkOutDetailList[a].productModel + "</td> " +
                                                "<td>" + checkOutDetailList[a].productProCode + "</td> " +
                                                "<td>" + checkOutDetailList[a].productSerNum + "</td> " +
                                                "<td>" + checkOutDetailList[a].productRfidCode + "</td> " +
                                                "<td>" + checkOutDetailList[a].checkoutTime + "</td> " +
                                                "</tr>";
                                            if (mijianList.length != 0) {
                                                checkOutHtml += "<tr class='detail-row' type='1'>" +
                                                    "<td colspan='12'>" +
                                                    "<div class='table-detail'>" +
                                                    "<div class='row'>" +
                                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                                $.each(mijianList, function (index, item) {
                                                    var id = item.id;
                                                    var rfidCode = "";
                                                    if (item.rfidCode != null) {
                                                        rfidCode = productList[j].rfidCode;
                                                    }
                                                    checkOutHtml += "<tr style='height: 30px' type='2'>" +
                                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                                        "<td hidden=hidden type='密件'>" + id + "</td>" +
                                                        "<td style='padding-left: 20px'>" + " 类别 ：" + item.productDictionaryValue + "</td>" +
                                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                                        "</tr>";
                                                })
                                                checkOutHtml +=
                                                    "</table>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</td>" +
                                                    "</tr>"
                                            }
                                        }
                                        $("#checkOutDetailTable").empty();
                                        $(document).off("click", ".checkOutItemDetailInDatabase");
                                        $("#checkOutDetailTable").append(checkOutHtml);
                                        //查看密品详情的密件
                                        $(document).on("click", ".checkOutItemDetailInDatabase", function (e) {
                                            e.preventDefault();
                                            $(this).closest('tr').next().toggleClass('open');
                                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                                        });
                                    }
                                });
                            }
                        };
                        $('#data-pagination-detail').bootstrapPaginator(options);
                    },
                    error: function (result) {
                    }
                });

            }

            //密品新增单一删除
            $(document).on("click", ".checkOutDelete", function () {
                var StringArray = [];
                StringArray[0] = checkOutList[this.getAttribute("value")].id
                checkOutDelete(StringArray);
            });

            function checkOutDelete(deleteList) {
                layer.confirm(
                    "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",
                    function () {
                        for (var i = 0; i < deleteList.length; i++) {
                            layer.load(2, {time: 1000});
                            $.ajax({
                                type: "post",
                                dataType: "html",
                                url: "/checkOut/delete.action",
                                traditional: true,
                                data: {
                                    "checkout": JSON.stringify(
                                        {
                                            "checkoutbill": {
                                                "id": deleteList[i]
                                            },
                                        }
                                    )
                                },
                                success: function (result) {
                                    re = JSON.parse(result)
                                    if (re.status == ("true")) {
                                        layer.msg(re.msg, {time: 1000});
                                        checkOutClean();
                                        checkOutSelect();
                                    } else if (re.status == ("false")) {
                                        layer.msg(re.msg, {time: 1000});
                                    }
                                },
                                error: function (result) {
                                    layer.msg('删除异常！', {time: 1000});
                                }
                            });
                        }
                    })
            }

        var userroleaction={
            uid:'',
            menuId:'6'
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