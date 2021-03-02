<%@ page import="com.ht70605.entity.User" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-6-22
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<c:set var="proPath" value="${pageContext.request.contextPath}" />--%>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>密品信息</title>

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
                        <i class="ace-icon fa fa-home home-icon"></i>密品信息
                    </li>

                </ul>

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" style="min-width: 850px">
                <div class="row" >
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form id="search_form">
                            <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px;min-width: 850px">
                                <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;margin: auto;"
                                       border="0">
                                    <tr>
                                        <td>
                                            密品类别：<select class="chosen-select" id="search_dictionaryId" name="search_dictionaryId"  data-placeholder="请选择密品类型"  style="width: 163px">
                                            <option></option>

                                            <%--<c:forEach items="${sysParam}" var="item">--%>
                                            <%--<option value='${item.key}'>${item.value}</option>--%>
                                            <%--</c:forEach>--%>
                                            <%--<option value=""></option>--%>
                                            <%--<option value="">1</option>--%>
                                            <%--<option value="">2</option>--%>
                                        </select>
                                            <a style="padding-left: 10px"></a>
                                            密品型号：<input id="search_model"
                                                        name="search_model" type="text" maxlength="64">
                                            <a style="padding-left: 10px"></a>
                                            出厂编号：<input  id="search_serNum"
                                                         name="search_serNum" type="text" maxlength="64">
                                        </td>
                                        <td rowspan="3" style="padding-left: 20px">
                                            <button type="button" id="sysuserSelectButton"
                                                    name="sysuserSelectButton" class="btn btn-info btn-xs"
                                                    style="margin-top: 0px">
                                                <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                            </button>&nbsp;
                                            <button type="button" id="clearBtn" name="clearBtn"
                                                    class="btn btn-xs btn-purple" style="width: 54.3px">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>重置
                                            </button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            所属系统：<select class="chosen-select" id="search_applicationId" name="search_applicationId"  data-placeholder="请选择密品类型"  style="width: 163px">
                                            <option></option>
                                        </select>
                                            <a style="padding-left: 8px"></a>
                                            RFID编号：<input id="search_rfidCode"
                                                          name="search_rfidCode" type="text" maxlength="64">
                                            <a style="padding-left: 18px"></a>
                                            责任人： <select class="chosen-select" id="search_sysuserId" name="search_sysuserId"  data-placeholder="请选择责任人"  style="width: 163px">
                                            <option></option>
                                        </select>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            列装号段：<input id="search_proCode_begin"
                                                        name="search_proCode_begin" type="text" maxlength="64">
                                            -- <input id="search_proCode_end"
                                                      name="search_proCode_end" type="text" maxlength="64">
                                        </td>

                                    </tr>

                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div  style="height: 35px;">

                </div>
                <div class="row" style="padding-top: 35px">
                    <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px">

                        <table id="simple-table" class="table  table-bordered table-hover" style="min-width: 800px;">
                            <thead>
                            <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                                <label style="padding: 6px;font-size: 12px">&nbsp;密品信息列表</label>
                                <span style="float:right;padding-right: 5px">
                                      <%--<button id="btnRFID" name="btnRFID"--%>
                                              <%--class="btn btn-xs btn-info">--%>
                                        <%--<i class="ace-icon fa fa-check"></i>--%>
                                        <%--发标签</button>--%>
                                        <button id="btnAdd" name="btnAdd"
                                                class="btn btn-xs btn-success ishow">
                                        <i class="ace-icon fa fa-check "></i>
                                        新增</button>
                                        <button id="btnDel" name="btnDel"
                                                class="btn btn-xs  btn-danger ishow">
                                        <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                        删除</button>
                                        </span>
                            </div>
                            <tr style="height: 30px;">
                                <th class="center" style="width: 50px">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" id="qx"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th class="detail-col" width="150px">密件</th>
                                <%--<th width="50px" style="text-align: center">序号</th>--%>
                                <th>密品类别</th>
                                <th>密品型号</th>
                                <th>列装号</th>
                                <th>出厂编号</th>
                                <th>所属系统</th>
                                <th>责任人</th>
                                <th>位置</th>
                                <th>RFID编号</th>
                                <th style="text-align: center;width: 200px">操作</th>
                            </tr>
                            </thead>

                            <tbody id="productTable" class="table  table-bordered table-hover "></tbody>


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

