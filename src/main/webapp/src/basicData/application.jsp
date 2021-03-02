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
            <i class="ace-icon fa fa-home home-icon"></i>
            <%--<img src="../../img/menu/jcsj.png">--%>
            基础数据
          </li>
          <li class="active">系统信息维护</li>
        </ul>

      </div>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">
        <div class="row">
          <div class="col-xs-12" style="height: 68px;;padding-left: 0px;padding-right: 0px">
            <form>
              <div style="border: 1px solid rgb(221, 221, 221);height:60px;padding-top: 13px;min-width: 800px">
                <table style="font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 600px;margin: auto"
                       border="0">
                  <td>
                    系统名称：<input id="applicationSelectName"
                              name="applicationSelectName" type="text"
                     >
                    <a style="padding-left: 10px"></a>
                    备注信息：<input id="applicationSelectInfo"
                              name="applicationSelectInfo" type="text"
                              ></td>
                  <td style="padding-left: 5px;width: 150px">
                    <button type="button" id="applicationSelectButton"
                            name="applicationSelectButton" class="btn btn-info btn-xs"
                            style="margin-top: 0px">
                      <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>查询
                    </button>&nbsp;
                    <button type="button" id="applicationCleanButton" name="applicationCleanButton"
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
        <div class="row" >
          <div class="col-xs-12" style=";padding-left: 0px;padding-right: 0px">
            <table id="simple-table" class="table  table-bordered table-hover">
              <thead>

              <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                <label style="padding: 6px;font-size: 12px">&nbsp;系统信息列表</label>
                                <span style="float:right;padding-right: 5px">
                                        <button id="applicationInsertButton" name="applicationInsertButton"
                                                class="btn btn-xs btn-success">
                                          <i class="ace-icon fa fa-check"></i>
                                          新增</button>
                                        <button id="applicationDeleteButton" name="applicationDeleteButton"
                                                class="btn btn-xs  btn-danger">
                                          <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                          删除</button>
                                        <%--<button id="applicationInputButton" name="applicationInputButton"--%>
                                                <%--class="btn btn-sm btn-primary" hidden="hidden">--%>
                                          <%--<i class="ace-icon fa fa-trash-o align-top bigger-125"></i>--%>
                                          <%--导入</button>--%>
                                        <%--<button id="applicationOutputButton" name="applicationOutputButton"--%>
                                               <%--class="btn btn-sm btn-primary"  hidden="hidden">--%>
                                         <%--<i class="ace-icon fa fa-trash-o align-top bigger-125"></i>--%>
                                         <%--导出</button>--%>
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
                <th>系统名称</th>
                <th>备注</th>
                <th style="text-align: center;width: 200px">操作</th>
              </tr>
              </thead>
              <tbody id="applicationTable">
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
      系统信息维护
    </h4>
  </div>
  <form class="form-horizontal" role="form" style="margin-top: 20px">
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right" for="addFormName">名称： </label>
      <div class="col-sm-9">
        <input type="text" id="addFormName" class="col-xs-9">
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right" for="addFormInfo">备注： </label>
      <div class="col-sm-9">
        <textarea type="text" id="addFormInfo" class="col-xs-9"></textarea>
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
<link rel="stylesheet" href="../../css/table.css"/>
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

    //数据初始化
    applicationSelect();
    //查询按钮
    $('#applicationSelectButton').on('click', function () {
      applicationSelect(this);
    });
    var applicationList;

    function applicationSelect() {
      var applicationSelectName = $('#applicationSelectName').val();
      var applicationSelectInfo = $('#applicationSelectInfo').val();
      var pageIndex = 1;
      $.ajax({
        type: "post",
        dataType: "html",
        url: "/application/select.action",
        traditional: true,
        data: {
          "pageIndex": pageIndex,
          "name": applicationSelectName,
          "info": applicationSelectInfo
        },
        success: function (result) {
          var re = JSON.parse(result);
          applicationList = re.list;

          var applicationHtml = "";

          for (var a = 0; a < applicationList.length; a++) {
            var page = (re.pageIndex - 1) * 10 + a + 1
            applicationHtml +=
                    "<tr> " +
                    "<td class='center'>" +
                    " <label> " +
                    "<input type='checkbox' class='ace'/> " +
                    "<span class='lbl'></span> " +
                    "</label> " +
                    "</td> " +
                    "<td>" + page + "</td> " +
                    "<td>" + applicationList[a].name + "</td> " +
                    "<td>" + applicationList[a].info + "</td> " +
                    "<td style='text-align: center'> " +
                    "<span style='width: 150px'>" +
                    "<a style='cursor:pointer;text-decoration:none' class='applicationDetail' value='" + a + "'> 查看 </a>" +
                    "|<a style='cursor:pointer;text-decoration:none' class='applicationUpdate' value='" + a + "'> 编辑 </a>" +
                    "|<a style='cursor:pointer;text-decoration:none' class='applicationDelete' value='" + a + "'> 删除 </a>" +
                    "</span> " +
                    "</td> " +
                    "</tr>"
          }
          $("#applicationTable").empty();
          $("#applicationTable").append(applicationHtml);

          if(applicationList == null){
              $('#data-pagination').hide();
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
                url: "/application/select.action",
                traditional: true,
                data: {
                  "pageIndex": page,
                  "name": applicationSelectName,
                  "info": applicationSelectInfo
                }, success: function (result) {
                  var re = JSON.parse(result);
                  applicationList = re.list;

                  var applicationHtml = "";

                  for (var a = 0; a < applicationList.length; a++) {
                    var page = (re.pageIndex - 1) * 10 + a + 1
                    applicationHtml +=
                            "<tr> " +
                            "<td class='center'>" +
                            " <label> " +
                            "<input type='checkbox' class='ace'/> " +
                            "<span class='lbl'></span> " +
                            "</label> " +
                            "</td> " +
                            "<td>" + page + "</td> " +
                            "<td>" + applicationList[a].name + "</td> " +
                            "<td>" + applicationList[a].info + "</td> " +
                            "<td> " +
                            "<div> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='applicationUpdate' value='" + a + "'> 编辑 </a>" +
                            "|<a style='cursor:pointer;text-decoration:none' class='applicationDetail' value='" + a + "'> 查看 </a>" +
                            "|<a style='cursor:pointer;text-decoration:none' class='applicationDelete' value='" + a + "'> 删除 </a>" +
                            "</span> " +
                            "</td> " +
                            "</tr>"                                    }
                  $("#applicationTable").empty();
                  $("#applicationTable").append(applicationHtml);
                }
              });
            }
          };
            $('#data-pagination').show();
          $('#data-pagination').bootstrapPaginator(options);
        },
        error: function (result) {
        }
      });
    }

    //重置
    $('#applicationCleanButton').on('click', function () {
      applicationClean();
      applicationSelect();
    });
    function applicationClean() {
      $('#applicationSelectName').val("");
      $('#applicationSelectInfo').val("");
    }

    //新建
    $('#applicationInsertButton').on('click', function () {
      applicationInsert(this);
    });
    function applicationInsert() {
      $("#addFormName").val("");
      $("#addFormInfo").val("");
      $("#addFormName").attr("disabled", false);
      $("#addFormInfo").attr("disabled", false);
      layer.open({
        type: 1,
        title: '新增',
        shadeClose: false,
        //shade: 0.8,
        area: ['40%', '50%'],
        content: $('#addForm'),
        btn: ['保存', '关闭'],
        btnAlign: 'c', //按钮居中
        yes: function () {
          // $(that).click();
          var addFormName = $("#addFormName").val();
          var addFormInfo = $("#addFormInfo").val();
          $.ajax({
            type: "post",
            dataType: "html",
            url: "/application/insert.action",
            traditional: true,
            data: {
              "name": addFormName,
              "info": addFormInfo
            },
            success: function (result) {
              var re = JSON.parse(result)
              if (re == ("success")) {
                layer.msg('新建系统成功', {time: 1000});
                applicationClean();
                applicationSelect();
                layer.closeAll();
              } else if (re == ("application error")) {
                layer.msg('系统名称重复', {time: 1000});
              } else if (re == ("error")) {
                layer.msg('新建系统异常', {time: 1000});
              }
            },
            error: function (result) {
              layer.msg('新建系统异常', {time: 1000});
            }
          });

        },
        btn2: function () {
          layer.closeAll();
        }
      });
    }

    //删除
    $('#applicationDeleteButton').on('click', function () {
      var child = $("#applicationTable").parents('table').find('tbody input[type="checkbox"]');
      var c = [];
      var count = 0;
      child.each(function (index, item) {
        if (item.checked == true) {
          var index = $("#applicationTable").children().eq(index).children().eq(1)[0].innerText
          c[count++] = applicationList[index - 1].id;
        }
      });
      applicationDelete(c);
    });

    //导入
    $('#applicationSelectButton').on('click', function () {
      applicationSelect(this);
    });
    //导出
    $('#applicationSelectButton').on('click', function () {
      applicationSelect(this);
    });
    //编辑
    $(document).on("click", ".applicationUpdate", function () {
      applicationUpdate(this);
    });
    function applicationUpdate(op) {
      var option = applicationList[op.getAttribute("value")]
      $("#addFormName").val(option.name);
      $("#addFormInfo").val(option.info);
      $("#addFormName").attr("disabled", false);
      $("#addFormInfo").attr("disabled", false);
      layer.open({
        type: 1,
        title: '编辑',
        shadeClose: false,
        //shade: 0.8,
        area: ['40%', '50%'],
        content: $('#addForm'),
        btn: ['保存', '关闭'],
        btnAlign: 'c', //按钮居中
        yes: function () {
          // $(that).click();
          var addFormName = $("#addFormName").val();
          var addFormInfo = $("#addFormInfo").val();
          $.ajax({
            type: "post",
            dataType: "html",
            url: "/application/update.action",
            traditional: true,
            data: {
              "id": option.id,
              "name": addFormName,
              "info": addFormInfo
            },
            success: function (result) {
              var re = JSON.parse(result)
              if (re == ("success")) {
                layer.msg('编辑系统成功', {time: 1000});
                applicationClean();
                applicationSelect();
                layer.closeAll();
              } else if (re == ("application error")) {
                layer.msg('系统名称重复', {time: 1000});
              } else if (re == ("error")) {
                layer.msg('编辑系统异常', {time: 1000});
              }
            },
            error: function (result) {
              layer.msg('编辑系统异常', {time: 1000});
            }
          });

        },
        btn2: function () {
          layer.closeAll();
        }
      });
    }

    //查看
    $(document).on("click", ".applicationDetail", function () {
      applicationDetail(this);
    });
    function applicationDetail(op) {
      var option = applicationList[op.getAttribute("value")]
      $("#addFormName").val(option.name);
      $("#addFormInfo").val(option.info);
      $("#addFormName").attr("disabled", true);
      $("#addFormInfo").attr("disabled", true);

      layer.open({
        type: 1,
        title: '查看',
        shadeClose: false,
        //shade: 0.8,
        area: ['40%', '50%'],
        content: $('#addForm'),
        btn: ['关闭'],
        btnAlign: 'c', //按钮居中
        yes: function () {
          layer.closeAll();
        }
      });
    }

    //删除
    $(document).on("click", ".applicationDelete", function () {
      var StringArray = []
      StringArray[0] = applicationList[this.getAttribute("value")].id
      applicationDelete(StringArray);
    });
    function applicationDelete(deleteList) {
      layer.confirm("<div style='text-align: center'>确认删除？</div>", function () {
        $.ajax({
          type: "post",
          dataType: "html",
          url: "/application/delete.action",
          traditional: true,
          data: {
            "deleteList": deleteList
          },
          success: function (result) {
            re = JSON.parse(result)
            if (re == ("success")) {
              layer.msg('删除成功！', {time: 1000});
              applicationClean();
              applicationSelect();
            } else {
              layer.msg('删除失败', {time: 1000});
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
</body>
</html>