<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Treeview - Ace Admin</title>

    <meta name="description" content="with selectable elements and custom icons" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../../components/font-awesome/css/font-awesome.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="../../components/chosen/chosen.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="../../assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="../../assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="../../assets/css/ace-skins.css" />
    <link rel="stylesheet" href="../../assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="../../assets/css/ace-ie.css" />
    <![endif]-->

    <link rel="stylesheet" href="../../css/fontstyle.css" />
    <link rel="stylesheet" href="../../css/tree.css" />

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="../../assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="../../components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="../../components/respond/dest/respond.min.js"></script>

    <![endif]-->
</head>

<link class="no-skin;" style="font-family: '微软雅黑'">
<!-- #section:basics/navbar.layout -->


<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <!-- #section:basics/sidebar -->


    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs ace-save-state" id="breadcrumbs" style="padding-top: 5px;background-color: white">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>基础数据
                    </li>
                    <li class="active">组织机构维护</li>

                </ul><!-- /.breadcrumb -->

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">

                            <div class="col-xs-12" style=";padding-left: 0px;padding-right: 0px" >
                                <div class="widget-box widget-color-blue2"style="border-color: #ddd">

                                    <div class="widget-header" style="background-color:#f1f1f5;border-color: #ddd;height: 40px">
                                        <h4 class="widget-title lighter smaller" style="color: black;font-size: 12px;top:2px">组织机构目录</h4>
                                        <div class="widget-toolbar no-border">
                                            <div class="inline dropdown-hover">
                                               <span >
                                           <button class="btn btn-xs btn-success" id="btnAdd">
                                               <i class="ace-icon fa fa-check"></i>
                                               新增</button>
                                           <button class="btn btn-xs btn-warning" id="btnEdit" >
                                               <i class="ace-icon fa fa-pencil align-top bigger-125"></i>
                                               编辑</button>
                                            <button class="btn btn-xs  btn-danger" id="btnDel">
                                                 <i class="ace-icon fa fa-trash-o align-top bigger-125"></i>
                                                删除</button>
                                     </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="widget-body"  id ="tree_div">
                                        <div class="widget-main padding-8">
                                            <ul id="treeview"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div  class="col-sm-12" >

                            </div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->


<!--表单 -->
<div class="row" id="AddForm" style="display: none;margin: 20px;font-family: '微软雅黑';font-size: 12px">
    <div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
        <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
            组织机构维护
        </h4>
    </div>
    <form class="form-horizontal" id="editForm"  style="margin-top: 20px">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="deptName">单位名称： </label>

            <div class="col-sm-9">
                <input type="text" id="deptId"  class="col-xs-9"  hidden="hidden">
                <input type="text" id="deptName"  class="col-xs-9">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="pdeptName"> 上级单位名称：</label>

            <div class="col-sm-9">
                <input type="text" id="pdeptName"  class="col-xs-9" readonly="readonly">
                <input type="text" id="superDeptId" hidden="hidden">
            </div>
        </div>
        <%--<div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> 单位负责人： </label>
            &lt;%&ndash;<label for="form-field-select-3">单位负责人：</label>&ndash;%&gt;
            <div class="col-sm-9">
                &lt;%&ndash;<input type="text" id="deptUser" class="col-xs-9">chosen-select &ndash;%&gt;
                    <select class="form-control" id="selectUser"  data-placeholder="请选择负责人"  class="col-xs-9" style="width: 75%">
                        <option value=""></option>
                    </select>
                    <input type="text" id="sysUserId" hidden="hidden">
            </div>
        </div>--%>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="info"> 备注： </label>

            <div class="col-sm-9">
                <textarea class="form-control" id="info" style="width: 75%;height: 60px"></textarea>
            </div>
        </div>

    </form>

</div>
<!--[if !IE]> -->
<script src="../../components/jquery/dist/jquery.js"></script>
<!--[if IE]>
<script src="../../components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='../components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="../../components/bootstrap/dist/js/bootstrap.js"></script>

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
<link rel="stylesheet" href="../../css/fontstyle.css" />
<!-- inline scripts related to this page -->
<script type="text/javascript">
    var nodes={
        nodeid:null,
        nodetext:null,
        noidpid:null,
        nodeptext:null,
        sysUserId:null,
        info:null
    }
    var node=null;
    $(function() {

        var remoteUrl = '/dept/select.action';
        var remoteDateSource = function(options, callback) {
            var self=this;
            var $data=null;
            var parent_id=0;

            if( !('text' in options || 'type' in options) ){
                $.ajax({
                    url: remoteUrl,
                    data: 'id='+0,
                    type: 'POST',
                    dataType: 'json',
                    cache:false,
                    async:false,
                    success : function(response) {
                        if(response.status == "ok")
                        {
                            callback({ data: response.data })
                        }
                    },
                    error: function(response) {
                        // alert(response.message)
                        //console.log(response);
                    }
                })
            }
            else if("type" in options && options.type == "folder") {
                if("additionalParameters" in options && "children" in options.additionalParameters)
                    $data = options.additionalParameters.children;//点击父节点，加载子节点
                else $data = {}//no data
            }

            if($data != null)//this setTimeout is only for mimicking some random delay
                setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 300)+30);
        }

        //加载树
        $('#treeview').ace_tree({
            dataSource: remoteDateSource,
            multiSelect: false,
            loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
            'open-icon' : 'ace-icon tree-minus hide',
            'close-icon' : 'ace-icon tree-plus hide',
            'selectable' : true,
            'selected-icon' : 'ace-icon fa fa-check',
            'unselected-icon' : 'ace-icon fa fa-times',
            cacheItems: true,
            folderSelect: true,
            'folder-open-icon' : 'ace-icon tree-plus',
            'folder-close-icon' : 'ace-icon tree-minus'
        });

        //树事件
        $('#treeview')
            .on('loaded.fu.tree', function(evt,data) {

            })
            .on('updated.fu.tree', function(e, result) {
            })
            .on('selected.fu.tree', function(e) {
               node=  $('#treeview').tree('selectedItems');
              if(node.length==1){
                  nodes.nodeid=node[0].additionalParameters.id; //id
                  nodes.nodetext=node[0].text;//name
                  nodes.noidpid=node[0].additionalParameters.pid;//上级id
                  nodes.nodeptext=node[0].additionalParameters.pname;//上级名称
                  nodes.info=node[0].additionalParameters.info;//备注
                  nodes.sysUserId=node[0].additionalParameters.sysUserId;//用户id
                }

            })
            .on('deselected.fu.tree', function(e) {
                nodes.nodeid="";
                nodes.nodetext="";
                nodes.nodeid="";
                nodes.nodeptext="";
                nodes.sysUserId="";
                nodes.info="";
            })
            .on('opened.fu.tree', function(e) {

            })
            .on("click.fu.tree",function(e,result){})
        $('#treeview').tree('discloseVisible');
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

    });