<!--密品表单 -->
<div class="row" id="addForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密品信息
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <form id="edit_form">
                <div style="border: 1px solid rgb(221, 221, 221);height:130px;padding-top: 5px">
                    <table style=" height: 120px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;"
                           border="0">
                        <tr>
                            <input id="id" name="id" hidden="hidden">
                            <td style="padding-left: 24.5px">
                                密品类别 ：<select class="chosen-select" id="from_dictionaryId" name="from_dictionaryId"  data-placeholder="请选择密品类型"  style="width: 163px" title="密品类别" >
                                <option></option>
                            </select>
                                <span style="color: red;font-weight: bold"> * </span>
                                <a style="padding-left: 10px"></a>
                                密品型号 ：<input id="from_model" title="密品型号"
                                             name="from_model" type="text" maxlength="64"><span style="color: red;font-weight: bold"> * </span>
                                <a style="padding-left: 8px"></a>
                                <span id="ccbhqsz" style="text-decoration: none;">出厂编号起始值</span> ：<input  id="from_serNum" title="出厂编号起始值"
                                                 name="from_serNum" type="text"><span style="color: red;font-weight: bold"> * </span>
                            </td>

                        </tr>

                        <tr>
                            <td style="padding-left: 24.5px">
                                所属系统 ：<select  class="chosen-select" id="from_applicationId" name="from_applicationId"  data-placeholder="请选择所属系统"  style="width: 163px" title="所属系统">
                                <option></option>
                            </select>
                                <a style="padding-left: 19px"></a>
                                所属位置 ：<select class="chosen-select" id="from_locationId" name="from_locationId"  data-placeholder="请选择所属位置"  style="width: 163px" title="所属位置">
                                <option></option>
                            </select>
                                <span style="color: red;font-weight: bold"> * </span>
                                <a style="padding-left: 56px"></a>
                                责任人 ：<select class="chosen-select" id="from_sysuserId" name="from_sysuserId"  data-placeholder="请选择责任人"  style="width: 163px" title="责任人">

                            </select>
                                <span style="color: red;font-weight: bold"> * </span>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <span id="lzhqsz" style="text-decoration: none;">列装号起始值</span>  ：<input id="from_proCode" title="列装号起始值"
                                               name="from_proCode" type="text"  maxlength="11"> <span style="color: red;font-weight: bold" > * </span>
                                <a style="padding-left: 30px"></a>
                                <span  id="shuliang"> 数量 ：</span> <input id="from_count"
                                                                         name="from_count" type="text" maxlength="10"
                                                                         onkeyup="value=value.replace(/[^0-9]/g,'')" title="数量">
                                <span style="color: red;font-weight: bold" id="ico"> * </span>
                                <a style="padding-left: 68px" id="zhanwei"></a>
                                备注 ：<input type="text" id="info" name="info" title="备注"></input>
                                <span id="rfidishow" hidden="hidden">
                                    RFID编号 : <input type="text" id="rfidCode" name="rfidCode" title="RFID编号"></input>
                                </span>
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
                    <label style="padding: 6px;font-size: 12px">&nbsp;随机密件</label>
                    <span style="float:right;padding-right: 5px">
                                        <button id="btn_mijianAdd" name="btn_mijianAdd"
                                                class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-check"></i>
                                        新增随机密件</button>
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
                    <th>密品类别</th>
                    <th>位置</th>
                    <th>备注</th>
                    <th style="text-align: center;width: 200px">操作</th>
                </tr>
                </thead>
                <tbody id="mijianTable" class="table  table-bordered table-hover"></tbody>

            </table>
        </div>
    </row>


</div>

<%--随机密件表单--%>
<div class="row" id="addMiJianForm" style="display: none;margin: 20px;font-family: '微软雅黑';font-size: 12px">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            随机密件信息
        </h4>
    </div>
    <form class="form-horizontal" id="mijian_form"  style="margin-top: 20px">
        <div class="form-group">
            <input hidden="hidden" id="mijianid"/>
            <label class="col-sm-3 control-label no-padding-right" for="mijian_dictionaryId">密件类别： </label>

            <div class="col-sm-9">
                <select class="chosen-select cmijian" id="mijian_dictionaryId" name="mijian_dictionaryId"  data-placeholder="请选择密品类型" class="col-xs-9" style="width: 75%" title="密件类别">
                    <option></option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="mijian_locationId"> 所属位置：</label>
            <div class="col-sm-9">
                <select class="chosen-select cmijian" id="mijian_locationId" name="mijian_locationId"  data-placeholder="请选择所属位置"  class="col-xs-9" style="width: 75%" title="所属位置">
                    <option></option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right mijian" for="mijian_info"> 备注： </label>

            <div class="col-sm-9">
                <textarea class="form-control cmijian" id="mijian_info" style="width: 75%;height: 100px"></textarea>
            </div>
        </div>

    </form>

</div>
<%
    User user=(User)session.getAttribute("User");
