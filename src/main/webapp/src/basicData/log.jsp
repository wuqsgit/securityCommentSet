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
    <title>日志</title>

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
    <link rel="stylesheet" href="../../assets/css/daterangepicker.css"/>

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
                        <i class="ace-icon fa fa-home home-icon"></i>日志
                    </li>
                </ul>

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content" >
                <div class="row">
                    <div class="col-xs-12" style="height: 68px;padding-left: 0px;padding-right: 0px">
                        <form>
                            <div style="border: 1px solid rgb(221, 221, 221);height:60px;padding-top: 13px;min-width: 800px">
                                <table style="font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 500px;margin: auto"
                                       border="0">
                                    <td>
                                        操作人：<input id="searchname"
                                                  name="searchname" type="text" maxlength="64">
                                        <a style="padding-left: 10px"></a>
                                        时间范围：<input class="" type="text"
                                                    name="date-range-picker" style="width: 200px"
                                                    readonly="readonly" id="searchtime"/>
                                    </td>
                                    <td style="padding-left: 5px;width: 150px">
                                        <button type="button" id="logSelectButton"
                                                name="logSelectButton" class="btn btn-info btn-xs"
                                                style="margin-top: 0px">
                                            <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                                        </button>&nbsp;
                                        <button type="button" id="logCleanButton" name="sysuserCleanButton"
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
                                <label style="padding: 6px;font-size: 12px">&nbsp;日志信息列表</label>
                            </div>
                            <tr style="height: 30px">
                                <th width="50px" style="text-align: center">序号</th>
                                <th width="10%">操作人</th>
                                <th width="10%">角色</th>
                                <th width="10%">菜单</th>
                                <th width="10%" style="text-align: center">操作</th>
                                <th>详细</th>
                                <th width="10%">时间</th>
                            </tr>
                            </thead>
                            <tbody id="logTable">

                            </tbody>
                        </table>
                        <div class="padlr" align="right" style="cursor: pointer">
                           <div style="float: left;font-family: 微软雅黑;color: #1c6ca2;height: 32px;padding-top: 5px;margin-left: 5px;" id ="count">
                           </div>
                            <div style="float: left;margin-left: 15px;">
                               <font style="font-family: 微软雅黑;color: #1c6ca2;margin-right: 5px"> 每页 </font>  <select id ='selectpagesize'style="border-color: #c1d1d7">
                                    <option>10</option>
                                    <option>20</option>
                                    <option>30</option>
                                </select>
                                <%--<font style="font-family: 微软雅黑;color: #1c6ca2;margin-right: 5px;margin-left: 15px"> 跳转到 </font>--%>
                                <%--<select id ='topageIndex'style="border-color: #c1d1d7">--%>

                                <%--</select>--%>
                            </div>

                            <ul id="data-pagination" class="pagination">
                            </ul>
                        </div>
                    </div><!-- /.span -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->





<!-- basic scripts -->

<!--[if !IE]> -->
<script src="../../components/jquery/dist/jquery.js"></script>
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
<link rel="stylesheet" href="../../css/fontstyle.css"/>
<script src="/js/template-web.js"></script>
<script id="test" type="text/html">
    {{each list value i}}
    <tr>
        <td>{{i + 1}}</td>
        <td>{{value.sysuserId}}</td>
        <td>{{value.roleId}}</td>
        <td>{{value.menu}}</td>
        <td style="text-align: center">{{value.operationType}}</td>
        <td>{{value.info}}</td>
        <td style="text-align: center">{{value.createTime}}</td>
    {{/each}}
</script>
<script type="text/javascript">
    jQuery(function ($) {
        //日期控件初始化
        $('input[name=date-range-picker]').daterangepicker().prev().on(ace.click_event, function () {
            $(this).next().focus();
        });
        //查询按钮
        $('#logSelectButton').on('click', function () {
            selectlog(1);
        });
        //重置
        $('#logCleanButton').on('click', function () {
            sysuserClean();
            selectlog(1);
        });
        function sysuserClean() {
            $('#searchname').val(null);
            $('#searchtime').val(null);
        }
    })
    selectlog(1);
    //获取数据
    function getdata(pageIndex) {
        var data=null;
       var pageSize= $("#selectpagesize").val();
        var paramEntity={
            sysuserId:$("#searchname").val(),
            createTime:$("#searchtime").val()
        };
        var data={
            "page": JSON.stringify(
                {
                    "pageIndex": pageIndex, "pageSize": pageSize, "paramEntity": paramEntity
                }
            )
        }
        //ajax获取数据
        $.ajax({
            async:false,
            type: "post",
            dataType: "json",
            url: "/log/select.action",
            data: data,
            success: function (result) {
                data= result;
            }
        });
        return data;
    }

    //分页
    function fenye(data) {
        var options = {
            bootstrapMajorVersion: 3,
            currentPage: data.pageIndex,    //变量名必须为currentPage
            totalPages: data.totalPages,    //变量名必须为totalPages
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
                selectlog(page);
            }
        };
        $('#data-pagination').bootstrapPaginator(options);

    }
    //总页数
function PageCount(totalPages) {
    var selecthtml="";
    for(var i=1;i<=totalPages;i++)
    {
        selecthtml+="<option>"+i+"</option>";
    }
    document.getElementById('topageIndex').innerHTML = selecthtml;
}
    $("#topageIndex").on('change', function () {
        selectlog(this.value);
    })
    //查询日志


//一页显示多少
$("#selectpagesize").on('change', function () {
    selectlog(1);
});
</script>
<link rel="stylesheet" href="../../assets/css/ace.onpage-help.css"/>
<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../../assets/js/src/elements.onpage-help.js"></script>
<script src="../../assets/js/src/ace.onpage-help.js"></script>
</body>
</html>