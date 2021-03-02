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
  <link rel="stylesheet" href="../../assets/css/daterangepicker.css"/>

  <script src="../../assets/js/ace-extra.js"></script>
  <script src="../../js/convertnull.js"></script>

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
            <i class="ace-icon fa fa-home home-icon"></i>监控记录
          </li>
          <li class="active">在柜信息</li>
        </ul>

      </div>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">
        <div class="row">
          <div class="col-xs-12" style="height: 80px;padding-left: 0px;padding-right: 0px">
            <form id="search_form">
              <div style="border: 1px solid rgb(221, 221, 221);padding-top: 5px;min-width: 900px">
                <table style=" height: 90px;font-family: 'Microsoft YaHei';font-size: 12px;vertical-align:middle;min-width: 800px;margin: auto;margin-bottom: 5px"
                       border="0">
                  <tr>
                    <td>
                      密品类别：<select class="chosen-select" id="search_dictionaryType" name="search_dictionaryType"  data-placeholder="请选择密品类型"  style="width: 163px">
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
                    <td rowspan="2" style="padding-left: 20px">
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
                    </tr>
                  <tr>
                    <td>
                      <a style="padding-left: 12px"></a>
                      列装号：<input id="search_proCode"
                                 name="search_proCode" type="text" maxlength="64">

                      <a style="padding-left: 10px"></a>
                      设备编号：<input id="search_equipmentNo"
                                  name="search_equipmentNo" type="text" maxlength="64">
                      <a style="padding-left: 21px"></a>
                      责任人：<input id="search_usename"
                                 name="search_usename" type="text" maxlength="64">
                    </td>
                  </tr>
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
        <div class="row" style="padding-top: 30px">
          <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px">
            <table id="simple-table" class="table  table-bordered table-hover">
              <thead>

              <div style="border: 1px solid #ddd;height: 40px;background-color:#f1f1f5;padding-top: 4px;border-bottom: 0px">
                <label style="padding: 6px;font-size: 12px">&nbsp;在柜信息列表</label>
                                <span style="float:right;padding-right: 5px">
                                       <%-- <button id="applicationInputButton" name="applicationInputButton"
                                                class="btn btn-sm btn-primary">
                                          <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                          导入</button>
                                        <button id="applicationOutputButton" name="applicationOutputButton"
                                                class="btn btn-sm btn-primary">
                                          <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                          导出</button>--%>
                                        </span>
              </div>
              <tr style="height: 30px">

                <th width="50px" style="text-align: center">序号</th>
                <th>监控设备</th>
                <th>位置</th>
                <th>设备IP</th>
                <th>责任人</th>
                <th>密品数量</th>
                <th style="text-align: center;width: 200px">操作</th>
              </tr>
              </thead>
              <tbody id="applicationTable">
              </tbody>
            </table>
            <div class="padlr" align="right" style="cursor: pointer">
              <ul id="data-pagination" class="pagination">
                <li class="disabled"></li>
                <li class="active"></li>
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
      密品详情
    </h4>
  </div>
  <div class="text" style="text-align: left;height: 30px;padding-top: 0px;padding-left: 20px">
    <span style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
      监控设备：
    </span>
    <span id="label_equipment" style="font-weight: bolder;color: #021525;font-family: '微软雅黑', 'Microsoft YaHei', serif">
    </span>
    <span  style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif;padding-left: 50px">
     责任人：
    </span>
    <span id="label_usename" style="font-weight: bolder;color: #021525;font-family: '微软雅黑', 'Microsoft YaHei', serif">
    </span>
    <span  style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif;padding-left: 50px">
     设备总数：
    </span>
    <span id="label_total" style="font-weight: bolder;color: #021525;font-family: '微软雅黑', 'Microsoft YaHei', serif">
    </span>
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
        </tr>
        </thead>
        <tbody id="mijianTable" class="table  table-bordered table-hover"></tbody>

      </table>
    </div>
  </row>


</div>



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
<link rel="stylesheet" href="../../css/fontstyle.css" />
<script src="../../layer/layer.js"></script>
<script src="../../js/bootstrap-paginator.js"></script>

