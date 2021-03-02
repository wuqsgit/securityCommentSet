<%--
  Created by IntelliJ IDEA.
  User: 706
  Date: 2017/7/7
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
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
    <link rel="stylesheet" href="../../assets/css/daterangepicker.css"/>

    <script src="../../assets/js/ace-extra.js"></script>
    <script type="text/javascript" src="../../js/echarts3/echarts.js"></script>

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
    <link rel="stylesheet" href="../../css/table.css"/>
    <script src="../../layer/layer.js"></script>
    <script src="../../js/bootstrap-paginator.js"></script>
    <script src="../../js/convertnull.js"></script>
    <link rel="stylesheet" href="../../css/fontstyle.css" />
</head>
<body style="width: 99%">

<div class="main-container" id="main-container">

    <div class="main-container-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs" style="background-color: white">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>统计分析
                </li>
            </ul>

        </div>
        <!--/.breadcrumbs-->

        <div class="row" style="margin-top: 1%">
            <div class="col-sm-4">
                <div class="widget-box">
                    <div class="widget-header widget-header-flat widget-header-small">
                        <h5>
                            <i class="icon-signal"></i>
                            系统密品统计
                        </h5>
                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="applicationNum1" style="left:2%;height:300px;width:100%"></div>
                            </div>
                            <!-- /widget-main -->
                        </div>
                        <!-- /widget-body -->
                    </div>
                    <!-- /widget-box -->
                </div>
            </div>
            <div class="col-sm-4">
                <div class="widget-box">
                    <div class="widget-header widget-header-flat widget-header-small">
                        <h5>
                            <i class="icon-signal"></i>
                            密品类别统计
                        </h5>
                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="applicationNum2" style="height:300px;width:100%"></div>
                            </div>
                            <!-- /widget-main -->
                        </div>
                        <!-- /widget-body -->
                    </div>
                    <!-- /widget-box -->
                </div>
            </div>
            <div class="col-sm-4">
                <div class="widget-box">
                    <div class="widget-header widget-header-flat widget-header-small">
                        <h5>
                            <i class="icon-signal"></i>
                            密品位置统计
                        </h5>
                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="applicationNum3" style="height:300px;width:100%"></div>
                            </div>
                            <!-- /widget-main -->
                        </div>
                        <!-- /widget-body -->
                    </div>
                    <!-- /widget-box -->
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 3%">
            <div class="col-sm-6">
                <div class="widget-box">
                    <div class="widget-header widget-header-flat widget-header-small">
                        <h5>
                            <i class="icon-signal"></i>
                            清点/清退计划
                        </h5>

                        <div class="jys-toolbar no-border">
                            <select id="deptlate" onchange="deptLateChange()">
                                <option id="1" value="monthLateTime">清点计划统计</option>
                                <option id="2" value="dayLateTime">清退计划统计</option>
                            </select>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="depttoptenlate" style="height:210px;width:100%"></div>
                            </div>
                            <!-- /widget-main -->
                        </div>
                        <!-- /widget-body -->
                    </div>
                    <!-- /widget-box -->
                </div>
            </div>
            <div class="col-sm-6">
                <div class="widget-box">
                    <div class="widget-header widget-header-flat widget-header-small">
                        <h5>
                            <i class="icon-signal"></i>
                            人员预警
                        </h5>

                        <div class="jys-toolbar no-border">
                            <select id="topoutwork" onchange="topOutWorkChange()">
                                <option id="3" value="yearEarlyAttence">最近30天统计</option>
                                <option id="2" value="weekAttence">最近7天统计</option>
                                <option id="1" value="dayEarlyAttence">最近1天统计</option>

                            </select>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="depttopearly" style="height:210px;width:100%"></div>
                            </div>
                            <!-- /widget-main -->
                        </div>
                        <!-- /widget-body -->
                    </div>
                    <!-- /widget-box -->
                </div>
            </div>
        </div>

    </div>

    <!--/.page-content-->

    <!-- ./main-content -->

</div>
<!-- /.main-container-inner-->

