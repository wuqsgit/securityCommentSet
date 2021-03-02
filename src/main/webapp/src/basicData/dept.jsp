
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Treeview</title>

    <meta name="description" content="with selectable items(single &amp; multiple) and custom icons" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../../assets/css/ace.min.css" />
    <link rel="stylesheet" href="../../assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="../../assets/css/ace-skins.min.css" />
    <script src="../../assets/js/ace-extra.min.js"></script>




</head>

<body style="background-color: white;font-family: '微软雅黑', 'Microsoft YaHei', serif">

<div style="padding-left: 13px">
    <p>

        <button class="btn btn-sm btn-success" id="btnAdd">新 增</button>
        <button class="btn btn-sm btn-info" id="btnEdit" >修 改</button>
        <button class="btn btn-sm btn-danger" id="btnDel" >删 除</button>

    </p>
</div>
<div class="row" id="rowid" style="margin: 0px;padding: 0px">
    <div class="col-sm-12" style="height:100%;">
        <div >
            <div class="widget-header header-color-blue2"  >
                <h4 class="lighter smaller">组织结构目录</h4>
            </div>
        </div>

        <div class="widget-body" style="height: 90%;padding: 0px">
            <div class="widget-main" id="tree" style="height:100%;padding:5px 0px 0px 10px" >
                <div id="tree1" class="tree" style="height: 100%;" ></div>
            </div>
        </div>
    </div>


</div>

<!--表单 -->
<div class="row" id="AddForm" style="display: none;margin: 20px;">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            组织机构维护
        </h4>
    </div>
    <form class="form-horizontal" id="editForm" role="form" style="margin-top: 20px">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="dept_name">单位名称： </label>

            <div class="col-sm-9">
                <input type="text" id="dept_name"  class="col-xs-9">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="p_dept_name"> 上级单位名称：</label>

            <div class="col-sm-9">
                <input type="text" id="p_dept_name"  class="col-xs-9">
            </div>
        </div>
        <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="dept_user"> 单位负责人： </label>

        <div class="col-sm-9">
            <input type="text" id="dept_user" class="col-xs-9">
        </div>
    </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="remark"> 备注： </label>

            <div class="col-sm-9">
                <textarea class="form-control" id="remark" style="width: 75%;height: 60px"></textarea>
            </div>
        </div>

    </form>

</div>



<script src='../../assets/js/jquery-2.0.3.min.js'></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/typeahead-bs2.min.js"></script>
<script src='../../assets/js/jquery.mobile.custom.min.js'></script>

<%--<!-- page specific plugin scripts -->--%>

<script src="../../assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="../../assets/js/fuelux/fuelux.tree.min.js"></script>

<%--<!-- ace scripts -->--%>

<script src="../../assets/js/ace-elements.min.js"></script>
<script src="../../assets/js/ace.min.js"></script>
<link rel="stylesheet" href="../../css/fontstyle.css" />
<script src="../../layer/layer.js"></script>
<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function($){

//        var h=document.documentElement.scrollHeight;
//      $("#rowid").height(h-45);
        $('#tree1').ace_tree({
            dataSource: treeDataSource ,
            multiSelect:true,
            loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
            'open-icon' : 'icon-minus',
            'close-icon' : 'icon-plus',
            'selectable' : true,
            'selected-icon' : 'icon-ok',
            'unselected-icon' : 'icon-remove'
        });

        $('#tree1').on('loaded', function (evt, data) {
        });

        $('#tree1').on('opened', function (evt, data) {
        });

        $('#tree1').on('closed', function (evt, data) {
        });

        $('#tree1').on('selected', function (evt, data) {
            alert(data);
        });
       $('#btnAdd').on('click',function () {
           Add();
       })
    });
    function Add() {
        layer.open({
            type:1,
            title: '新增',
            shadeClose: true,
            //shade: 0.8,
            area: ['45%', '60%'],
            content:$('#AddForm'),
            btn: ['保存', '关闭'],
            btnAlign: 'c', //按钮居中
            yes: function(){
                Sumbit();
        },
        btn2: function(){
                layer.closeAll();
            }
            });
    }
  function Sumbit() {
    var submitData={
        "depname": $("#dept_name").val(),
        "superDeptId": $("#p_dept_name").val(),
        "sysUserId": $("#dept_user").val(),
        "info": $("#remark").val()
    }
      $.ajax({
          type: "post",
          dataType: "json",
          url: "/dept/insert.action",
          data:submitData,
          cache:false,
          async:true,
          success:function(result){
              layer.msg(result);
          },
          complete:function(){
              //请求结束时
          },
          error:function(){
              //请求失败时
          }
      })
  }

</script>
</body>
</html>