%>
<div id="userid" hidden="hidden"><%=user.getuId()%></div>
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
<script src="../../js/rfid.js"></script>
<script src="../../js/UserRoleAction.js"></script>
<link rel="stylesheet" href="../../css/fontstyle.css" />
<script type="text/javascript">

    jQuery(function ($) {

        //获取密品类型
        function GetDictionary() {
            var dictionary="";
            $.ajax({
                url: "/product/selectDictionary.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var data=response.data;
                        for(var i=0;i<data.length;i++){
                            if(data[i].type=="productType"){
                                var code=response.data[i].code;
                                var value=response.data[i].value;
                                dictionary += "<option value=\"" + code + "\">" + value + "</option>"
                            }
                        }
                        $("#search_dictionaryId").append(dictionary);
                        $("#from_dictionaryId").append(dictionary);
                        $("#mijian_dictionaryId").append(dictionary);

                    }
                },
                error: function(response) {

                }
            })
        }
        GetDictionary();
        //获取责任人
        function GetUser() {
            $.ajax({
                url: "/dept/selectUserAll.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var userListHtml="";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {

                            if($("#userid").text()==data[j].id){
                                userListHtml += "<option value=\"" + data[j].id + "\">" + data[j].name + "</option>"
                            }

                        }
                        $("#search_sysuserId").append(userListHtml);
                        $("#from_sysuserId").append(userListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }
        GetUser();
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
                        var applicationListHtml="";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            applicationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].name + "</option>"
                        }
                        $("#search_applicationId").append(applicationListHtml);
                        $("#from_applicationId").append(applicationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }
        GetApplication();
        //获取位置信息
        function GetLocation() {
            $.ajax({
                url: "/location/selectALL.action",
                type: 'POST',
                dataType: 'json',
                cache:false,
                async:false,
                success : function(response) {
                    if(response.status == "true")
                    {
                        var licationListHtml="";
                        var data=response.data;
                        for (var j = 0; j <data.length; j++) {
                            licationListHtml += "<option value=\"" + data[j].id + "\">" + data[j].locinfo + "</option>"
                        }
                        $("#from_locationId").append(licationListHtml);
                        $("#mijian_locationId").append(licationListHtml);
                    }
                },
                error: function(response) {

                }
            })
        }
        GetLocation();
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

        //数据初始化
        productSelect(1);
        //查询按钮
        $('#sysuserSelectButton').on('click', function () {
            productSelect(1);
        });
        var sysuserList;
        //动态创建json对象
        function createJson(jsonObj, prop, val) {
            // 如果 val 被忽略
            if(typeof val === "undefined") {
                // 删除属性
                delete jsonObj[prop];
            }
            else {
                // 添加 或 修改
                jsonObj[prop] = val;
            }
        }
        var re=null;
        //列表查询
        function productSelect(pageIndex) {
            var paramEntity={};
            var search_data=$("#search_form").serializeArray();//获取查询中的所有的值
            for(var i=0;i<search_data.length;i++){
                var name=search_data[i].name;
                var value=search_data[i].value;
                name= name.substr(name.indexOf("_")+1,name.length-name.indexOf("_")-1);
                if(value=="") {
                    value=null;
                }
                createJson(paramEntity,name,value);
            }

            var pageIndex =pageIndex; //当前页码
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/product/select.action",
                contenType:"application/json;charse=utf-8",
                //data:JSON.stringify(page),
                data: {
                    "page": JSON.stringify(
                        {
                            "pageIndex": pageIndex, "pageSize": "10", "paramEntity": paramEntity
                        }
                    )
                },
                success: function (result) {
                    re = result;
                    var productList = re.list;

                    var productHtml = "";
                    var productMiJian ="";
                    $("#productTable").empty();
                    for (var i = 0; i < productList.length; i++) {
                        var page = (re.pageIndex - 1) * 10 + i + 1
                        if(productList[i].productId==null){
                            var id=productList[i].id;
                            var rfidCode="";
                            if(productList[i].rfidCode!=null){
                                rfidCode=productList[i].rfidCode;
                            }
                            var ckid="ckid"+id;
                            productHtml =
                                "<tr type='0'> " +
                                "<td class='center'>" +
                                " <label class='pos-rel'> " +
                                "<input type='checkbox' class='ace ck' id="+ckid+"/> " +
                                "<span class='lbl'></span> " +
                                "</label> " +
                                "</td> " +
                                "<td class='center'>"+
                                "<div class='action-buttons' id='but"+id+"'>"+
                                "<a href='#' class='green bigger-140 show-details-btn' title='Show Details'>"+
                                "<i class='ace-icon fa fa-angle-double-down showtable' ></i>"+
                                "<span class='sr-only'>Details</span>"+
                                "</a>"+
                                "</div>"+
                                "</td>"+
                                "<td hidden=hidden>" + id + "</td> " +
//                                "<td>" + page + "</td> " +
                                "<td>" + productList[i].dictionaryValue + "</td> " +
                                "<td>" + productList[i].model + "</td> " +
                                "<td>" + productList[i].proCode + "</td> " +
                                "<td>" + productList[i].serNum + "</td> " +
                                "<td>" + productList[i].applicationName + "</td> " +
                                "<td>" + productList[i].sysuserName + "</td> " +
                                "<td>" + productList[i].locInfo + "</td> " +
                                "<td style='text-align: center'>" + rfidCode + "</td> " +
                                "<td style='text-align: center;color: #2283C5;'> " +
                                "<span>" +
                                "<a style='cursor:pointer;text-decoration:none' class='productDetail'  value='" + id + "'> 查看 </a> " +
                                "<a style='cursor:pointer;text-decoration:none' class='productUpdate ishow' value='" + id + "'>| 编辑 </a>" +
                                "<a style='cursor:pointer;text-decoration:none' class='mipinDelete ishow' value='" + id + "'>| 删除 </a> " +
                                "<a style='cursor:pointer;text-decoration:none' class='mipinRfid ishow' value='" + id + "'>| 发标签 </a> " +
                                "</span>" +
                                "</td> " +
                                "</tr>"
                            var mijianList=new Array();//随机密件List
                            //判断该密品下是否有密件
                            var ismijian=0;
                            for(var j=0;j<productList.length;j++)
                            {
                                if(productList[j].productId!=null&&productList[j].productId==id)
                                {
                                    ismijian++;
                                    mijianList.push(productList[j]);
                                }
                            }
                            //如果没有密件则不出现下拉
                            if(mijianList.length!=0){
                                productHtml +="<tr class='detail-row' type='1'>" +
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
                                    productHtml += "<tr style='height: 30px' type='2'>"+
                                        "<td>" +
                                        "<label class='pos-rel'><input type='checkbox' class='ace'> <span class='lbl'></span></label></td>" +
                                        "<td style='padding-left: 20px;width: 50px'><i class='ace-icon fa fa-circle green'></i></td>" +
                                        "<td hidden=hidden >"+id+"</td>" +
                                        "<td style='padding-left: 20px'>" +item.dictionaryValue  +"</td>" +
                                        "<td style='padding-left: 40px'>RFID编号："+ rfidCode+"</td>" +
                                        "<td style='padding-left: 40px'>备注："+ item.info+"</td>" +
                                        "<td style='text-align: center;color: #2283C5;'> " +
                                        "<span>" +
//                                   "<a style='cursor:pointer;text-decoration:none' class='mijianUpdate' value='" + id + "'> 编辑 </a>" +
//                                   "|<a style='cursor:pointer;text-decoration:none' class='mijianDelete' value='" + id + "'> 删除 </a> " +
                                        "<a style='cursor:pointer;text-decoration:none' class='mijianRfid' value='" + id + "'> 发标签 </a>" +
                                        "</span>" +
                                        "</td> " +
                                        "</tr>" ;
                                })
                                productHtml +=
                                    "</table>"+
                                    "</div>" +
                                    "</div>" +
                                    "</td>" +
                                    "</tr>"
                            }
                            $("#productTable").append(productHtml);
                            if(mijianList.length==0){
                                $("#but"+id).hide();
                            }
                        }
                        else {

                        }
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
                    QuanXian();
                },
                error: function (result) {
                }
            });
        }
        function fenye(Page) {

            if(Page.totalPages==0){
                $('#data-pagination').hide();
                return;
            }
            $('#data-pagination').show();
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
                    productSelect(page);
                }
            }
            $('#data-pagination').bootstrapPaginator(options);
        }

        //清空
        $('#clearBtn').on('click', function () {
            var search_data=$("#search_form").serializeArray();
            for(var i=0;i<search_data.length;i++){
                var tname=search_data[i].name;//获取表单对象的name
                $("#"+tname).val("");
            }
        });

        //新增
        $('#btnAdd').on('click', function () {

            $("#edit_form")[0].reset();//重置表单
            var edit_data=$("#edit_form")[0];
            for(var i=0;i<edit_data.length;i++){
                var tname=edit_data[i].name;//获取表单对象的name
                $("#"+tname).removeAttr("disabled");
            }

            edit_view("Add");//启用按钮
            $("#mijianTable").html("");//清空列表
           // $("#zhanwei").css("padding-left","0px");
            $("#ccbhqsz").text("出厂编号初始值");
            $("#ccbhqsz").css("padding-left", "0px");
            $("#lzhqsz").text("列装号初始值");
            $("#lzhqsz").css("padding-left", "0px");
           var userid= $("#userid").text();
            $("#from_sysuserId").val(userid);
            $("#from_sysuserId").find("option:selected").text();//密品类别
           // $("#from_sysuserId").attr("readonly",'readonly');
            Insert("新增");



        });
        function Insert(_title) {

            layer.open({
                type: 1,
                title:_title,
                shadeClose: false,
                //shade: 0.8,
                offset:'0px',
                area: ['100%', '100%'],
                content: $('#addForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {

                    submit("insert");
                },
                btn2: function () {
                    layer.close();
                },success:function (layero,index) {
                }
            });
        }
        //保存数据
        function submit(actionName) {

            var sernum= $("#from_proCode").val();
            if(sernum.length!=11){
                layer.msg("列装号长度不正确");
                return;
            }
            var r=/^\+?[1-9][0-9]*$/;
            var str=parseInt(sernum.substr(7,4));
            if(r.test(str)==false){
                layer.msg("列装号格式不正确");
                return;
            }

            var cccode=$("#from_serNum").val();
            var cccode = cccode.substr(cccode.length - 1, 1);
            if (cccode.match(/\d+/gi) == null) {
                layer.msg('出厂编号起始值不合法', {time: 1000});
                return;
            }

            var product={};//密品
            var productList=new Array();//随机密件List
            var search_data=$("#edit_form").serializeArray();//获取表单数据
            for(var i=0;i<search_data.length;i++){
                var tname=search_data[i].name;//获取表单对象的name
                if(actionName=="insert"){
                    if(tname =="id"){
                        continue;
                    }
                    if(tname=="rfidCode"){
                        continue;
                    }
                }
                else{
                    if(tname=="rfidCode"){
                        continue;
                    }
                }
                var value=search_data[i].value;//获取表单对象的值
                var title=$("#"+tname).attr("title");//获取表单中对象的名称
                var name= tname.substr(tname.indexOf("_")+1,tname.length-tname.indexOf("_")-1);
                if(value=="") {
                    value=null;
                }
                if(name=="applicationId"||name=="info"){
                }
                else{
                    if(value==null){
                        if(actionName=="update"&&name=="count")
                        {

                        }
                        else{
                            layer.msg( title +" 不允许为空");
                            return;
                        }

                    }
                }

                createJson(product,name,value);

            }
            product.sysUserId=$("#from_sysuserId").val();
            var mijiantable=$("#mijianTable").find("tr");//获取密件的信息
            for(j=0;j<mijiantable.length;j++){
                var id= mijiantable.eq(j).find("a").eq(0).attr("value");
                var dictionaryId= mijiantable.eq(j).find("td").eq(2).text();
                var locationId= mijiantable.eq(j).find("td").eq(4).text();
                var info=mijiantable.eq(j).find("td").eq(6).text();
                var mijian={
                    id:id,
                    dictionaryId:dictionaryId,
                    locationId:locationId,
                    info:info
                };
                productList.push(mijian);
            }
            layer.load(2);
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/product/"+actionName+".action",
                traditional: true,
                data: {
                    "product": JSON.stringify(product),
                    "productList":JSON.stringify(productList)
                },
                success: function (result) {
                    layer.msg(result.msg);
                    layer.closeAll();
                    productSelect(1);

                },
                error: function () {
                    layer.msg('操作异常', {time: 1000});
                }
            });

        }
        $("#btn_mijianAdd").on('click',function () {
            AddMiJian("新增",null);
        })
        //新增随机密件
        function AddMiJian(_title,row) {


            layer.open({
                type: 1,
                title: _title,
                shadeClose: false,
                area: ['45%', '55%'],
                content: $('#addMiJianForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function (index) {

                    var mijian_data=$("#mijian_form").serializeArray();//获取表单数据
                    for(var i=0;i<mijian_data.length;i++){
                        var tname=mijian_data[i].name;//获取表单对象的name

                        var title=$("#"+tname).attr("title");//获取表单中对象的名称
                        var value=mijian_data[i].value;//获取表单对象的值
                        if(value==""){
                            layer.msg(title+"不允许为空");
                            return;
                        }
                    }
                    _title=="新增"
                    setmijianTable(_title,row);
                    layer.close(index);
                   $(".cmijian").val("");


                }, btn2: function () {

                }
            })
        }
        //动态插入随机密件
        function setmijianTable(title,row) {
            var mijian_dictionaryId=  $("#mijian_dictionaryId").val();//密品类别ID
            var mijian_dictionaryName=  $("#mijian_dictionaryId").find("option:selected").text();//密品类别
            var mijian_locationId=  $("#mijian_locationId").val();//位置ID
            var mijian_locationName=  $("#mijian_locationId").find("option:selected").text();//位置ID
            var mijian_info=  $("#mijian_info").val();
            var length= $("#mijianTable").find("tr").length;
            var index=length+1;
            if(title=="新增"){
                var mijianTableHtml =
                    "<tr> " +
                    "<td class='center'>" +
                    " <label class='pos-rel'> " +
                    "<input type='checkbox' class='ace'/> " +
                    "<span class='lbl'></span> " +
                    "</label> " +
                    "</td> " +
                    "<td>" +index  + "</td> " +
                    "<td hidden=hidden>" + mijian_dictionaryId + "</td> " +
                    "<td>" + mijian_dictionaryName + "</td> " +
                    "<td hidden=hidden>" + mijian_locationId + "</td> " +
                    "<td>" + mijian_locationName + "</td> " +
                    "<td>" + mijian_info + "</td> " +
                    "<td style='text-align: center;color: #2283C5;'> " +
                    "<span>" +
                    "<a style='cursor:pointer;text-decoration:none' class='edit_mijianUpdate' value='" + index+ "'> 编辑 </a>" +
                    "|<a style='cursor:pointer;text-decoration:none' class='del_mijianDelete' value='" + index + "'> 删除 </a> " +
                    "</span>" +
                    "</td> " +
                    "</tr>"

                $("#mijianTable").append(mijianTableHtml);
            }
            else{

                row.find("td").eq(2).html(mijian_dictionaryId);
                row.find("td").eq(3).html(mijian_dictionaryName);
                row.find("td").eq(4).html(mijian_locationId);
                row.find("td").eq(5).html(mijian_locationName);
                row.find("td").eq(6).html(mijian_info);

            }

        }
        //批量删除
        $('#btnDel').on('click', function () {
            var child = $("#productTable").parents('table').find('tbody input[type="checkbox"]');
            var trs= $("#productTable").find("tr");

            var rows = [];//被选中的数据Id
            var count = 0;
            trs.each(function (index, item) {

                var type=$("#productTable").find("tr").eq(index).attr("type");//获取自定义类型判断是密品还是密件0-密品 1-密件
                if(type==0){
                    var check= $("#productTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');//判断是否选中
                    if( check[0].checked==true){
                        var id=$("#productTable").find("tr").eq(index).find("td").eq(2).text();
                        rows[count++] =id;
                    }
                }
                else if(type==2){
                    var check= $("#productTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');
                    if( check[0].checked==true){
                        var id= $("#productTable").find("tr").eq(index).find("td").eq(2).text();
                        rows[count++] =id;
                    }
                }
            });
            ProductDelete(rows);
        });
        //编辑
        $(document).on("click", ".productUpdate", function () {
            var id= this.getAttribute("value");
            eidt("编辑密品",id);
            edit_view("edit");
        });
        function eidt(title,id) {
            var id=id;
            var productList=re.list;
            var mipin=null;//密品
            var mijian=[];//密件
            for(var i=0;i<productList.length;i++){
                if(productList[i].id==id){
                    mipin=productList[i];
                    break;
                }
            }
            //密件
            for(var i=0;i<productList.length;i++){
                if(productList[i].productId==id){
                    mijian.push(productList[i]);
                }
            }
            $("#mijianTable").html("");
            productUpdate(mipin,mijian,title);
        }
        function productUpdate(mipin,mijian,_title) {
            //给表单赋值
            var edit_data=$("#edit_form")[0];
            for(var i=0;i<edit_data.length;i++){
                var tname=edit_data[i].name;//获取表单对象的name
                var title=$("#"+tname).attr("title");//获取表单中对象的名称
                var name= tname.substr(tname.indexOf("_")+1,tname.length-tname.indexOf("_")-1);
                if(tname=="from_count"){
                    $("#"+tname).hide();
                    $("#shuliang").hide();
                    $("#ico").hide();
                    $("#zhanwei").css("padding-left","0px");
                }
                $("#"+tname).val(mipin[name]);
                if(_title=="查看密品"){
                    $("#"+tname).attr("disabled","disabled");
                }
                else{
                    $("#"+tname).removeAttr("disabled");
                }

            }
            for(var i=0;i<mijian.length;i++){
                BindMiJian(mijian[i],i+1);
            }

            layer.open({
                type: 1,
                title: _title,
                shadeClose: true,
                offset:'0px',
                area: ['100%', '100%'],
                content: $('#addForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function () {
                    submit("update");
                },
                btn2: function () {
                    layer.close();
                },success:function (layero,index) {

                }
            });
        }
        //绑定密件信息
        function BindMiJian(obj,index) {
            var mijianTableHtml =
                "<tr> " +
                "<td class='center'>" +
                " <label class='pos-rel'> " +
                "<input type='checkbox' class='ace'/> " +
                "<span class='lbl'></span> " +
                "</label> " +
                "</td> " +
                "<td>" +index  + "</td> " +
                "<td hidden=hidden>" + obj.dictionaryId + "</td> " +
                "<td>" + obj.dictionaryValue + "</td> " +
                "<td hidden=hidden>" + obj.locationId + "</td> " +
                "<td>" + obj.locInfo + "</td> " +
                "<td>" + obj.info + "</td> " +
                "<td style='text-align: center;color: #2283C5;'> " +
                "<span>" +
                "<a style='cursor:pointer;text-decoration:none' class='edit_mijianUpdate' value='" + obj.id+ "'> 编辑 </a>" +
                "|<a style='cursor:pointer;text-decoration:none' class='del_mijianDelete' value='" + obj.id + "'> 删除 </a> " +
                "</span>" +
                "</td> " +
                "</tr>"

            $("#mijianTable").append(mijianTableHtml);
        }
        //删除一个密品同时删除随机密件
        $(document).on("click", ".mipinDelete", function () {
            var rows=[]
            rows[0]= this.getAttribute("value");
            ProductDelete(rows);

        });
        function ProductDelete(deleteList) {
            layer.confirm(
                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'>删除将会删除密品以及随机密件</div><div style='text-align: center'> 是否确认删除？</div>",
                function () {
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/product/delete.action",
                        traditional: true,
                        data: {
                            "deleteList": deleteList
                        },
                        success: function (result) {
                            re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                productSelect(1);
                                $("#qx").attr("checked",false);

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
        //编辑密件
        $(document).on("click", ".edit_mijianUpdate", function () {

            var row= $(this).parent().parent().parent();
            // var id= row.find("td").eq(1).text();
            var dictionaryId= row.find("td").eq(2).text();
            var locationId=row.find("td").eq(4).text();
            var info=row.find("td").eq(6).text();
            $("#mijian_dictionaryId").val(dictionaryId);//密品类别ID
            $("#mijian_dictionaryId").find("option:selected").text();//密品类别
            $("#mijian_locationId").val(locationId);//位置ID
            $("#mijian_locationId").find("option:selected").text();//位置ID
            $("#mijian_info").val(info);

            AddMiJian("编辑",row);
        });
        //删除密件
        $(document).on("click", ".del_mijianDelete", function (){

            var id=  this.getAttribute("value");
            var row= $(this).parent().parent().parent();

            //重新计算序列号
            var tr= $("#mijianTable").find("tr");
            for(var i=0;i<tr.length;i++){
                tr.eq(i).find("td").eq(1).text(i+1);
            }
            var rows = [];//被选中的数据Id
            rows[0]=id;
            delMiJian(rows,row);
        });


        //查看
        $(document).on("click", ".productDetail", function (){
            var id= this.getAttribute("value");
            eidt("查看密品",id);
            edit_view("view");
        })
        //根据是查看还是编辑不同的状态来控制按钮的状态
        function edit_view(type) {
            if(type=="view"){
                $("#btn_mijianAdd") .hide();
                $("#mijian-table tr").find("th:eq(0)").hide();
                $("#mijian-table tr").find("th:eq(5)").hide();
                $("#mijian-table tr").find("td:eq(0)").hide();
                $("#mijian-table tr").find("td:eq(7)").hide();
                $(".layui-layer-btn0").hide();

                $("#from_count").hide();
                $("#shuliang").hide();
                $("#ico").hide();
                $("#zhanwei").css("padding-left","0px");
                $("#ccbhqsz").css("padding-left", "35px");
                $("#ccbhqsz").text("出厂编号");

                $("#lzhqsz").text("列装号");
                $("#lzhqsz").css("padding-left", "35px");
                $("#rfidishow").show();
                $("#rfidCode").attr("disabled","disabled");
                $("#rfidishow").css("padding-left","61px");
            }
            else{
                $("#btn_mijianAdd") .show();
                $("#mijian-table tr").find("th:eq(0)").show();
                $("#mijian-table tr").find("th:eq(5)").show();
                $("#mijian-table tr").find("td:eq(0)").show();
                $("#mijian-table tr").find("td:eq(7)").show();
                if(type=="Add"){
                    $("#from_count").show();
                    $("#shuliang").show();
                    $("#ico").show();
                    $("#zhanwei").css("padding-left","65px");
                    $("#rfidishow").hide();
                }
                $(".layui-layer-btn0").show();
                $("#ccbhqsz").text("出厂编号");
                $("#ccbhqsz").css("padding-left", "35px");
                $("#lzhqsz").text("列装号");
                $("#lzhqsz").css("padding-left", "35px");
                if(type=="edit"){
                    $("#rfidishow").show();
                    $("#rfidCode").attr("disabled","disabled");
                    $("#rfidishow").css("padding-left","61px");
                }
               // $("#rfidishow").show();

            }

        }
//删除密件
        function  delMiJian(deleteList,row) {
            layer.confirm(
                "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'> 是否确认删除？</div>",
                function () {
                    $.ajax({
                        type: "post",
                        dataType: "html",
                        url: "/product/delete.action",
                        traditional: true,
                        data: {
                            "deleteList": deleteList
                        },
                        success: function (result) {
                            re = JSON.parse(result)
                            if (re.status == ("true")) {
                                layer.msg(re.msg, {time: 1000});
                                row.remove();
                                productSelect(1);

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
//密品标签注册
        $(document).on("click", ".mipinRfid", function (){
            var id= $(this).attr("value");
            var type= $(this).parent().parent().parent().find("td").eq(3).text();//U盘、光盘类型
            var proCode= $(this).parent().parent().parent().find("td").eq(5).text();
            var td= $(this).parent().parent().parent().find("td").eq(10);

            readcard(id,type,proCode,td);

        })
        //密件标签注册
        $(document).on("click", ".mijianRfid", function (){
            var id= $(this).attr("value");
            var type= $(this).parent().parent().parent().find("td").eq(3).text();//U盘、光盘类型
            var proCode=$(this).parent().parent().parent().find("td").eq(5).text();
            var td= $(this).parent().parent().parent().find("td").eq(4);

            readcard(id,type,proCode,td);

        })




        //选中密品的同时选中密品下的密件用户发标签
//        $(document).on("change", ".ck", function () {
//          var ck=  $(this)[0].checked;
//          //选中
//          if(ck==true){
//             var row= $(this).parent().parent().parent().next();
//              if(row.attr("type")){
//                 var tr=row.find("table tbody").find("tr");
//                 for(var i=0;i<tr.length;i++){
//                     var ck= tr.eq(i).find("td").find('input[type="checkbox"]')[0];
//                   ck.checked=true;
//                     rfid={
//                         pro_code:tr.eq(i).find("td").eq(3).text(),
//                         type:2
//                     }
//                 }
//              }
//          }
//          //取消选中
//          if(ck==false){
//              var row= $(this).parent().parent().parent().next();
//              if(row.attr("type")){
//                  var tr=row.find("table tbody").find("tr");
//                  for(var i=0;i<tr.length;i++){
//                      var ck= tr.eq(i).find("td").find('input[type="checkbox"]')[0];
//                      ck.checked=false;
//                  }
//              }
//          }
//
//        });

        //发标签
//        $("#btnRFID").click(function () {
//          var rfidList=[];
//            var child = $("#productTable").parents('table').find('tbody input[type="checkbox"]');
//            var trs= $("#productTable").find("tr");
//            var count = 0;
//            var title="";
//            trs.each(function (index, item) {
//                var type=$("#productTable").find("tr").eq(index).attr("type");//获取自定义类型判断是密品还是密件0-密品 1-密件
//                if(type==0){
//                    var check= $("#productTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');//判断是否选中
//                    if( check[0].checked==true){
//                        var id=$("#productTable").find("tr").eq(index).find("td").eq(2).text();
//                        var proCode=$("#productTable").find("tr").eq(index).find("td").eq(5).text();
//                        var  rfid={
//                            proCode:proCode,
//                            state:"0"
//                        }
//                        rfidList.push(rfid);
//                    }
//                }
//                else if(type==2){
//                    var check= $("#productTable").find("tr").eq(index).find("td").find('input[type="checkbox"]');
//                    if( check[0].checked==true){
//                        var proCode=$("#productTable").find("tr").eq(index).find("td").eq(3).text();
//                        var  rfid={
//                            proCode:proCode,
//                            state:"2"
//                        }
//                        rfidList.push(rfid);
//                    }
//                }
//            });
//            if(rfidList.length>0){
//                for(var i=0;i<rfidList.length;i++){
//                    var ProCode=rfidList[i].proCode;
//                    if(rfidList[i].state=="0"){
//                        title="密品标签注册"
//                    }
//                    else{
//                        title="随机密件标签注册"
//                    }
//                     interval=setInterval(function () {
//                        readcard();
//                    },2000)
//                }
//            }
//        })

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
                            var text = "该密品类别与标签不匹配,请选用 [" + type + "] 标签";
                            layer.msg(text);
                        }
                        else {
                            var text = "<div style='text-align: center;font-size:12px;font-family: '微软雅黑'>标签：" + epc + "</div>" +
                                "<div style='text-align:center;font-size:12px;font-family: '微软雅黑'> 是否绑定给" + proCode + " </div>";
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
        function rfidUpdate(product,td) {
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
                       if(td.context.className=="mipinRfid"){
                           td.text(product.rfidCode);
                       }
                       else{
                           td.text("RFID编号："+product.rfidCode);
                       }

                    } else if (re.status == "false") {
                        layer.msg(re.msg, {time: 2000});
                    }
                },
                error: function (result) {
                    layer.msg('绑定异常！', {time: 1000});
                }
            });
        }
        var userroleaction={
            uid:'',
            menuId:'2'
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
<script type="application/javascript">


</script>
</html>