//加载人员信息
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
                    userListHtml += "<option value=\"" + data[j].id + "\">" + data[j].name + "</option>"
                }
                $("#selectUser").append(userListHtml);
            }
        },
        error: function(response) {

        }
    })
    //加载select
    function LoadSelect() {
        $(".chosen-select").chosen({
            no_results_text:true,
            allow_single_deselect:true,
            width:"75%"
        });
        $(".chosen-select").chosen().change(function(e){
           // var id=e.target.value;

            //var id= e.target.attr("id").val();
           var id= $("#selectUser").val();
           var text= $("#selectUser option:selected").text();
          $("#sysUserId").val(id);
           //alert(text)
        });
    }
    //新增
    function Action(_title) {
        layer.open({
            type:1,
            title: _title,
            shadeClose: false,
            scrollbar:false,
            //shade: 0.8,
            area: ['45%', '450px'],
            content:$('#AddForm'),
            btn: ['保存', '关闭'],
            btnAlign: 'c', //按钮居中
            success:function (layero,index) {
               var width= $("input[type='text']").width();
                $("selectUser").width(width);

                if(type=="add"){
                    //var id= $("#user-select").val();
                    $("#superDeptId").val(nodes.nodeid);
                    $("#pdeptName").val(nodes.nodetext);
                    $("#selectUser").val("");
                    $("#deptName").val("");
                    $("#info").val("");
                }
                else if(type=="edit"){

                    $("#deptId").val(nodes.nodeid);
                    $("#deptName").val(nodes.nodetext);
                    $("#superDeptId").val(nodes.pid);
                    $("#pdeptName").val(nodes.nodeptext);
                    $("#selectUser").val(nodes.sysUserId);
                    $("#selectUser").trigger("chosen:updated");
                    $("#info").val(nodes.info);
                }
                LoadSelect();
            },
            yes: function(index){
                Sumbit();
                layer.close(index);
            },
            btn2: function(){
              layer.close();
            }
        });

    }
    var type="";
    $('#btnAdd').on('click',function () {
        type="add";
        Action("新增");
    })
    $('#btnEdit').on('click',function () {
        if(node!=null){
            type="edit";
            Action("编辑");
        }
        else {
            layer.msg("请选择一个组织机构");
        }

    })
    $('#btnDel').on('click',function () {

        layer.confirm("<div style='text-align: center;'>确认删除？</div>", function () {
            if(node!=null) {
                type = "del";
                var submitData = {
                    "id": node[0].additionalParameters.id
                };
            }else{
                    layer.msg('请选择一个组织机构节点！', {time: 1000});
                }
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/dept/"+type+".action",
                data:submitData,
                cache:false,
                async:true,
                success:function(result){
                    layer.msg(result.msg);
                    if(result.status=="true"){
                        // $('#treeview').tree('refreshFolder', $('#treeview'));
                        $('#treeview').find("li:not([data-template])").remove();
                        $('#treeview').tree("render") ;
                    }
                },
                error:function(){
                    //请求失败时
                    layer.msg('删除异常！', {time: 1000});
                }
            });
        });
    })
    //保存提交
    function Sumbit() {

        if($("#deptName").val() == null){
            layer.msg('组织机构名称不能为空！', {time: 2000});
            return;
        }
        var submitData={
            "id":$("#deptId").val(),
            "depName": $("#deptName").val(),
            "superDepId": $("#superDeptId").val(),
            "sysUserId": $("#sysUserId").val(),

            "info": $("#info").val()
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/dept/"+type+".action",
            data:submitData,
            cache:false,
            async:true,
            success:function(result){
                layer.msg(result.msg);
                if(result.status=="true"){
                   // $('#treeview').tree('refreshFolder', $('#treeview'));
                    $('#treeview').find("li:not([data-template])").remove();
                    $('#treeview').tree("render") ;
                }
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

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="../../assets/css/ace.onpage-help.css" />
<%--<link rel="stylesheet" href="../docs/assets/js/themes/sunburst.css" />--%>

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../../assets/js/src/elements.onpage-help.js"></script>
<script src="../../assets/js/src/ace.onpage-help.js"></script>
<script src="../../components/chosen/chosen.jquery.js"></script>
<%--<script src="../docs/assets/js/rainbow.js"></script>--%>
<%--<script src="../docs/assets/js/language/generic.js"></script>--%>
<%--<script src="../docs/assets/js/language/html.js"></script>--%>
<%--<script src="../docs/assets/js/language/css.js"></script>--%>
<%--<script src="../docs/assets/js/language/javascript.js"></script>--%>
</body>
</html>