<!-- /.main-container-->

<!--密品表单 -->
<div class="row" id="addForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密品详情
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <table id="mijian-table" class="table  table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <tr style="height: 30px;">
                    <th width="50px" style="text-align: center">序号</th>
                    <th>列装号</th>
                    <th>出厂编号</th>
                    <th>密品类别</th>
                    <th>密品型号</th>
                    <th>密品RFID号</th>
                    <th>所属系统</th>
                    <th>所属单位</th>
                    <th>操作类别</th>
                </tr>
                </thead>
                <tbody id="mijianTable" class="table  table-bordered table-hover"></tbody>

            </table>
        </div>
    </row>
</div>

<!--密品表单 -->
<div class="row" id="addForm-month" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            统计详情
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <table id="mijian-table-month" class="table  table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <tr style="height: 30px;">
                    <th width="50px" style="text-align: center">序号</th>
                    <th>所属部门</th>
                    <th>所属系统</th>
                    <th>密品类别</th>
                    <th>创建人</th>
                    <th>创建时间</th>
                    <th>完成时间</th>
                    <th>执行人</th>
                    <th>状态</th>
                    <th>清点结果</th>
                    <th style="text-align: center;width: 200px">操作</th>
                </tr>
                </thead>
                <tbody id="mijianTable-month" class="table  table-bordered table-hover"></tbody>

            </table>
        </div>
    </row>
</div>

<!--密品表单 -->
<div class="row" id="addForm-detail" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密品详情
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <table id="mijian-table-detail" class="table  table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <tr style="height: 30px;">
                    <th width="50px" style="text-align: center">序号</th>
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
                <tbody id="mijianTable-detail" class="table  table-bordered table-hover"></tbody>

            </table>
        </div>
    </row>
</div>

<!--密品表单 -->
<div class="row" id="addForm-month-t" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            统计详情
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <table id="mijian-table-month-t" class="table  table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <tr style="height: 30px;">
                    <th width="50px" style="text-align: center">序号</th>
                    <th>所属部门</th>
                    <th>所属系统</th>
                    <th>密品类别</th>
                    <th>创建时间</th>
                    <th>完成时间</th>
                    <th>状态</th>
                    <th>备注</th>
                    <th style="text-align: center;width: 200px">操作</th>
                </tr>
                </thead>
                <tbody id="mijianTable-month-t" class="table  table-bordered table-hover"></tbody>

            </table>
        </div>
    </row>
</div>

<!--密品表单 -->
<div class="row" id="addForm-detail-t" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            密品详情
        </h4>
    </div>
    <row>
        <div class="col-xs-12">
            <table id="mijian-table-detail-t" class="table  table-bordered table-hover" style="min-width: 800px;">
                <thead>
                <tr style="height: 30px;">
                    <th width="50px" style="text-align: center">序号</th>
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
                <tbody id="mijianTable-detail-t" class="table  table-bordered table-hover"></tbody>

            </table>
        </div>
    </row>
</div>


<script type="text/javascript" src="../../js/analyze.js"></script>
<script type="text/javascript">
    getDeptMonthTopTenLateWorker();
    getOftenUse(1);
    getApplicationNum();
    getProductNumByType();
    getProductNumByLocation();
    //  getDeptMonthTopTenOutWorker();
    //  getDeptMonthTopTenAllAttenceWorker();
    function deptLateChange() {
        var obj = document.getElementById("deptlate");
        var lateId = obj.options[obj.selectedIndex].id;
        if (lateId == "1") {
            getDeptMonthTopTenLateWorker();
        }
        else if (lateId == "2") {
            getDeptDayTopTenLateWorker();
        }
    }
    function topOutWorkChange() {
        var obj = document.getElementById("topoutwork");
        var lateId = obj.options[obj.selectedIndex].id;
        if (lateId == "1") {
            getOftenUse(1);
        }
        else if (lateId == "2") {
            getOftenUse(7);
        }
        else if (lateId == "3") {
            getOftenUse(30);
        }
    }
</script>

</body>
</html>
