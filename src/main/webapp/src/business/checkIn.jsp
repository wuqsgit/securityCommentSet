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
    <title>密品入库</title>

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
                        <i class="ace-icon fa fa-home home-icon"></i>密品入库
                    </li>

                </ul>

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form id="edit_form">
                            <div style="border: 1px solid rgb(221, 221, 221);padding-top: 5px;min-width: 950px">
                                <table style=" height: 80px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 950px;margin: auto;margin-bottom: 5px"
                                       border="0">
                                    <tr>
                                        <td style="padding-left: 22px">密品类别：<select class="chosen-select" id="checkInSelectProductDictionaryId"
                                                         name="checkInSelectProductDictionaryId"
                                                         data-placeholder="" style="width: 163px">
                                            <option></option>

                                        </select>
                                            <a style="padding-left: 10px"></a>密品型号：<input id="checkInSelectProductModel"
                                                        name="checkInSelectProductModel" type="text" maxlength="64"
                                                        onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                            <a style="padding-left: 8px"></a>所属系统：<select class="chosen-select" id="checkInSelectApplicationId"
                                                         name="checkInSelectApplicationId" data-placeholder=""
                                                         style="width: 200px">
                                            <option></option>
                                        </select>
                                        </td>
                                        <td rowspan="2" style="padding-left: 20px">
                                            <button type="button" id="checkInSelectButton"
                                                    name="checkInSelectButton" class="btn btn-info btn-xs"
                                                    style="margin-top: 0px">
                                                <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                            </button>&nbsp;
                                            <button type="button" id="checkInCleanButton" name="checkInCleanButton"
                                                    class="btn btn-xs btn-purple" style="width: 54.3px">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                            </button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-left: 22px">入库状态：<select class="chosen-select" id="checkInSelectStatus"
                                                         style="width: 163px">
                                            <option value=""></option>
                                            <option value="1">已完成</option>
                                            <option value="0">未完成</option>
                                        </select>
                                            <a style="padding-left: 34px"></a>位置：<select class="chosen-select" id="checkInSelectLocationId"
                                                         name="checkInSelectLocationId" data-placeholder=""
                                                         style="width: 163px;">
                                            <option></option>
                                        </select>
                                            <a style="padding-left: 8px"></a>时间范围：<input class="" type="text"
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
                                <label style="padding: 6px;font-size: 12px">&nbsp;密品入库列表</label>
                                <span style="float:right;padding-right: 5px">
                                            <button id="checkInInsertButton" name="checkInInsertButton"
                                                    class="btn btn-xs btn-success ishow">
                                            <i class="ace-icon fa fa-check"></i>
                                            新增入库</button>
                                            <button id="checkInDeleteButton" name="checkInDeleteButton"
                                                    class="btn btn-xs  btn-danger ishow">
                                            <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                            删除</button>
                                            </span>
                            </div>
                            <tr style="height: 30px;">
                                <th class="center" style="width: 50px">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th width="50px" style="text-align: center">序号</th>
                                <th>单据号</th>
                                <th>接收单位</th>
                                <th>来源单位</th>
                                <th>位置</th>
                                <th>入库时间</th>
                                <th>备注</th>
                                <th>入库状态</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="checkInTable"></tbody>
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
            密品入库列表
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
                                <td>单据号：<input type="text" maxlength="64" id="detailFormBillCode"
                                               onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                </td>
                                <td>
                                    <a style="padding-left: 10px"></a>来源单位：<input type="text"
                                                                                  id="detailFormResDepartmentName"
                                                                                  placeholder=""
                                                                                  readonly="readonly">
                                </td>
                                <td>
                                    <a style="padding-left: 10px"></a>创建时间：<input class="date-picker"
                                                                                  readonly="readonly"
                                                                                  name="detailFormCreateTime"
                                                                                  id="detailFormCreateTime" type="text"
                                                                                  data-date-format="yyyy-mm-dd"/>
                                </td>
                            </tr>
                            <tr>
                                <td>接收人：<select class="chosen-select " id="detailFormDesDepartmentSysUser"
                                                style=" width: 163px;height: 32px;">
                                    <option value=""></option>
                                </select>
                                </td>
                                <td>
                                    <a style="padding-left: 34px"></a>位置：<select class="chosen-select "
                                                                                   id="detailFormLocationId"
                                                                                   style="width: 163px;height: 32px;">
                                    <option value=""></option>
                                </select>
                                </td>
                                <td>
                                    <a style="padding-left: 34px"></a>
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
        <div class="row" style="padding-top: 5px">
            <table class="table table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                    <label style="padding: 6px;font-size: 12px">&nbsp;密品入库列表</label>
                    <span style="float:right;padding-right: 5px">
                                            <button id="detailFormAddProduct" name="detailFormAddProduct"
                                                    class="btn btn-xs btn-success">
                                            <i class="ace-icon fa fa-check"></i>
                                            添加密品</button>
                                            <button id="detailFormDeleteProduct" name="detailFormDeleteProduct"
                                                    class="btn btn-xs  btn-danger">
                                            <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                            删除</button>
                                            </span>
                </div>
                <tr style="height: 30px;">
                    <th class="detailFormSwitchCheckBox center" style="width: 50px">
                        <label class="pos-rel">
                            <input type="checkbox" class="ace"/>
                            <span class="lbl"></span>
                        </label>
                    </th>
                    <th class="detailFormSwitchDetail" style="text-align: center;width: 50px">密件</th>
                    <th class="detailFormSwitchRandomDetail" style="text-align: center;width: 50px">密件</th>
                    <th width="50px" style="text-align: center">序号</th>
                    <th>密件类别</th>
                    <th>密品型号</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>RFID编号</th>
                    <th class="detailFormSwitchInsert">所属系统</th>
                    <th class="detailFormSwitchInsert">备注</th>
                    <th class="detailFormSwitchDetail">入库时间</th>
                    <th class="detailFormSwitchInsert" style="text-align: center;width: 200px">操作</th>
                    <th class="detailFormSwitchConfirm" style="text-align: center;width: 200px">操作</th>

                </tr>
                </thead>
                <tbody id="checkInDetailTable"></tbody>
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
            入库明细
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
                                    来源单位：<input id="itemDetailFormResDepartmentName"
                                                name="itemDetailFormResDepartmentName" type="text" maxlength="64">
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
                        <th>入库时间</th>
                    </tr>
                    </thead>
                    <tbody id="checkInItemDetailTable"></tbody>
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
                <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
                    <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                           border="0">
                        <tr>
                            <td style="padding-left: 24.5px">
                                密件类别：
                                <a style="padding-left: 0px"></a>
                                <select class="chosen-select" id="addFormDictionaryId" name="addFormDictionaryId"
                                        data-placeholder="" style="width: 163px">
                                    <option></option>
                                </select>
                                <a style="padding-left: 20px"></a>
                                密品型号：
                                <a style="padding-left: 0px"></a>
                                <input id="addFormModel"
                                       name="addFormModel" type="text" maxlength="64"
                                       onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                <a style="padding-left: 20px"></a>
                                责任人：
                                <a style="padding-left: 0px"></a>
                                <select class="chosen-select" id="addFormSysUserId" name="addFormSysUserId"
                                        data-placeholder="" style="width: 163px">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 24.5px">
                                出厂编号：
                                <a style="padding-left: 0px"></a>
                                <input id="addFormSerNum"
                                       name="addFormSerNum" type="text" maxlength="64"
                                       onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                <a style="padding-left: 32px"></a>
                                列装号：
                                <a style="padding-left: 0px"></a>
                                <input id="addFormProCode"
                                       name="addFormProCode" type="text" maxlength="11"
                                       onblur="value=value.replace(/[^a-zA-Z0-9\u4e00-\u9fa5]/g,'')">
                                <a style="padding-left: 32px"></a>
                                数量：
                                <a style="padding-left: 0px"></a>
                                <input id="addFormProCodeCount"
                                       name="addFormProCodeCount" type="text" maxlength="64"
                                       onblur="value=value.replace(/[^\d]/g,'')">
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td style="padding-left: 24.5px">
                                所属系统：
                                <a style="padding-left: 0px"></a>
                                <select class="chosen-select" id="addFormApplicationId" name="addFormApplicationId"
                                        data-placeholder="" style="width: 163px">
                                    <option></option>
                                </select>
                                <a style="padding-left: 20px"></a>
                                所属位置：
                                <a style="padding-left: 0px"></a>
                                <select class="chosen-select" id="addFormLocationId" name="addFormLocationId"
                                        data-placeholder="" style="width: 163px">
                                    <option></option>
                                </select>
                                <a style="padding-left: 32px"></a>
                                备注：
                                <a style="padding-left: 0px"></a>
                                <input id="addFormInfo" name="addFormInfo" style="width: 163px;height: 30px;"></input>

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
                    <span style="float:right;padding-right: 5px">
                                        <button id="addFormRandomButton" name="addFormRandomButton"
                                                class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-check"></i>
                                        新增</button>
                                        </span>
                </div>
                <tr style="height: 30px;">
                    <th width="50px" style="text-align: center">序号</th>
                    <th>密件类别</th>
                    <th>位置</th>
                    <th>Rifd编码</th>
                    <th>备注</th>
                    <th style="text-align: center;width: 200px">操作</th>
                </tr>
                </thead>
                <tbody id="addFormRandomTable" class="table  table-bordered table-hover"></tbody>
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
            checkInInitSelectOption();
            function checkInInitSelectOption() {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkIn/checkInInitSelectOption.action",
                    data: {},
                    success: function (result) {
                        var re = JSON.parse(result);

                        dictionaries = re.dictionaries;
                        var dictionariesHtml = "";
                        for (var j = 0; j < dictionaries.length; j++) {
                            dictionariesHtml += "<option value=\"" + dictionaries[j].id + "\">" + dictionaries[j].value + "</option>"
                        }
                        $("#checkInSelectProductDictionaryId").append(dictionariesHtml);
                        $("#addFormRandomDictionaryId").append(dictionariesHtml);
                        $("#addFormDictionaryId").append(dictionariesHtml);

                        applications = re.applications;
                        var applicationsHtml = "";
                        for (var j = 0; j < applications.length; j++) {
                            applicationsHtml += "<option value=\"" + applications[j].id + "\">" + applications[j].name + "</option>"
                        }
                        $("#checkInSelectApplicationId").append(applicationsHtml);
                        $("#addFormApplicationId").append(applicationsHtml);

                        sysusers = re.sysusers;
                        var sysusersHtml = "";
                        for (var j = 0; j < sysusers.length; j++) {
                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                        }
                        $("#addFormSysUserId").append(sysusersHtml);

                        locations = re.locations;
                        var locationsHtml = "";
                        for (var j = 0; j < locations.length; j++) {
                            locationsHtml += "<option value=\"" + locations[j].id + "\">" + locations[j].locinfo + "</option>"
                        }
                        $("#checkInSelectLocationId").append(locationsHtml);
                        $("#addFormRandomLocationId").append(locationsHtml);
                        $("#addFormLocationId").append(locationsHtml);
                        $("#detailFormLocationId").append(locationsHtml);
                    },
                    error: function (result) {
                        layer.msg('组织机构新增选项获取错误！', {time: 1000});
                    }
                });
            }

            function changeSelectLocationId(nodeid) {
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkIn/checkInInitSelectOption.action",
                    traditional: true,
                    data: {
                        "deptNodeid": nodeid
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        deptLocations = re.deptLocations;
                        var locationsHtml = "";
                        for (var j = 0; j < deptLocations.length; j++) {
                            locationsHtml += "<option value=\"" + deptLocations[j].id + "\">" + deptLocations[j].locinfo + "</option>"
                        }
                        $("#detailFormLocationId").children().remove();
                        $("#detailFormLocationId").append(locationsHtml);

                    }
                });
            }

            //表格数据初始化
            checkInSelect();
            //查询入库单按钮
            $('#checkInSelectButton').on('click', function () {
                checkInSelect(this);
            });
            var checkInList;
            var startTime;
            var endTime;

            function checkInSelect() {
                var productDictionaryId = $('#checkInSelectProductDictionaryId').val();
                var productModel = $('#checkInSelectProductModel').val();
                var applicationId = $('#checkInSelectApplicationId').val();
                var locationId = $('#checkInSelectLocationId').val();
                var data = $("#id-date-range-picker-1").val();
                startTime = data.substring(0, 10);
                endTime = data.substring(13, 23);
                var result = $('#checkInSelectStatus').val();
                var pageIndex = 1;
                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkIn/select.action",
                    traditional: true,
                    data: {
                        "checkinbill": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "productDictionaryId": productDictionaryId,
                                "productModel": productModel,
                                "applicationId": applicationId,
                                "locationId": locationId,
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
                        checkInList = re.list;
                        var checkInHtml = "";

                        for (var a = 0; a < checkInList.length; a++) {
                            var page = (re.pageIndex - 1) * 10 + a + 1;
                            var billCode = checkInList[a].billCode == null ? "" : checkInList[a].billCode;
                            var desDepartmentName = checkInList[a].desDepartmentName == null ? "" : checkInList[a].desDepartmentName;
                            var resDepartmentName = checkInList[a].resDepartmentName == null ? "" : checkInList[a].resDepartmentName;
                            var locationLocInfo = checkInList[a].locationLocInfo == null ? "" : checkInList[a].locationLocInfo;
                            var updateTime="";
                            if(checkInList[a].result=="1"){
                                updateTime = checkInList[a].updateTime == null ? "" : checkInList[a].updateTime;
                            }
                            var info = checkInList[a].info == null ? "" : checkInList[a].info;
                            checkInHtml +=
                                "<tr> " +
                                "<td class='center'>" +
                                " <label class='pos-rel'> " +
                                "<input type='checkbox' class='ace'/> " +
                                "<span class='lbl'></span> " +
                                "</label> " +
                                "</td> " +
                                "<td>" + page + "</td> " +
                                "<td>" + billCode + "</td> " +
                                "<td>" + desDepartmentName + "</td> " +
                                "<td>" + resDepartmentName + "</td> " +
                                "<td>" + locationLocInfo + "</td> " +
                                "<td>" + updateTime + "</td> " +
                                "<td>" + info + "</td> ";
                            if (checkInList[a].result == ("0")) {
                                checkInHtml += "<td>未完成</td> "
                            } else if (checkInList[a].result == ("1")) {
                                checkInHtml += "<td>已完成</td> "
                            }
                            checkInHtml +=
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>" +
                                "<a style='cursor:pointer;text-decoration:none' class='checkInDetail ' value='" + a + "'> 查看 </a> ";
                            if (checkInList[a].dictionaryId == ("6")) {
                                checkInHtml +=
                                    "<a style='cursor:pointer;text-decoration:none' class='checkInDelete ishow' value='" + a + "'>| 删除 </a> ";
                            }
                            if (checkInList[a].result == ("0")) {
                                checkInHtml +=
                                    "<a style='cursor:pointer;text-decoration:none' class='checkInConfirm ishow' value='" + a + "'>| 确认 </a> ";
                            }
                            checkInHtml +=
                                "<a style='cursor:pointer;text-decoration:none' class='checkInUpdate ishow' value='" + a + "'>| 发标签 </a> " +
                                "</span>" +
                                "</td> " +
                                "</tr>"
                        }
                        $("#checkInTable").empty();
                        $("#checkInTable").append(checkInHtml);
                        QuanXian();
                        if (checkInList.length == 0) {
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
                                    url: "/checkIn/select.action",
                                    data: {
                                        "checkinbill": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "productDictionaryId": productDictionaryId,
                                                "productModel": productModel,
                                                "applicationId": applicationId,
                                                "locationId": locationId,
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
                                        checkInList = re.list;
                                        var checkInHtml = "";

                                        for (var a = 0; a < checkInList.length; a++) {
                                            var page = (re.pageIndex - 1) * 10 + a + 1
                                            var billCode = checkInList[a].billCode == null ? "" : checkInList[a].billCode;
                                            var desDepartmentName = checkInList[a].desDepartmentName == null ? "" : checkInList[a].desDepartmentName;
                                            var resDepartmentName = checkInList[a].resDepartmentName == null ? "" : checkInList[a].resDepartmentName;
                                            var locationLocInfo = checkInList[a].locationLocInfo == null ? "" : checkInList[a].locationLocInfo;
                                            var updateTime="";
                                            if(checkInList[a].result=="1"){
                                                updateTime = checkInList[a].updateTime == null ? "" : checkInList[a].updateTime;
                                            }
                                            var info = checkInList[a].info == null ? "" : checkInList[a].info;
                                            checkInHtml +=
                                                "<tr> " +
                                                "<td class='center'>" +
                                                " <label class='pos-rel'> " +
                                                "<input type='checkbox' class='ace'/> " +
                                                "<span class='lbl'></span> " +
                                                "</label> " +
                                                "</td> " +
                                                "<td>" + page + "</td> " +
                                                "<td>" + billCode + "</td> " +
                                                "<td>" + desDepartmentName + "</td> " +
                                                "<td>" + resDepartmentName + "</td> " +
                                                "<td>" + locationLocInfo + "</td> " +
                                                "<td>" + updateTime + "</td> " +
                                                "<td>" + info + "</td> ";
                                            if (checkInList[a].result == ("0")) {
                                                checkInHtml += "<td>未完成</td> "
                                            } else if (checkInList[a].result == ("1")) {
                                                checkInHtml += "<td>已完成</td> "
                                            }
                                            checkInHtml +=
                                                "<td style='text-align: center;color: #2283C5;'> " +
                                                "<span>" +
                                                "<a style='cursor:pointer;text-decoration:none' class='checkInDetail isishow' value='" + a + "'> 查看 </a> ";
                                            if (checkInList[a].dictionaryId == ("6")) {
                                                checkInHtml +=
                                                    "<a style='cursor:pointer;text-decoration:none' class='checkInDelete isishow' value='" + a + "'>| 删除 </a> ";
                                            }
                                            if (checkInList[a].result == ("0")) {
                                                checkInHtml +=
                                                    "<a style='cursor:pointer;text-decoration:none' class='checkInConfirm isishow' value='" + a + "'>| 确认 </a> ";
                                            }
                                            checkInHtml +=
                                                "<a style='cursor:pointer;text-decoration:none' class='checkInUpdate isishow' value='" + a + "'>| 发标签 </a> " +
                                                "</span>" +
                                                "</td> " +
                                                "</tr>"
                                        }
                                        $("#checkInTable").empty();
                                        $("#checkInTable").append(checkInHtml);
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
            $('#checkInCleanButton').on('click', function () {
                checkInClean();
            });
            function checkInClean() {
                $('#checkInSelectProductDictionaryId').val("");
                $('#checkInSelectProductModel').val("");
                $('#checkInSelectApplicationId').val("");
                $('#checkInSelectStatus').val("");
                $('#checkInSelectLocationId').val("");
                $("#id-date-range-picker-1").val("");
            }

            //组织机构树形弹窗按钮
            $('#detailFormResDepartmentName').on('click', function () {
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
                        $("#detailFormResDepartmentName").val(nodes.nodetext)
                    },
                    btn2: function (index) {
                        nodes = {
                            nodeid: null,
                            nodetext: null
                        }
                        $("#detailFormResDepartmentName").val("")

                        layer.close(index);
                    },
                    cancel: function (index) {
                        nodes = {
                            nodeid: null,
                            nodetext: null
                        }
                        $("#detailFormResDepartmentName").val("")

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

            //注册入库
            $('#checkInInsertButton').on('click', function () {
                checkInInsert(this);
            });
            function checkInInsert() {
                $("#detailFormBillCode").val("");
                $("#detailFormResDepartmentName").val("");
                $("#detailFormLocationId").val("");
                $("#detailFormDesDepartmentSysUser").children().remove();

                var sysusersHtml = "<option value=\"\"></option>";
                for (var j = 0; j < sysusers.length; j++) {
                    sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                }

                $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                $("#detailFormInfo").val("");
                $("#detailFormBillCode").attr("disabled", false);
                $("#detailFormResDepartmentName").attr("disabled", false);
                $("#detailFormDesDepartmentSysUser").attr("disabled", false);
                $("#detailFormLocationId").attr("disabled", false);
                $("#detailFormInfo").attr("disabled", false);
                var today = new Date();
                $("#detailFormCreateTime").val(getNowFormatDate(today));
                $("#detailFormCreateTime").attr("disabled", true);
                checkInInsertRefresh();
                $("#detailFormAddProduct").show();
                $("#detailFormDeleteProduct").show();
                $("#data-pagination-detail").hide();
                layer.open({
                    type: 1,
                    title: '新增入库',
                    shadeClose: false,
                    offset: '0px',
                    area: ['100%', '100%'],
                    content: $('#detailForm'),
                    btn: ['保存', '关闭'],
                    btnAlign: 'c', //按钮居中
                    yes: function () {
                        layer.confirm(
                            "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认入库？</div>",
                            function (index) {
                                var detailFormBillCode = $("#detailFormBillCode").val();
                                var detailFormResDepartmentId = nodes.nodeid;
                                var detailFormDesDepartmentSysUser = $("#detailFormDesDepartmentSysUser").val();
                                var detailFormLocationId = $("#detailFormLocationId").val();
                                var detailFormInfo = $("#detailFormInfo").val();
                                if (detailFormResDepartmentId == null || detailFormResDepartmentId == "") {
                                    layer.msg('来源单位为空', {time: 1000});
                                    return;
                                }
                                if (detailFormDesDepartmentSysUser == null || detailFormDesDepartmentSysUser == "") {
                                    layer.msg('接收人为空', {time: 1000});
                                    return;
                                }
                                if (detailFormLocationId == null || detailFormLocationId == "") {
                                    layer.msg('位置为空', {time: 1000});
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
                                    url: "/checkIn/insert.action",
                                    traditional: true,
                                    data: {
                                        "checkin": JSON.stringify({
                                            "checkinbillitemList": addFormEntity, "checkinbill": {
                                                "billCode": detailFormBillCode,
                                                "resDepartmentId": detailFormResDepartmentId,
                                                "sysuserId": detailFormDesDepartmentSysUser,
                                                "locationId": detailFormLocationId,
                                                "info": detailFormInfo
                                            }
                                        })
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result)
                                        if (re.status == ("true")) {
                                            layer.msg(re.msg, {time: 1000});
                                            checkInClean();
                                            checkInSelect();
                                            addFormEntity = [];
                                            checkInDetailList = [];
                                            $("#checkInDetailTable").empty();
                                            layer.closeAll();
                                        } else if (re.status == ("false")) {
                                            layer.msg(re.msg, {time: 1000});
                                        }
                                    },
                                    error: function () {
                                        layer.msg('新增入库异常', {time: 1000});
                                    }
                                });
                            });
                    },
                    btn2: function () {
                        layer.closeAll();
                    },
                    success: function () {
                        $(".detailFormSwitchInsert").show();
                        $(".detailFormSwitchCheckBox").show();
                        $(".detailFormSwitchDetail").hide();
                        $(".detailFormSwitchRandomDetail").show();
                        $(".detailFormSwitchConfirm").hide();
                    }
                });
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
                layer.open({
                    type: 1,
                    title: '新增入库',
                    shadeClose: false,
                    offset: '0px',
                    area: ['100%', '100%'],
                    content: $('#addForm'),
                    btn: ['保存', '关闭'],
                    btnAlign: 'c', //按钮居中
                    yes: function (index) {
                        addFormDictionaryId = $("#addFormDictionaryId").val();
                        addFormModel = $("#addFormModel").val();
                        addFormSysUserId = $("#addFormSysUserId").val();
                        addFormSerNum = $("#addFormSerNum").val();
                        addFormProCode = $("#addFormProCode").val();
                        addFormProCodeCount = $("#addFormProCodeCount").val();
                        addFormLocationId = $("#addFormLocationId").val();
                        if (addFormDictionaryId == null || addFormDictionaryId == "") {
                            layer.msg('密件类别为空', {time: 1000});
                            return;
                        }
                        if (addFormModel == null || addFormModel == "") {
                            layer.msg('密品型号为空', {time: 1000});
                            return;
                        }
                        if (addFormSysUserId == null || addFormSysUserId == "") {
                            layer.msg('责任人为空', {time: 1000});
                            return;
                        }
                        if (addFormSerNum == null || addFormSerNum == "") {
                            layer.msg('出厂编号起始值为空', {time: 1000});
                            return;
                        }
                        if (addFormProCode == null || addFormProCode == "") {
                            layer.msg('列装号起始值为空', {time: 1000});
                            return;
                        }
                        if (addFormProCodeCount == null || addFormProCodeCount == "") {
                            layer.msg('数量为空', {time: 1000});
                            return;
                        }
                        if (addFormLocationId == null || addFormLocationId == "") {
                            layer.msg('所属位置为空', {time: 1000});
                            return;
                        }

                        for (var i = 0; i < addFormProCodeCount; i++) {
                            var addFormSerNumLast = addFormSerNum.substr(addFormSerNum.length - 1, 1);
                            if (addFormSerNumLast.match(/\d+/gi) == null) {
                                layer.msg('出厂编号起始值不合法', {time: 1000});
                                return;
                            }
                            var addFormSerNum1 = reverseAdd(addFormSerNum, i);

                            var addFormProCodeLast = addFormProCode.substr(addFormProCode.length - 4, 4);
                            if (addFormProCode.length != 11 || addFormProCodeLast.match(/\d+/gi)[0].length != 4) {
                                layer.msg('列装号起始值不合法', {time: 1000});
                                return;
                            }
                            var addFormProCode1 = reverseAdd(addFormProCode, i);
                            var mijiantable = $("#addFormRandomTable").find("tr");//获取密件的信息
                            var addFormRandomList = [];
                            for (j = 0; j < mijiantable.length; j++) {
                                var addFormRandomDictionaryId = mijiantable.eq(j).find("td").eq(1).attr("value");
                                var addFormRandomDictionaryText = mijiantable.eq(j).find("td").eq(1).text();
                                var addFormRandomLocationId = mijiantable.eq(j).find("td").eq(2).attr("value");
                                var addFormRandomLocationText = mijiantable.eq(j).find("td").eq(2).text();
                                var addFormRandomRfidCode = mijiantable.eq(j).find("td").eq(3).text();
                                var addFormRandomInfo = mijiantable.eq(j).find("td").eq(4).text();
                                var mijian = {
                                    addFormRandomDictionaryId: addFormRandomDictionaryId,
                                    addFormRandomDictionaryText: addFormRandomDictionaryText,
                                    addFormRandomLocationId: addFormRandomLocationId,
                                    addFormRandomLocationText: addFormRandomLocationText,
                                    addFormRandomRfidCode: addFormRandomRfidCode,
                                    addFormRandomInfo: addFormRandomInfo
                                };
                                addFormRandomList[addFormRandomList.length] = mijian;
                            }
                            addFormEntity[addFormEntity.length] = {
                                "addFormDictionaryId": $("#addFormDictionaryId").val(),
                                "addFormDictionaryText": $("#addFormDictionaryId").find("option:selected").text(),
                                "addFormModel": $("#addFormModel").val(),
                                "addFormApplicationId": $("#addFormApplicationId").val(),
                                "addFormApplicationText": $("#addFormApplicationId").find("option:selected").text(),
                                "addFormLocationId": $("#addFormLocationId").val(),
                                "addFormLocationText": $("#addFormLocationId").find("option:selected").text(),
                                "addFormSysUserId": $("#addFormSysUserId").val(),
                                "addFormSysUserText": $("#addFormSysUserId").find("option:selected").text(),
                                "addFormProCode": addFormProCode1,
                                "addFormSerNum": addFormSerNum1,
                                "addFormRfidCode": "",
                                "addFormInfo": $("#addFormInfo").val(),
                                "addFormRandomList": addFormRandomList
                            }
//                            createJson(addFormEntity[addFormEntity.length-1],"addFormRandomList",addFormRandomList);
                            addFormRandomList = [];
                        }
                        $("#addFormRandomTable").empty();
                        checkInInsertRefresh();
                        layer.close(index);
                    },
                    btn2: function (index) {
                        layer.close(index);
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

            function reverseAdd(str, add) {
                var strReverse = str.split('').reverse().join('');
                if (strReverse.match(/\d+/gi) == null)return false;
                var numReverse = strReverse.match(/\d+/gi)[0];
                var num = numReverse.split('').reverse().join('');
                var sum = parseInt(num) + parseInt(add);
                var addZero = numReverse.length - (sum + "").length;
                for (var a = 0; a < addZero; a++)sum = "0" + sum;
                return str.substring(0, str.length - num.length) + sum;
            }

            //刷新新增入库列表
            function checkInInsertRefresh() {
                $(".detailFormSwitchRandomDetail").show();
                var checkInHtml = "";
                for (var a = 0; a < addFormEntity.length; a++) {
                    var index = a + 1;
                    var ProCode = addFormEntity[a].addFormProCode
                    checkInHtml +=
                        "<tr> " +
                        "<td class=' detailFormSwitchCheckBox center'>" +
                        " <label class='pos-rel'> " +
                        "<input type='checkbox' class='ace'/> " +
                        "<span class='lbl'></span> " +
                        "</label> " +
                        "</td> ";
                    if (addFormEntity[a] != null && addFormEntity[a].addFormRandomList.length != 0) {
                        checkInHtml +=
                            "<td class='center'>" +
                            "<div class='action-buttons'>" +
                            "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                            "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                            "<span class='sr-only'>详情</span>" +
                            "</a>" +
                            "</div>" +
                            "</td>";
                    } else {
                        checkInHtml +=
                            "<td class='center'>" +
                            "</td>";
                    }
                    checkInHtml +=
                        "<td>" + index + "</td> " +
                        "<td>" + addFormEntity[a].addFormDictionaryText + "</td> " +
                        "<td>" + addFormEntity[a].addFormModel + "</td> " +
                        "<td>" + ProCode + "</td> " +
                        "<td>" + addFormEntity[a].addFormSerNum + "</td> ";

                    var addFormRfidCode = addFormEntity[a].addFormRfidCode;
                    if (addFormRfidCode != null) {
                        checkInHtml +=
                            "<td>" + addFormRfidCode + "</td> ";
                    } else {
                        checkInHtml +=
                            "<td>" + "" + "</td> ";
                    }
                    checkInHtml +=
                        "<td>" + addFormEntity[a].addFormApplicationText + "</td> " +
                        "<td>" + addFormEntity[a].addFormInfo + "</td> " +
                        "<td style='text-align: center;color: #2283C5;'> " +
                        "<span>" +
                        "<a style='cursor:pointer;text-decoration:none' class='checkInItemDetail' value='" + a + "'> 查看 </a> " +
                        "|<a style='cursor:pointer;text-decoration:none' class='checkInItemDelete' value='" + a + "'> 删除 </a> " +
                        "|<a style='cursor:pointer;text-decoration:none' class='mipinRfid' value='" + a + "'> 发标签 </a> " +
                        "</span>" +
                        "</td> " +
                        "</tr>"
                    if (addFormEntity[a] != null && addFormEntity[a].addFormRandomList.length != 0) {
                        checkInHtml += "<tr class='detail-row' type='1'>" +
                            "<td colspan='12'>" +
                            "<div class='table-detail'>" +
                            "<div class='row'>" +
                            "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                            "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                        $.each(addFormEntity[a].addFormRandomList, function (index, item) {
                            var id = item.id;
                            var rfidCode = "";
                            if (item.addFormRandomRfidCode != null) {
                                rfidCode = item.addFormRandomRfidCode;
                            }
                            var info = "";
                            if (item.addFormRandomInfo != null) {
                                info = item.addFormRandomInfo;
                            }
                            checkInHtml += "<tr style='height: 30px' type='2'>" +
                                "<td class='detailFormSwitchCheckBox' >" +
                                "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                "<td hidden=hidden >" + id + "</td>" +
                                "<td style='width:3.5%;min-width:40px'>类别：</td>" +
                                "<td>" + item.addFormRandomDictionaryText + "</td>" +
                                "<td style='width:5.5%;min-width:80px'>RFID编码：</td>" +
                                "<td style='width:25%'>" + rfidCode + "</td>" +
                                "<td hidden=hidden >" + ProCode + "</td>" +
                                "<td style='width:3.5%;min-width:40px'>备注：</td>" +
                                "<td style='width:25%'>" + info + "</td>" +
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>" +
                                "<a style='cursor:pointer;text-decoration:none' class='mipinRandomRfid' value='" + a + "," + index + "'> 发标签 </a> " +
                                "</span>" +
                                "</td> " +
                                "</tr>";
                        })
                        checkInHtml +=
                            "</table>" +
                            "</div>" +
                            "</div>" +
                            "</td>" +
                            "</tr>"
                    }
                }

                $("#checkInDetailTable").empty();
                $("#checkInDetailTable").append(checkInHtml);
                //查看密品详情的密件
                $(document).off("click", ".checkInItemDetailInDatabase");
                $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
                    e.preventDefault();
                    $(this).closest('tr').next().toggleClass('open');
                    $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                });
                $(document).off("click", ".mipinRfid");
                $(document).on("click", ".mipinRfid", function () {
                    var id = $(this).attr("value");
                    var type = $(this).parent().parent().parent().find("td").eq(3).text();//U盘、光盘类型
                    var proCode = $(this).parent().parent().parent().find("td").eq(5).text();
                    var td = $(this).parent().parent().parent().find("td").eq(7);
                    readcardNotInsert(id, type, proCode, td);
                })
                $(document).off("click", ".mipinRandomRfid");
                $(document).on("click", ".mipinRandomRfid", function () {
                    var id = $(this).attr("value");
                    var type = $(this).parent().parent().parent().find("td").eq(4).text();//U盘、光盘类型
                    var proCode = $(this).parent().parent().parent().find("td").eq(9).text();
                    var td = $(this).parent().parent().parent().find("td").eq(6);
                    readcardNotInsert(id, type, proCode, td);
                })
            }

            function readcard(id, type, proCode, td) {
                var msg = "readcard";
                var qsData = {"msg": msg, "context": "rfid"};
                $.ajax({
                    async: false,
                    url: 'http://127.0.0.1:5678/readcard',
                    type: 'post',
                    dataType: 'jsonp',
                    jsonp: 'jsoncallback',
                    data: qsData,
                    success: function (data) {
                        var epc = data;
                        if (epc != "") {
                            var biaoqianType = epc.substr(1, 2);
                            if (biaoqianType == "00") {
                                biaoqianType = "文件"
                            }
                            else if (biaoqianType == "10") {
                                biaoqianType = "UKey"
                            }
                            else if (biaoqianType == "20") {
                                biaoqianType = "光盘"
                            }
                            else if (biaoqianType == "30") {
                                biaoqianType = "设备"
                            }
                            else if (biaoqianType == "40") {
                                biaoqianType = "网卡"
                            }
                            if (type != biaoqianType) {
                                var text = "该密件类别与标签不匹配,请选用 [" + type + "] 标签";
                                layer.msg(text);
                            }
                            else {
                                var text = "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'>标签：" + epc + "</div>" +
                                    "<div style='text-align:center;font-size:12px;font-family: '微软雅黑'> 是否绑定给： " + proCode + " </div>";
                                layer.confirm(text,
                                    function () {
                                        var product = {
                                            id: id,
                                            rfidCode: epc
                                        }
                                        rfidUpdate(product, td);
                                    }
                                );
                            }
                        }
                        else {
                            layer.msg("请放好标签", {time: 1000});
                        }
                    },
                    error: function (xhr) {
                        epc = "";
                    },
                    complete: function (XMLHttpRequest, textStatus) {
                    }
                });
            }

            //提交标签注册
            function rfidUpdate(product, td) {
                layer.load(2, {time: 1000});
                $.ajax({
                    type: "post",
                    url: "/product/rfidUpdate.action",
                    dataType: "json",
                    traditional: true,
                    data: {
                        "product": JSON.stringify(product)
                    },
                    success: function (re) {

                        if (re.status == "true") {
                            layer.msg("标签绑定成功！", {time: 1000});
                            td.text(product.rfidCode);
                        } else if (re.status == "false") {
                            layer.msg(re.msg, {time: 2000});
                        }
                    },
                    error: function (result) {
                        layer.msg('绑定异常！', {time: 1000});
                    }
                });
            }

            function readcardNotInsert(id, type, proCode, td) {
                var msg = "readcard";
                var qsData = {"msg": msg, "context": "rfid"};
                $.ajax({
                    async: false,
                    url: 'http://127.0.0.1:5678/readcard',
                    type: 'post',
                    dataType: 'jsonp',
                    jsonp: 'jsoncallback',
                    data: qsData,
                    success: function (data) {
                        var epc = data;
                        if (epc != "") {
                            var biaoqianType = epc.substr(1, 2);
                            if (biaoqianType == "00") {
                                biaoqianType = "文件"
                            }
                            else if (biaoqianType == "10") {
                                biaoqianType = "UKey"
                            }
                            else if (biaoqianType == "20") {
                                biaoqianType = "光盘"
                            }
                            else if (biaoqianType == "30") {
                                biaoqianType = "设备"
                            }
                            else if (biaoqianType == "40") {
                                biaoqianType = "网卡"
                            }
                            if (type != biaoqianType) {
                                var text = "该密件类别与标签不匹配,请选用 [" + type + "] 标签";
                                layer.msg(text);
                            }
                            else {
                                for (var i = 0; i < addFormEntity.length; i++) {
                                    if (addFormEntity[i].addFormRfidCode == epc) {
                                        var text = "标签编号[" + epc + "]已存在";
                                        layer.msg(text);
                                        return;
                                    }
                                    for (var j = 0; j < addFormEntity[i].addFormRandomList.length; j++) {
                                        if (addFormEntity[i].addFormRandomList[j].addFormRandomRfidCode == epc) {
                                            var text = "标签编号[" + epc + "]已存在";
                                            layer.msg(text);
                                            return;
                                        }
                                    }
                                }
                                var text = "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'>标签：" + epc + "</div>" +
                                    "<div style='text-align:center;font-size:12px;font-family: '微软雅黑'> 是否绑定给： " + proCode + " ？</div>";
                                layer.confirm(text,
                                    function () {
                                        var product = {
                                            id: id,
                                            rfidCode: epc
                                        }
                                        rfidSelect(product, td);
                                    }
                                );
                            }
                        }
                        else {
                            layer.msg("请放好标签", {time: 1000});
                        }
                    },
                    error: function (xhr) {
                        epc = "";
                    },
                    complete: function (XMLHttpRequest, textStatus) {
                    }
                });
            }

            //提交标签注册
            function rfidSelect(product, td) {
                layer.load(2, {time: 1000});
                $.ajax({
                    type: "post",
                    url: "/product/rfidSelect.action",
                    dataType: "json",
                    traditional: true,
                    data: {
                        "product": JSON.stringify(product)
                    },
                    success: function (re) {

                        if (re.status == "true") {
                            layer.msg("标签绑定成功！", {time: 1000});
                            var ij = product.id.split(",");
                            var ii = ij[0];
                            var jj = ij[1];
                            var addRfidCode = product.rfidCode;
                            if (jj == null) {
                                addFormEntity[ii].addFormRfidCode = product.rfidCode;
                            }
                            else {
                                addFormEntity[ii].addFormRandomList[jj].addFormRandomRfidCode = addRfidCode;
                            }
//                            checkInInsertRefresh();
                            td.text(product.rfidCode);
                        } else if (re.status == "false") {
                            layer.msg(re.msg, {time: 2000});
                        }
                    },
                    error: function (result) {
                        layer.msg('绑定异常！', {time: 1000});
                    }
                });
            }


            //查看新增入库列表的具体密品信息
            $(document).on("click", ".checkInItemDetail", function () {
                checkInItemDetail(this);
            });
            function checkInItemDetail(op) {
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
                $("#addFormProCodeCount").val("1");
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
                var checkInRandomHtml = "";
                for (var i = 0; i < option.addFormRandomList.length; i++) {
                    var index = i + 1
                    checkInRandomHtml +=
                        "<tr> " +
                        "<td>" + index + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomDictionaryText + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomLocationText + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomRfidCode + "</td> " +
                        "<td>" + option.addFormRandomList[i].addFormRandomInfo + "</td> " +
                        "<td style='text-align: center;color: #2283C5;'> " +
                        "<span>" +
                        "</span>" +
                        "</td> " +
                        "</tr>"
                }
                $("#addFormRandomTable").empty();
                $("#addFormRandomTable").append(checkInRandomHtml);

                layer.open({
                    type: 1,
                    title: '查看密品信息',
                    shadeClose: false,
                    offset: '0px',
                    area: ['100%', '100%'],
                    content: $('#addForm'),
                    btn: ['确定'],
                    btnAlign: 'c', //按钮居中
                    yes: function (index) {
                        layer.close(index);
                    },
                    cancel: function (index) {
                        layer.close(index);
                    }
                });

            }

            //删除新增入库列表的密品
            $(document).on("click", ".checkInItemDelete", function () {
                checkInItemDelete(this);
            });
            function checkInItemDelete(op) {
//                var option = addFormEntity[op.getAttribute("value")];
                layer.confirm(
                    "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",
                    function (index) {
                        addFormEntity.splice(op.getAttribute("value"), 1);
                        checkInInsertRefresh();
                        layer.close(index);
                    });
            }

            //批量删除新增入库列表的密品
            $('#detailFormDeleteProduct').on('click', function () {
                layer.confirm(
                    "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",

                    function (index) {
                        var trs = $("#checkInDetailTable").find("tr");

                        var rows = [];//被选中的数据Id
                        var count = 0;
                        trs.each(function (index, item) {
                            var check = $("#checkInDetailTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');//判断是否选中
                            if (check[0].checked == true) {
                                rows[count++] = $("#checkInDetailTable").find("tr").eq(index).find("td").eq(1).text();
                            }
                        });
                        for (var a = rows.length; a > 0; a--) {
                            addFormEntity.splice(parseInt(rows[a - 1]) - 1, 1);
                        }
                        checkInInsertRefresh();
                        layer.close(index);
                    });
            });

            //密品入库列表确认
            $(document).on("click", ".checkInConfirm", function () {
                var option = checkInList[this.getAttribute("value")];
                checkInConfirm(option.id, 'open');
            });
            function checkInConfirm(id, isOpen) {
                var pageIndex = 1;
                $("#detailFormAddProduct").hide();
                $("#detailFormDeleteProduct").hide();
                $("#data-pagination-detail").show();

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkIn/select.action",
                    traditional: true,
                    data: {
                        "checkinbillitem": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "checkinbillId": id
                            }
                            }
                        ),
                        "isDetail": "2"
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        var checkInDetailList = re.p.list;
                        var productList = re.checkinbillitemSelectList;
                        var checkInHtml = "";
                        if (checkInDetailList.length == 0) {
                            layer.msg('订单详情为空', {time: 1000});
                            return;
                        }
                        $("#detailFormBillCode").val(checkInDetailList[0].billCode);
                        $("#detailFormResDepartmentName").val(checkInDetailList[0].desDepartmentName);
                        $("#detailFormCreateTime").val(checkInDetailList[0].createTime);

                        $("#detailFormDesDepartmentSysUser").children().remove();
                        var sysusersHtml = "<option value=\"" +
                            checkInDetailList[0].desDepartmentSysUserId +
                            "\">" +
                            checkInDetailList[0].desDepartmentSysUser +
                            "</option>";
//                        for (var j = 0; j < sysusers.length; j++) {
//                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
//                        }
                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
//                        $("[id='detailFormDesDepartmentSysUser']").val(checkInDetailList[0].desDepartmentSysUserId);
//                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkInDetailList[0].desDepartmentSysUser);

                        $("#detailFormInfo").val(checkInDetailList[0].info);
                        $("#detailFormBillCode").attr("disabled", true);
                        $("#detailFormResDepartmentName").attr("disabled", true);
                        $("#detailFormCreateTime").attr("disabled", true);
                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                        $("#detailFormLocationId").attr("disabled", false);
                        $("#detailFormInfo").attr("disabled", true);
                        for (var a = 0; a < checkInDetailList.length; a++) {
                            var mijianList = new Array();//密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < productList.length; j++) {
                                if (productList[j].productProductId != null && productList[j].productProductId == checkInDetailList[a].productId) {
                                    mijianList.push(productList[j]);
                                }
                            }
                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                            if(checkInDetailList[a].status=="1"){
                                checkInHtml +=
                                    "<tr> ";
                            }else{
                                checkInHtml +=
                                    "<tr style='background-color:lightgray'> ";
                            }
                            if (mijianList.length != 0) {
                                checkInHtml +=
                                    "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>详情</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            } else {
                                checkInHtml +=
                                    "<td class='center'>" +
                                    "</td>";
                            }
                            checkInHtml +=
                                "<td>" + page + "</td> " +
                                "<td hidden=hidden>" + checkInDetailList[a].id + "</td> " +
                                "<td>" + checkInDetailList[a].productDictionaryValue + "</td> " +
                                "<td>" + checkInDetailList[a].productModel + "</td> " +
                                "<td>" + checkInDetailList[a].productProCode + "</td> " +
                                "<td>" + checkInDetailList[a].productSerNum + "</td> " +
                                "<td>" + checkInDetailList[a].productRfidCode + "</td> " +
                                "<td>" + checkInDetailList[a].checkinTime + "</td> " +
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>";
                            if(checkInDetailList[a].status=="1"){
                                if (checkInDetailList[a].checkinTime == "") {
                                    checkInHtml += "<a style='cursor:pointer;text-decoration:none' class='checkInConfirmButton' value='" + checkInDetailList[a].id + "'> 确认入库 </a>";
                                } else {
                                    checkInHtml += "<a style='cursor:pointer;text-decoration:none' value='" + checkInDetailList[a].id + "'> 已入库 </a>";
                                }
                            }
                            checkInHtml += "</span>" +
                                "</td> " +
                                "</tr>";
                            if (mijianList.length != 0) {
                                checkInHtml += "<tr class='detail-row' type='1'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                $.each(mijianList, function (index, item) {
                                    var id = item.id;
                                    var rfidCode = "";
                                    if (item.productRfidCode != null) {
                                        rfidCode = item.productRfidCode;
                                    }
                                    checkInHtml += "<tr style='height: 30px' type='2'>" +
                                        "<td class='detailFormSwitchCheckBox' >" +
                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >" + id + "</td>" +
                                        "<td style='padding-left: 20px'>" + " 类别 ：" + item.productDictionaryValue + "</td>" +
                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                        "<td style='text-align: center;color: #2283C5;'> " +
                                        "<span>";
                                    if (item.checkinTime == "") {
                                        checkInHtml += "<a style='cursor:pointer;text-decoration:none' class='checkInConfirmButton' value='" + item.id + "'> 确认入库 </a>";
                                    } else {
                                        checkInHtml += "<a style='cursor:pointer;text-decoration:none' value='" + item.id + "'> 已入库 </a>";
                                    }
                                    checkInHtml += "</span>" +
                                        "</td> " +
                                        "</tr>";
                                })
                                checkInHtml +=
                                    "</table>" +
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                        }
                        $("#checkInDetailTable").empty();
                        $("#checkInDetailTable").append(checkInHtml);

                        //入库确认
                        $(document).off("click", ".checkInConfirmButton");
                        $(document).on("click", ".checkInConfirmButton", function () {
                            var detailFormLocationId = $("#detailFormLocationId").val();
                            if (detailFormLocationId == "") {
                                layer.msg('未选择位置！', {time: 1000});
                                return;
                            }
                            id = $(this).attr("value");
                            layer.confirm(
                                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认入库？</div>",
                                function (index) {
                                    layer.load(2, {time: 1000});
                                    $.ajax({
                                        type: "post",
                                        dataType: "html",
                                        url: "/checkIn/update.action",
                                        traditional: true,
                                        data: {
                                            "checkin": JSON.stringify({
                                                "checkinbillitemList": [{
                                                    "id": id,
                                                    "result": "1"
                                                }],
                                                "checkinbill": {
                                                    "id": checkInDetailList[0].checkinbillId,
                                                    "locationId": detailFormLocationId
                                                }
                                            })
                                        },
                                        success: function (result) {
                                            re = JSON.parse(result);
                                            if (re.status == ("true")) {
                                                layer.msg(re.msg, {time: 1000});
                                                layer.close(index);
                                                checkInConfirm(re.data.checkinbillitemList[0].checkinbillId, 'notOpen');
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
                        $(document).off("click", ".checkInItemDetailInDatabase");
                        $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                        if (isOpen == 'open')
                            layer.open({
                                type: 1,
                                title: '入库单确认',
                                shadeClose: false,
                                offset: '0px',
                                area: ['100%', '100%'],
                                content: $('#detailForm'),
                                btn: ['关闭'],
                                btnAlign: 'c', //按钮居中
                                yes: function () {
                                    checkInSelect();
                                    layer.closeAll();
                                },
                                success: function () {
                                    $(".detailFormSwitchInsert").hide();
                                    $(".detailFormSwitchCheckBox").hide();
                                    $(".detailFormSwitchDetail").show();
                                    $(".detailFormSwitchRandomDetail").hide();
                                    $(".detailFormSwitchConfirm").show();
                                }
                            });
                        else {
                            $(".detailFormSwitchInsert").hide();
                            $(".detailFormSwitchCheckBox").hide();
                            $(".detailFormSwitchDetail").show();
                            $(".detailFormSwitchRandomDetail").hide();
                            $(".detailFormSwitchConfirm").show();
                        }
                        if (checkInDetailList.length == 0) {
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
                                    url: "/checkIn/select.action",
                                    data: {
                                        "checkinbillitem": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "checkinbillId": id
                                            }
                                            }
                                        ),
                                        "isDetail": "2"
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result);
                                        var checkInDetailList = re.p.list;
                                        var productList = re.checkinbillitemSelectList;
                                        var checkInHtml = "";
                                        if (checkInDetailList.length == 0) {
                                            layer.msg('订单详情为空', {time: 1000});
                                            return;
                                        }
                                        $("#detailFormBillCode").val(checkInDetailList[0].billCode);
                                        $("#detailFormResDepartmentName").val(checkInDetailList[0].desDepartmentName);
                                        $("#detailFormCreateTime").val(checkInDetailList[0].createTime);

                                        $("#detailFormDesDepartmentSysUser").children().remove();
                                        var sysusersHtml = "<option value=\"" +
                                            checkInDetailList[0].desDepartmentSysUserId +
                                            "\">" +
                                            checkInDetailList[0].desDepartmentSysUser +
                                            "</option>";
                //                        for (var j = 0; j < sysusers.length; j++) {
                //                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                //                        }
                                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                //                        $("[id='detailFormDesDepartmentSysUser']").val(checkInDetailList[0].desDepartmentSysUserId);
                //                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkInDetailList[0].desDepartmentSysUser);
                                        $("#detailFormInfo").val(checkInDetailList[0].info);
                                        $("#detailFormBillCode").attr("disabled", true);
                                        $("#detailFormResDepartmentName").attr("disabled", true);
                                        $("#detailFormCreateTime").attr("disabled", true);
                                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                                        $("#detailFormInfo").attr("disabled", true);
                                        for (var a = 0; a < checkInDetailList.length; a++) {
                                            var mijianList = new Array();//密件List
                                            //判断该密品下是否有密件
                                            for (var j = 0; j < productList.length; j++) {
                                                if (productList[j].productProductId != null && productList[j].productProductId == checkInDetailList[a].productId) {
                                                    mijianList.push(productList[j]);
                                                }
                                            }
                                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                                            if(checkInDetailList[a].status=="1"){
                                                checkInHtml +=
                                                    "<tr> ";
                                            }else{
                                                checkInHtml +=
                                                    "<tr style='background-color:lightgray'> ";
                                            }
                                            if (mijianList.length != 0) {
                                                checkInHtml +=
                                                    "<td class='center'>" +
                                                    "<div class='action-buttons'>" +
                                                    "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                                    "<span class='sr-only'>详情</span>" +
                                                    "</a>" +
                                                    "</div>" +
                                                    "</td>";
                                            } else {
                                                checkInHtml +=
                                                    "<td class='center'>" +
                                                    "</td>";
                                            }
                                            checkInHtml +=
                                                "<td>" + page + "</td> " +
                                                "<td hidden=hidden>" + checkInDetailList[a].id + "</td> " +
                                                "<td>" + checkInDetailList[a].productDictionaryValue + "</td> " +
                                                "<td>" + checkInDetailList[a].productModel + "</td> " +
                                                "<td>" + checkInDetailList[a].productProCode + "</td> " +
                                                "<td>" + checkInDetailList[a].productSerNum + "</td> " +
                                                "<td>" + checkInDetailList[a].productRfidCode + "</td> " +
                                                "<td>" + checkInDetailList[a].checkinTime + "</td> " +
                                                "<td style='text-align: center;color: #2283C5;'> " +
                                                "<span>";
                                            if(checkInDetailList[a].status=="1"){
                                                if (checkInDetailList[a].checkinTime == "") {
                                                    checkInHtml += "<a style='cursor:pointer;text-decoration:none' class='checkInConfirmButton' value='" + checkInDetailList[a].id + "'> 确认入库 </a>";
                                                } else {
                                                    checkInHtml += "<a style='cursor:pointer;text-decoration:none' value='" + checkInDetailList[a].id + "'> 已入库 </a>";
                                                }
                                            }
                                            checkInHtml += "</span>" +
                                                "</td> " +
                                                "</tr>";
                                            if (mijianList.length != 0) {
                                                checkInHtml += "<tr class='detail-row' type='1'>" +
                                                    "<td colspan='12'>" +
                                                    "<div class='table-detail'>" +
                                                    "<div class='row'>" +
                                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                                $.each(mijianList, function (index, item) {
                                                    var id = item.id;
                                                    var rfidCode = "";
                                                    if (item.productRfidCode != null) {
                                                        rfidCode = item.productRfidCode;
                                                    }
                                                    checkInHtml += "<tr style='height: 30px' type='2'>" +
//                                                        "<td class='detailFormSwitchCheckBox' >" +
//                                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                                        "<td hidden=hidden >" + id + "</td>" +
                                                        "<td style='padding-left: 20px'>" + " 类别 ：" + item.productDictionaryValue + "</td>" +
                                                        "<td style='padding-left: 40px'>" + " RFID编码 : " + rfidCode + "</td>" +
                                                        "<td style='padding-left: 40px'>" + " 备注 : " + item.info + "</td>" +
                                                        "<td style='text-align: center;color: #2283C5;'> " +
                                                        "<span>";
                                                    if (item.checkinTime == "") {
                                                        checkInHtml += "<a style='cursor:pointer;text-decoration:none' class='checkInConfirmButton' value='" + item.id + "'> 确认入库 </a>";
                                                    } else {
                                                        checkInHtml += "<a style='cursor:pointer;text-decoration:none' value='" + item.id + "'> 已入库 </a>";
                                                    }
                                                    checkInHtml += "</span>" +
                                                        "</td> " +
                                                        "</tr>";
                                                })
                                                checkInHtml +=
                                                    "</table>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</td>" +
                                                    "</tr>"
                                            }
                                        }
                                        $("#checkInDetailTable").empty();
                                        $("#checkInDetailTable").append(checkInHtml);

                                        //入库确认
                                        $(document).off("click", ".checkInConfirmButton");
                                        $(document).on("click", ".checkInConfirmButton", function () {
                                            var detailFormLocationId = $("#detailFormLocationId").val();
                                            if (detailFormLocationId == "") {
                                                layer.msg('未选择位置！', {time: 1000});
                                                return;
                                            }
                                            id = $(this).attr("value");
                                            layer.confirm(
                                                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认入库？</div>",
                                                function (index) {
                                                    layer.load(2, {time: 1000});
                                                    $.ajax({
                                                        type: "post",
                                                        dataType: "html",
                                                        url: "/checkIn/update.action",
                                                        traditional: true,
                                                        data: {
                                                            "checkin": JSON.stringify({
                                                                "checkinbillitemList": [{
                                                                    "id": id,
                                                                    "result": "1"
                                                                }],
                                                                "checkinbill": {
                                                                    "id": checkInDetailList[0].checkinbillId,
                                                                    "locationId": detailFormLocationId
                                                                }
                                                            })
                                                        },
                                                        success: function (result) {
                                                            re = JSON.parse(result);
                                                            if (re.status == ("true")) {
                                                                layer.msg(re.msg, {time: 1000});
                                                                layer.close(index);
                                                                checkInConfirm(re.data.checkinbillitemList[0].checkinbillId, 'notOpen');
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
                                        $(document).off("click", ".checkInItemDetailInDatabase");
                                        $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
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
                addFormRandom();
            })
            //新增密件
            function addFormRandom() {
                layer.open({
                    type: 1,
                    title: "新增",
                    shadeClose: false,
                    area: ['60%', '60%'],
                    content: $('#addFormRandom'),
                    btn: ['保存', '关闭'],
                    btnAlign: 'c', //按钮居中
                    yes: function (index) {
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
                        var index1 = parseInt(indexString == "" || indexString == NaN ? 0 : indexString) + 1;
                        var addFormRandomTableHtml =
                            "<tr> " +
                            "<td>" + index1 + "</td> " +
                            "<td value='" + addFormRandomDictionaryId + "'>" + addFormRandomDictionaryText + "</td> " +
                            "<td value='" + addFormRandomLocationId + "'>" + addFormRandomLocationText + "</td> " +
                            "<td >" + "" + "</td> " +
                            "<td>" + addFormRandomInfo + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='addFormRandomDelete' value='" + index1 + "'> 删除 </a> " +
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
                        layer.close(index);
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
            $('#checkInDeleteButton').on('click', function () {
                var child = $("#checkInTable").parents('table').find('tbody input[type="checkbox"]');
                var c = [];
                var count = 0;
                child.each(function (index, item) {
                    if (item.checked == true) {
                        var index = $("#checkInTable").children().eq(index).children().eq(1)[0].innerText
                        c[count++] = checkInList[index%10 - 1].id;
                    }
                });
                checkInDelete(c);
            });

            //导入
            $('#checkInInputButton').on('click', function () {
                checkInSelect(this);
            });
            //导出
            $('#checkInOutputButton').on('click', function () {
                checkInSelect(this);
            });
            //编辑
            $(document).on("click", ".checkInUpdate", function () {
                var option = checkInList[this.getAttribute("value")]
                checkInUpdate(option.id);
            });
            function checkInUpdate(id) {
                var pageIndex = 1;
                $("#detailFormAddProduct").hide();
                $("#detailFormDeleteProduct").hide();
                $("#data-pagination-detail").show();

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkIn/select.action",
                    traditional: true,
                    data: {
                        "checkinbillitem": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "checkinbillId": id
                            }
                            }
                        ),
                        "isDetail": "2"
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        var checkInDetailList = re.p.list;
                        var productList = re.checkinbillitemSelectList;
                        var checkInHtml = "";
                        if (checkInDetailList.length == 0) {
                            layer.msg('订单详情为空', {time: 1000});
                            return;
                        }
                        $("#detailFormBillCode").val(checkInDetailList[0].billCode);
                        $("#detailFormResDepartmentName").val(checkInDetailList[0].desDepartmentName);
                        $("#detailFormCreateTime").val(checkInDetailList[0].createTime);

                        $("#detailFormDesDepartmentSysUser").children().remove();
                        var sysusersHtml = "<option value=\"\"></option>";
                        for (var j = 0; j < sysusers.length; j++) {
                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                        }
                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                        $("[id='detailFormDesDepartmentSysUser']").val(checkInDetailList[0].desDepartmentSysUserId);
                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkInDetailList[0].desDepartmentSysUser);

                        $("#detailFormInfo").val(checkInDetailList[0].info);
                        $("#detailFormBillCode").attr("disabled", true);
                        $("#detailFormResDepartmentName").attr("disabled", true);
                        $("#detailFormCreateTime").attr("disabled", true);
                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                        $("#detailFormInfo").attr("disabled", true);
                        for (var a = 0; a < checkInDetailList.length; a++) {
                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                            var productProCode = checkInDetailList[a].productProCode;
                            var mijianList = new Array();//密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < productList.length; j++) {
                                if (productList[j].productProductId != null && productList[j].productProductId == checkInDetailList[a].productId) {
                                    mijianList.push(productList[j]);
                                }
                            }
                            if(checkInDetailList[a].status=="1"){
                                checkInHtml +=
                                    "<tr> ";
                            }else{
                                checkInHtml +=
                                    "<tr style='background-color:lightgray'> ";
                            }
                            if (mijianList.length != 0) {
                                checkInHtml +=
                                    "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>详情</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            } else {
                                checkInHtml +=
                                    "<td class='center'>" +
                                    "</td>";
                            }
                            checkInHtml +=
                                "<td>" + page + "</td> " +
                                "<td hidden=hidden>" + checkInDetailList[a].id + "</td> " +
                                "<td>" + checkInDetailList[a].productDictionaryValue + "</td> " +
                                "<td>" + checkInDetailList[a].productModel + "</td> " +
                                "<td>" + productProCode + "</td> " +
                                "<td>" + checkInDetailList[a].productSerNum + "</td> " +
                                "<td>" + checkInDetailList[a].productRfidCode + "</td> " +
                                "<td>" + checkInDetailList[a].checkinTime + "</td> ";
                            checkInHtml +=
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>";
                            if(checkInDetailList[a].status=="1"){
                                checkInHtml +=
                                    "<a style='cursor:pointer;text-decoration:none' class='mipinRfid' value='" + checkInDetailList[a].productId + "'> 发标签 </a> ";
                            }
                            checkInHtml +="</span>" +
                                "</td> " +
                                "</tr>";
                            if (mijianList.length != 0) {
                                checkInHtml += "<tr class='detail-row' type='1'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                $.each(mijianList, function (index, item) {
                                    var id = item.id;
                                    var rfidCode = "";
                                    if (item.productRfidCode != null) {
                                        rfidCode = item.productRfidCode;
                                    }
                                    var info = "";
                                    if (item.info != null) {
                                        info = item.info;
                                    }
                                    checkInHtml += "<tr style='height: 30px' type='2'>" +
                                        "<td class='detailFormSwitchCheckBox' >" +
                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >" + id + "</td>" +
                                        "<td style='width:3.5%;min-width:40px'>类别：</td>" +
                                        "<td>" + item.productDictionaryValue + "</td>" +
                                        "<td style='width:5.5%;min-width:80px'>RFID编码：</td>" +
                                        "<td style='width:25%'>" + rfidCode + "</td>" +
                                        "<td hidden=hidden >" + productProCode + "</td>" +
                                        "<td style='width:3.5%;min-width:40px'>备注：</td>" +
                                        "<td style='width:25%'>" + info + "</td>" +
                                        "<td style='text-align: center;color: #2283C5;'> " +
                                        "<span>" +
                                        "<a style='cursor:pointer;text-decoration:none' class='mipinRandomRfid' value='" + item.productId + "'> 发标签 </a> " +
                                        "</span>" +
                                        "</td> " +
                                        "</tr>";
                                })
                                checkInHtml +=
                                    "</table>" +
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                        }
                        $("#checkInDetailTable").empty();
                        $("#checkInDetailTable").append(checkInHtml);
                        //查看密品详情的密件
                        $(document).off("click", ".checkInItemDetailInDatabase");
                        $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                        //密品标签注册
                        $(document).off("click", ".mipinRfid");
                        $(document).on("click", ".mipinRfid", function () {
                            var id = $(this).attr("value");
                            var type = $(this).parent().parent().parent().find("td").eq(3).text();//U盘、光盘类型
                            var proCode = $(this).parent().parent().parent().find("td").eq(5).text();
                            var td = $(this).parent().parent().parent().find("td").eq(7);
                            readcard(id, type, proCode, td);
                        })
                        //密件标签注册
                        $(document).off("click", ".mipinRandomRfid");
                        $(document).on("click", ".mipinRandomRfid", function () {
                            var id = $(this).attr("value");
                            var type = $(this).parent().parent().parent().find("td").eq(4).text();//U盘、光盘类型
                            var proCode = $(this).parent().parent().parent().find("td").eq(9).text();
                            var td = $(this).parent().parent().parent().find("td").eq(6);
                            readcard(id, type, proCode, td);
                        })
                        layer.open({
                            type: 1,
                            title: '入库单发标签',
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
                                $(".detailFormSwitchRandomDetail").hide();
                                $(".detailFormSwitchConfirm").show();
                            }
                        });
                        if (checkInDetailList.length == 0) {
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
                                    url: "/checkIn/select.action",
                                    data: {
                                        "checkinbillitem": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "checkinbillId": id
                                            }
                                            }
                                        ),
                                        "isDetail": "2"
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result);
                                        var checkInDetailList = re.p.list;
                                        var productList = re.checkinbillitemSelectList;
                                        var checkInHtml = "";
                                        if (checkInDetailList.length == 0) {
                                            layer.msg('订单详情为空', {time: 1000});
                                            return;
                                        }
                                        $("#detailFormBillCode").val(checkInDetailList[0].billCode);
                                        $("#detailFormResDepartmentName").val(checkInDetailList[0].desDepartmentName);
                                        $("#detailFormCreateTime").val(checkInDetailList[0].createTime);

                                        $("#detailFormDesDepartmentSysUser").children().remove();
                                        var sysusersHtml = "<option value=\"\"></option>";
                                        for (var j = 0; j < sysusers.length; j++) {
                                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
                                        }
                                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
                                        $("[id='detailFormDesDepartmentSysUser']").val(checkInDetailList[0].desDepartmentSysUserId);
                                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkInDetailList[0].desDepartmentSysUser);

                                        $("#detailFormInfo").val(checkInDetailList[0].info);
                                        $("#detailFormBillCode").attr("disabled", true);
                                        $("#detailFormResDepartmentName").attr("disabled", true);
                                        $("#detailFormCreateTime").attr("disabled", true);
                                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                                        $("#detailFormInfo").attr("disabled", true);
                                        for (var a = 0; a < checkInDetailList.length; a++) {
                                            var mijianList = new Array();//密件List
                                            //判断该密品下是否有密件
                                            for (var j = 0; j < productList.length; j++) {
                                                if (productList[j].productProductId != null && productList[j].productProductId == checkInDetailList[a].productId) {
                                                    mijianList.push(productList[j]);
                                                }
                                            }
                                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                                            var productProCode = checkInDetailList[a].productProCode;
                                            if(checkInDetailList[a].status=="1"){
                                                checkInHtml +=
                                                    "<tr> ";
                                            }else{
                                                checkInHtml +=
                                                    "<tr style='background-color:lightgray'> ";
                                            }
                                            if (mijianList.length != 0) {
                                                checkInHtml +=
                                                    "<td class='center'>" +
                                                    "<div class='action-buttons'>" +
                                                    "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                                    "<span class='sr-only'>详情</span>" +
                                                    "</a>" +
                                                    "</div>" +
                                                    "</td>";
                                            } else {
                                                checkInHtml +=
                                                    "<td class='center'>" +
                                                    "</td>";
                                            }
                                            checkInHtml +=
                                                "<td>" + page + "</td> " +
                                                "<td hidden=hidden>" + checkInDetailList[a].id + "</td> " +
                                                "<td>" + checkInDetailList[a].productDictionaryValue + "</td> " +
                                                "<td>" + checkInDetailList[a].productModel + "</td> " +
                                                "<td>" + productProCode + "</td> " +
                                                "<td>" + checkInDetailList[a].productSerNum + "</td> " +
                                                "<td>" + checkInDetailList[a].productRfidCode + "</td> " +
                                                "<td>" + checkInDetailList[a].checkinTime + "</td> ";
                                            checkInHtml +=
                                                "<td style='text-align: center;color: #2283C5;'> " +
                                                "<span>";
                                            if(checkInDetailList[a].status=="1"){
                                                checkInHtml +=
                                                    "<a style='cursor:pointer;text-decoration:none' class='mipinRfid' value='" + checkInDetailList[a].productId + "'> 发标签 </a> ";
                                            }
                                            checkInHtml +=
                                                "</span>" +
                                                "</td> " +
                                                "</tr>";
                                            if (mijianList.length != 0) {
                                                checkInHtml += "<tr class='detail-row' type='1'>" +
                                                    "<td colspan='12'>" +
                                                    "<div class='table-detail'>" +
                                                    "<div class='row'>" +
                                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                                $.each(mijianList, function (index, item) {
                                                    var id = item.id;
                                                    var rfidCode = "";
                                                    if (item.productRfidCode != null) {
                                                        rfidCode = item.productRfidCode;
                                                    }
                                                    var info = "";
                                                    if (item.info != null) {
                                                        info = item.info;
                                                    }
                                                    checkInHtml += "<tr style='height: 30px' type='2'>" +
                                                        "<td class='detailFormSwitchCheckBox' >" +
                                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                                        "<td hidden=hidden >" + id + "</td>" +
                                                        "<td style='width:3.5%;min-width:40px'>类别：</td>" +
                                                        "<td>" + item.productDictionaryValue + "</td>" +
                                                        "<td style='width:5.5%;min-width:80px'>RFID编码：</td>" +
                                                        "<td style='width:25%'>" + rfidCode + "</td>" +
                                                        "<td hidden=hidden >" + productProCode + "</td>" +
                                                        "<td style='width:3.5%;min-width:40px'>备注：</td>" +
                                                        "<td style='width:25%'>" + info + "</td>" +
                                                        "<td style='text-align: center;color: #2283C5;'> " +
                                                        "<span>";
                                                        "<a style='cursor:pointer;text-decoration:none' class='mipinRandomRfid' value='" + item.productId + "'> 发标签 </a> " +
                                                        "</span>" +
                                                        "</td> " +
                                                        "</tr>";
                                                })
                                                checkInHtml +=
                                                    "</table>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</td>" +
                                                    "</tr>"
                                            }
                                        }
                                        $("#checkInDetailTable").empty();
                                        $(document).off("click", ".checkInItemDetailInDatabase");
                                        $("#checkInDetailTable").append(checkInHtml);
                                        //查看密品详情的密件
                                        $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
                                            e.preventDefault();
                                            $(this).closest('tr').next().toggleClass('open');
                                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                                        });
                                        //密品标签注册
                                        $(document).off("click", ".mipinRfid");
                                        $(document).on("click", ".mipinRfid", function () {
                                            var id = $(this).attr("value");
                                            var type = $(this).parent().parent().parent().find("td").eq(3).text();//U盘、光盘类型
                                            var proCode = $(this).parent().parent().parent().find("td").eq(5).text();
                                            var td = $(this).parent().parent().parent().find("td").eq(10);
                                            readcard(id, type, proCode, td);
                                        })
                                        //密件标签注册
                                        $(document).off("click", ".mipinRandomRfid");
                                        $(document).on("click", ".mipinRandomRfid", function () {
                                            var id = $(this).attr("value");
                                            var type = $(this).parent().parent().parent().find("td").eq(4).text();//U盘、光盘类型
                                            var proCode = $(this).parent().parent().parent().find("td").eq(7).text();
                                            var td = $(this).parent().parent().parent().find("td").eq(6);
                                            readcard(id, type, proCode, td);
                                        })
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

            //查看密品详情
            $(document).on("click", ".checkInDetail", function () {
                var option = checkInList[this.getAttribute("value")]
                checkInDetail(option);
            });
            var checkInDetailList;

            function checkInDetail(option) {
                var id = option.id
                var pageIndex = 1;
                $("#data-pagination-detail").show();
                $("#detailFormAddProduct").hide();
                $("#detailFormDeleteProduct").hide();

                $.ajax({
                    type: "post",
                    dataType: "html",
                    url: "/checkIn/select.action",
                    traditional: true,
                    data: {
                        "checkinbillitem": JSON.stringify(
                            {
                                "pageIndex": pageIndex, "pageSize": "10", "paramEntity": {
                                "checkinbillId": id
                            }
                            }
                        ),
                        "isDetail": "2"
                    },
                    success: function (result) {
                        var re = JSON.parse(result);
                        var checkInDetailList = re.p.list;
                        var productList = re.checkinbillitemSelectList;
                        var checkInHtml = "";
                        if (checkInDetailList.length == 0) {
                            layer.msg('订单详情为空', {time: 1000});
                            return;
                        }
                        $("#detailFormBillCode").val(checkInDetailList[0].billCode);
                        $("#detailFormResDepartmentName").val(checkInDetailList[0].desDepartmentName);
                        $("#detailFormCreateTime").val(checkInDetailList[0].createTime);
                        $("#detailFormDesDepartmentSysUser").children().remove();
                        var sysusersHtml = "<option value=\"" +
                            checkInDetailList[0].desDepartmentSysUserId +
                            "\">" +
                            checkInDetailList[0].desDepartmentSysUser +
                            "</option>";
//                        for (var j = 0; j < sysusers.length; j++) {
//                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
//                        }
                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
//                        $("[id='detailFormDesDepartmentSysUser']").val(checkInDetailList[0].desDepartmentSysUserId);
//                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkInDetailList[0].desDepartmentSysUser);
                        $("[id='detailFormLocationId']").val(option.locationId);
                        $("[id='detailFormLocationId']").attr("text", option.locationLocInfo);
                        $("#detailFormInfo").val(option.info);
                        $("#detailFormBillCode").attr("disabled", true);
                        $("#detailFormResDepartmentName").attr("disabled", true);
                        $("#detailFormCreateTime").attr("disabled", true);
                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                        $("#detailFormLocationId").attr("disabled", true);
                        $("#detailFormInfo").attr("disabled", true);
                        for (var a = 0; a < checkInDetailList.length; a++) {
                            var mijianList = new Array();//密件List
                            //判断该密品下是否有密件
                            for (var j = 0; j < productList.length; j++) {
                                if (productList[j].productProductId != null && productList[j].productProductId == checkInDetailList[a].productId) {
                                    mijianList.push(productList[j]);
                                }
                            }
                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                            var productProCode = checkInDetailList[a].productProCode;
                            if(checkInDetailList[a].status=="1"){
                                checkInHtml +=
                                    "<tr> ";
                            }else{
                                checkInHtml +=
                                    "<tr style='background-color:lightgray'> ";
                            }
                            if (mijianList.length != 0) {
                                checkInHtml +=
                                    "<td class='center'>" +
                                    "<div class='action-buttons'>" +
                                    "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                    "<span class='sr-only'>详情</span>" +
                                    "</a>" +
                                    "</div>" +
                                    "</td>";
                            } else {
                                checkInHtml +=
                                    "<td class='center'>" +
                                    "</td>";
                            }
                            checkInHtml +=
                                "<td>" + page + "</td> " +
                                "<td hidden=hidden>" + checkInDetailList[a].id + "</td> " +
                                "<td>" + checkInDetailList[a].productDictionaryValue + "</td> " +
                                "<td>" + checkInDetailList[a].productModel + "</td> " +
                                "<td>" + productProCode + "</td> " +
                                "<td>" + checkInDetailList[a].productSerNum + "</td> " +
                                "<td>" + checkInDetailList[a].productRfidCode + "</td> " +
                                "<td>" + checkInDetailList[a].checkinTime + "</td> " +
                                "</tr>";
                            if (mijianList.length != 0) {
                                checkInHtml += "<tr class='detail-row' type='1'>" +
                                    "<td colspan='12'>" +
                                    "<div class='table-detail'>" +
                                    "<div class='row'>" +
                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                $.each(mijianList, function (index, item) {
                                    var id = item.id;
                                    var rfidCode = "";
                                    if (item.productRfidCode != null) {
                                        rfidCode = item.productRfidCode;
                                    }
                                    var info = "";
                                    if (item.info != null) {
                                        info = item.info;
                                    }
                                    checkInHtml += "<tr style='height: 30px' type='2'>" +
                                        "<td class='detailFormSwitchCheckBox' >" +
                                        "</td>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >" + id + "</td>" +
                                        "<td style='width:3.5%;min-width:40px'>类别：</td>" +
                                        "<td>" + item.productDictionaryValue + "</td>" +
                                        "<td style='width:5.5%;min-width:80px'>RFID编码：</td>" +
                                        "<td style='width:25%'>" + rfidCode + "</td>" +
                                        "<td hidden=hidden >" + productProCode + "</td>" +
                                        "<td style='width:3.5%;min-width:40px'>备注：</td>" +
                                        "<td style='width:25%'>" + info + "</td>" +
                                        "<td style='text-align: center;color: #2283C5;'> " +
                                        "</tr>";
                                })
                                checkInHtml +=
                                    "</table>" +
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                        }
                        $("#checkInDetailTable").empty();
                        $(document).off("click", ".checkInItemDetailInDatabase");
                        $("#checkInDetailTable").append(checkInHtml);
                        //查看密品详情的密件
                        $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
                            e.preventDefault();
                            $(this).closest('tr').next().toggleClass('open');
                            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                        });
                        layer.open({
                            type: 1,
                            title: '入库单查看',
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
                                $(".detailFormSwitchRandomDetail").hide();
                                $(".detailFormSwitchConfirm").hide();
                            }
                        });
                        if (checkInDetailList.length == 0) {
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
                                    url: "/checkIn/select.action",
                                    data: {
                                        "checkinbillitem": JSON.stringify(
                                            {
                                                "pageIndex": page, "pageSize": "10", "paramEntity": {
                                                "checkinbillId": id
                                            }
                                            }
                                        ),
                                        "isDetail": "2"
                                    },
                                    success: function (result) {
                                        var re = JSON.parse(result);
                                        var checkInDetailList = re.p.list;
                                        var productList = re.checkinbillitemSelectList;
                                        var checkInHtml = "";
                                        if (checkInDetailList.length == 0) {
                                            layer.msg('订单详情为空', {time: 1000});
                                            return;
                                        }
                                        $("#detailFormBillCode").val(checkInDetailList[0].billCode);
                                        $("#detailFormResDepartmentName").val(checkInDetailList[0].desDepartmentName);
                                        $("#detailFormCreateTime").val(checkInDetailList[0].createTime);
                                        $("#detailFormDesDepartmentSysUser").children().remove();
                                        var sysusersHtml = "<option value=\"" +
                                            checkInDetailList[0].desDepartmentSysUserId +
                                            "\">" +
                                            checkInDetailList[0].desDepartmentSysUser +
                                            "</option>";
//                                        for (var j = 0; j < sysusers.length; j++) {
//                                            sysusersHtml += "<option value=\"" + sysusers[j].id + "\">" + sysusers[j].name + "</option>"
//                                        }
                                        $("#detailFormDesDepartmentSysUser").append(sysusersHtml);
//                                        $("[id='detailFormDesDepartmentSysUser']").val(checkInDetailList[0].desDepartmentSysUserId);
//                                        $("[id='detailFormDesDepartmentSysUser']").attr("text", checkInDetailList[0].desDepartmentSysUser);
                                        $("[id='detailormLocationId']").val(option.locationId);
                                        $("[id='detailFormLocationId']").attr("text", option.locationLocInfo);
                                        $("#detailFormInfo").val(option.info);
                                        $("#detailFormBillCode").attr("disabled", true);
                                        $("#detailFormResDepartmentName").attr("disabled", true);
                                        $("#detailFormCreateTime").attr("disabled", true);
                                        $("#detailFormDesDepartmentSysUser").attr("disabled", true);
                                        $("#detailFormInfo").attr("disabled", true);
                                        for (var a = 0; a < checkInDetailList.length; a++) {
                                            var mijianList = new Array();//密件List
                                            //判断该密品下是否有密件
                                            for (var j = 0; j < productList.length; j++) {
                                                if (productList[j].productProductId != null && productList[j].productProductId == checkInDetailList[a].productId) {
                                                    mijianList.push(productList[j]);
                                                }
                                            }
                                            var page = (re.p.pageIndex - 1) * 10 + a + 1;
                                            var productProCode = checkInDetailList[a].productProCode;
                                            if(checkInDetailList[a].status=="1"){
                                                checkInHtml +=
                                                    "<tr> ";
                                            }else{
                                                checkInHtml +=
                                                    "<tr style='background-color:lightgray'> ";
                                            }
                                            if (mijianList.length != 0) {
                                                checkInHtml +=
                                                    "<td class='center'>" +
                                                    "<div class='action-buttons'>" +
                                                    "<a href='#' class='green bigger-140 checkInItemDetailInDatabase'value='" + a + "' title='查看详情'>" +
                                                    "<i class='ace-icon fa fa-angle-double-down showtable' ></i>" +
                                                    "<span class='sr-only'>详情</span>" +
                                                    "</a>" +
                                                    "</div>" +
                                                    "</td>";
                                            } else {
                                                checkInHtml +=
                                                    "<td class='center'>" +
                                                    "</td>";
                                            }
                                            checkInHtml +=
                                                "<td>" + page + "</td> " +
                                                "<td hidden=hidden>" + checkInDetailList[a].id + "</td> " +
                                                "<td>" + checkInDetailList[a].productDictionaryValue + "</td> " +
                                                "<td>" + checkInDetailList[a].productModel + "</td> " +
                                                "<td>" + productProCode + "</td> " +
                                                "<td>" + checkInDetailList[a].productSerNum + "</td> " +
                                                "<td>" + checkInDetailList[a].productRfidCode + "</td> " +
                                                "<td>" + checkInDetailList[a].checkinTime + "</td> " +
                                                "</tr>";
                                            if (mijianList.length != 0) {
                                                checkInHtml += "<tr class='detail-row' type='1'>" +
                                                    "<td colspan='12'>" +
                                                    "<div class='table-detail'>" +
                                                    "<div class='row'>" +
                                                    "<h6 class='header smaller lighter red' style='width: 95%;margin-top: -2px;margin-left: 20px'>密件</h6>" +
                                                    "<table style='font-size: 12px;margin-left:20px;font-family:Microsoft YaHei;width: 90%' border='0'>";
                                                $.each(mijianList, function (index, item) {
                                                    var id = item.id;
                                                    var rfidCode = "";
                                                    if (item.productRfidCode != null) {
                                                        rfidCode = item.productRfidCode;
                                                    }
                                                    var info = "";
                                                    if (item.info != null) {
                                                        info = item.info;
                                                    }
                                                    checkInHtml += "<tr style='height: 30px' type='2'>" +
                                                        "<td class='detailFormSwitchCheckBox' >" +
                                                        "</td>" +
                                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                                        "<td hidden=hidden >" + id + "</td>" +
                                                        "<td style='width:3.5%;min-width:40px'>类别：</td>" +
                                                        "<td>" + item.productDictionaryValue + "</td>" +
                                                        "<td style='width:5.5%;min-width:80px'>RFID编码：</td>" +
                                                        "<td style='width:25%'>" + rfidCode + "</td>" +
                                                        "<td hidden=hidden >" + productProCode + "</td>" +
                                                        "<td style='width:3.5%;min-width:40px;'>备注：</td>" +
                                                        "<td style='width:25%'>" + info + "</td>" +
                                                        "<td style='text-align: center;color: #2283C5;'> " +
                                                        "</tr>";
                                                })
                                                checkInHtml +=
                                                    "</table>" +
                                                    "</div>" +
                                                    "</div>" +
                                                    "</td>" +
                                                    "</tr>"
                                            }
                                        }
                                        $("#checkInDetailTable").empty();
                                        $(document).off("click", ".checkInItemDetailInDatabase");
                                        $("#checkInDetailTable").append(checkInHtml);
                                        //查看密品详情的密件
                                        $(document).on("click", ".checkInItemDetailInDatabase", function (e) {
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
            $(document).on("click", ".checkInDelete", function () {
                var StringArray = [];
                StringArray[0] = checkInList[this.getAttribute("value")].id
                checkInDelete(StringArray);
            });

            function checkInDelete(deleteList) {
                layer.confirm(
                    "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'></div><div style='text-align: center'> 是否确认删除？</div>",
                    function () {
                        for (var i = 0; i < deleteList.length; i++) {
                            layer.load(2, {time: 1000});
                            $.ajax({
                                type: "post",
                                dataType: "html",
                                url: "/checkIn/delete.action",
                                traditional: true,
                                data: {
                                    "checkin": JSON.stringify(
                                        {
                                            "checkinbill": {
                                                "id": deleteList[i]
                                            },
                                        }
                                    )
                                },
                                success: function (result) {
                                    re = JSON.parse(result)
                                    if (re.status == ("true")) {
                                        layer.msg(re.msg, {time: 1000});
                                        checkInClean();
                                        checkInSelect();
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
            menuId:'5'
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
        }
    )

</script>

<link rel="stylesheet" href="../../assets/css/ace.onpage-help.css"/>
<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../../assets/js/src/elements.onpage-help.js"></script>
<script src="../../assets/js/src/ace.onpage-help.js"></script>
</body>
</html>