<script type="text/javascript">
  jQuery(function ($) {
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
            $("#search_dictionaryType").append(dictionary);

          }
        },
        error: function(response) {

        }
      })
    }
    GetDictionary();
    //日期控件初始化
    $('input[name=date-range-picker]').daterangepicker().prev().on(ace.click_event, function () {
      $(this).next().focus();
    });
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

    var startTime;
    var endTime;
    //数据初始化
    applicationSelect(1);
    //查询按钮
    $('#sysuserSelectButton').on('click', function () {
      applicationSelect(1);
    });
    var applicationList;
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
    function applicationSelect(pageIndex) {
      var searchUser=null;
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
      createJson(paramEntity,"searchUser",null);
//      if(value!=""||value!=null) createJson(paramEntity,"searchUser","yes");
      var pageIndex =pageIndex; //当前页码
      $.ajax({
        type: "post",
        dataType: "json",
        url: "/incap/select.action",
        contenType:"application/json;charse=utf-8",
        //traditional: true,
        data: {
          "page": JSON.stringify(
                  {
                    "pageIndex": pageIndex, "pageSize": 10, "paramEntity": paramEntity
                  }
          )
        },
        success: function (result) {
          var re = result;
          applicationList = re.list;
          var applicationHtml = "";
          if(applicationList.length == 0){
            $('#data-pagination').hide();
            $("#applicationTable").empty();
            return;
          }
          for (var a = 0; a < applicationList.length; a++) {
            var page = (re.pageIndex - 1) * 10 + a + 1;
            var id = applicationList[a].incapid;
            applicationHtml +=
                    "<tr> " +
                    "<td>" + page + "</td> " +
                    "<td>" + convertNull(applicationList[a].equipment) + "</td> " +
                    "<td>" + convertNull(applicationList[a].location) + "</td> " +
                    "<td>" + convertNull(applicationList[a].sysIp) + "</td> " +
                    "<td>" + convertNull(applicationList[a].usename) + "</td> " +
                    "<td>" + convertNull(applicationList[a].productnum) + "</td> " +
                    "<td style='text-align: center;color: #2283C5;'> " +
                    "<span>" +
                    "<a style='cursor:pointer;text-decoration:none' class='productDetail' value='" + id + "' equipment='"+ applicationList[a].equipment +"' usename='"+ applicationList[a].usename +"'> 查看详情 </a> " +
                    "</span>" +
                    "</td> " +
                    "</tr>"
          }
          $("#applicationTable").empty();

          $("#applicationTable").append(applicationHtml);

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
                dataType: "json",
                url: "/userecord/select.action",
                contenType:"application/json;charse=utf-8",
                //traditional: true,
                data: {
                  "page": JSON.stringify(
                          {
                            "pageIndex": page, "pageSize": 10, "paramEntity": paramEntity
                          }
                  )
                },
                success: function (result) {
                  var re = result;
                  applicationList = re.list;
                  var applicationHtml = "";

                  for (var a = 0; a < applicationList.length; a++) {
                    var id = applicationList[a].capuseid;
                    var page = (re.pageIndex - 1) * 10 + a + 1;
                    applicationHtml +=
                            "<tr> " +
                            "<td>" + page + "</td> " +
                            "<td>" + convertNull(applicationList[a].equipment) + "</td> " +
                            "<td>" + convertNull(applicationList[a].location) + "</td> " +
                            "<td>" + convertNull(applicationList[a].sysIp) + "</td> " +
                            "<td>" + convertNull(applicationList[a].usename) + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList[a].productnum) + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='productDetail' value='" + id + "' equipment='"+ applicationList[a].equipment +"' usename='"+ applicationList[a].usename +"'> 查看详情 </a> " +
                            "</span>" +
                            "</td> " +
                            "</tr>"
                  }
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
    $('#sysuserCleanButton').on('click', function () {
      applicationClean();
    });
    function applicationClean() {
      $('#search_dictionaryType').val("");
      $('#search_model').val("");
      $('#search_serNum').val("");
      $('#search_proCode').val("");
      $('#search_usename').val("");
      $('#search_equipmentNo').val("");

    }

    //查看
    $(document).on("click", ".productDetail", function (){
      var id= this.getAttribute("value");
        var equipment = this.getAttribute("equipment");
        var usenameValue = this.getAttribute("usename");
      eidt("查看详情",id, equipment, usenameValue);
    })

    function eidt(title,id, equipment, usenameValue) {
      var id=id;

      productUpdate(id,title, equipment, usenameValue);
    }
    function productUpdate(id,title, equipment, usenameValue) {
      var searchUser=null;
      var paramEntity={};
      createJson(paramEntity,"capuseid",id);
      createJson(paramEntity,"searchUser",'yes');
      var pageIndex =1; //当前页码
      $.ajax({
        type: "post",
        dataType: "json",
        url: "/incap/select.action",
        contenType:"application/json;charse=utf-8",
        //traditional: true,
        data: {
          "page": JSON.stringify(
                  {
                     "paramEntity": paramEntity
                  }
          )
        },
        success: function (result) {
          var re = result;
          applicationList = re.list;
          var applicationHtml = "";

          for (var a = 0; a < applicationList.length; a++) {
            var page =  a + 1;
            var id = applicationList[a].incapid;
            applicationHtml +=
                    "<tr> " +
                    "<td>" + page + "</td> " +
                    "<td style='text-align: center'>" + convertNull(applicationList[a].proCode) + "</td> " +
                    "<td style='text-align: center'>" + convertNull(applicationList[a].serNum) + "</td> " +
                    "<td>" + convertNull(applicationList[a].dictionaryType) + "</td> " +
                    "<td>" + convertNull(applicationList[a].model) + "</td> " +
                    "<td style='text-align: center'>" + convertNull(applicationList[a].rfidCode) + "</td> " +
                    "<td>" + convertNull(applicationList[a].application) + "</td> " +
                    "<td>" + convertNull(applicationList[a].deptname) + "</td> " +
                    "</tr>"
          }
          $("#label_equipment").html(equipment);
          $("#label_usename").html(usenameValue);
            var label_total = applicationList.length;
            $("#label_total").html(label_total);

          $("#mijianTable").empty();

          $("#mijianTable").append(applicationHtml);

//          var options = {
//            bootstrapMajorVersion: 3,
//            currentPage: re.pageIndex,    //变量名必须为currentPage
//            totalPages: re.totalPages,    //变量名必须为totalPages
//            itemTexts: function (type, page, current) {
//              switch (type) {
//                case "first":
//                  return "首页";
//                case "prev":
//                  return "上一页";
//                case "next":
//                  return "下一页";
//                case "last":
//                  return "末页";
//                case "page":
//                  return page;
//              }
//            },
//            onPageClicked: function (event, originalEvent, type, page) {
//              $.ajax({
//                type: "post",
//                dataType: "json",
//                url: "/incap/select.action",
//                contenType:"application/json;charse=utf-8",
//                //traditional: true,
//                data: {
//                  "page": JSON.stringify(
//                          {
//                            "pageIndex": pageIndex, "pageSize": 10, "paramEntity": paramEntity
//                          }
//                  )
//                },
//                success: function (result) {
//                  var re = result;
//                  applicationList = re.list;
//                  var applicationHtml = "";
//
//                  for (var a = 0; a < applicationList.length; a++) {
//                    var page = (re.pageIndex - 1) * 10 + a + 1;
//                    applicationHtml +=
//                            "<tr> " +
//                            "<td>" + page + "</td> " +
//                            "<td>" + convertNull(applicationList[a].proCode) + "</td> " +
//                            "<td>" + convertNull(applicationList[a].serNum) + "</td> " +
//                            "<td>" + convertNull(applicationList[a].dictionaryType) + "</td> " +
//                            "<td>" + convertNull(applicationList[a].model) + "</td> " +
//                            "<td>" + convertNull(applicationList[a].rfidCode) + "</td> " +
//                            "<td>" + convertNull(applicationList[a].application) + "</td> " +
//                            "<td>" + convertNull(applicationList[a].deptname) + "</td> " +
//                            "</tr>"
//                  }
//                  $("#label_equipment").html(applicationList[0].equipment);
//                  $("#label_usename").html(applicationList[0].usename);
//                  $("#mijianTable").empty();
//
//                  $("#mijianTable").append(applicationHtml);
//                }
//              });
//            }
//          };
        //  $('#data-pagination').bootstrapPaginator(options);
        },
        error: function (result) {

        }
      });



      //给表单赋值
      layer.open({
        type: 1,
        title:title,
        shadeClose: true,
        offset:'0px',
        //shade: 0.8,
        area: ['100%', '100%'],
        content: $('#addForm'),
        btnAlign: 'c', //按钮居中
        yes: function () {

        },
        btn2: function () {
          layer.close();
        },success:function (layero,index) {

        }
      });
    }


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

  })
</script>
</body>
</html>