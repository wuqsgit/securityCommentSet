<%@ page import="com.ht70605.entity.Sysuser" %>
<%@ page import="com.ht70605.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>密码装备管理系统</title>

    <meta name="description" content="with selectable elements and custom icons" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" href="components/font-awesome/css/font-awesome.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin" style="font-family: 'microsoft yahei';">

<div id="message"></div>
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default  ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle -->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left" style="margin-top: 2px;">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand">
                <small style="font-size:80% ">
                    <i class="fa fa-leaf"></i>
                 <font style="font-weight: 600"> 天熠-密码装备管理系统 </font>
                </small>
            </a>

            <!-- /section:basics/navbar.layout.brand -->

            <!-- #section:basics/navbar.toggle -->

            <!-- /section:basics/navbar.toggle -->
        </div>

        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">

                        <img class="nav-user-photo" src="assets/avatars/avatar4.png" alt="Jason's Photo" />
                        <span class="user-info" style="font-weight: bolder;font-size: 13px">

                                <%
                                    User user=(User)session.getAttribute("User");
                                %>
                                <%=user.getuName()%>
						 </span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li id="editpwd">
                            <a href="#">
                                <i class="ace-icon fa fa-cog"></i>
                                修改密码
                            </a>
                        </li>
                        <li class="divider"></li>

                        <li id="logout">
                            <a href="#">
                                <i class="ace-icon fa fa-power-off" ></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>

        <!-- /section:basics/navbar.dropdown -->
    </div><!-- /.navbar-container -->
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <!--<script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>-->

    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar responsive ace-save-state">
        <script type="text/javascript">
            try{ace.settings.loadState('sidebar')}catch(e){}
        </script>
        <ul class="nav nav-list" id="nav" style="letter-spacing: 1.5px">
        </ul><!-- /.nav-list -->
        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <!-- /section:basics/sidebar.layout.minimize -->
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="tabbable">
                    <ul class="nav nav-tabs" id="myTab">
                        <%--<li class="active">--%>
                            <%--<a data-toggle="tab" href="#home" class="tab">--%>
                                <%--<i class="green icon-home bigger-110"></i>--%>
                                <%--Home--%>
                            <%--</a>--%>
                        <%--</li>--%>

                    </ul>
                    <div class="tab-content" id="tab-content-page" style="background-color: white">
                        <%--<div id="home" class="tab-pane in active" >--%>
                            <%--<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>--%>
                        <%--</div>--%>

                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <%--<div class="footer">--%>
        <%--<div class="footer-inner">--%>
            <%--<!-- #section:basics/footer -->--%>
            <%--<div class="footer-content"  style="background-color: #E4E6E9">--%>
						<%--<span class="bigger-120">--%>
							<%--<span class="blue bolder">航天二院七0六所&</span>--%>
							<%--2017--%>
						<%--</span>--%>
            <%--</div>--%>

            <%--<!-- /section:basics/footer -->--%>
        <%--</div>--%>
    <%--</div>--%>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->
<div class="row" id="AddForm" style="display: none;margin: 20px;font-family: '微软雅黑';font-size: 12px">
<div class="page-header" style="text-align: center;height: 30px;padding-top: 0px">
    <h4 style="font-weight: bolder;color: #0b6cbc;font-family: '微软雅黑', 'Microsoft YaHei', serif">
        修改密码
    </h4>
</div>
<form class="form-horizontal" id="editForm"  style="margin-top: 60px">
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="pwd">新密码： </label>

        <div class="col-sm-9">
            <input type="password" id="pwd"  class="col-xs-9" >
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="qpwd"> 确认密码：</label>

        <div class="col-sm-9">
            <input type="password" id="qpwd"  class="col-xs-9">
        </div>
    </div>

</form>

</div>

<!--[if !IE]> -->
<script src="components/jquery/dist/jquery.js"></script>

<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
<script src="../components/_mod/fuelux/tree.js"></script>

<!-- ace scripts -->
<script src="assets/js/src/elements.scroller.js"></script>
<script src="assets/js/src/elements.colorpicker.js"></script>
<script src="assets/js/src/elements.fileinput.js"></script>
<script src="assets/js/src/elements.typeahead.js"></script>
<script src="assets/js/src/elements.wysiwyg.js"></script>
<script src="assets/js/src/elements.spinner.js"></script>
<script src="assets/js/src/elements.treeview.js"></script>
<script src="assets/js/src/elements.wizard.js"></script>
<script src="assets/js/src/elements.aside.js"></script>
<script src="assets/js/src/ace.js"></script>
<script src="assets/js/src/ace.basics.js"></script>
<script src="assets/js/src/ace.scrolltop.js"></script>
<script src="assets/js/src/ace.ajax-content.js"></script>
<script src="assets/js/src/ace.touch-drag.js"></script>
<script src="assets/js/src/ace.sidebar.js"></script>
<script src="assets/js/src/ace.sidebar-scroll-1.js"></script>
<script src="assets/js/src/ace.submenu-hover.js"></script>
<script src="assets/js/src/ace.widget-box.js"></script>
<script src="assets/js/src/ace.settings.js"></script>
<script src="assets/js/src/ace.settings-rtl.js"></script>
<script src="assets/js/src/ace.settings-skin.js"></script>
<script src="assets/js/src/ace.widget-on-reload.js"></script>
<script src="assets/js/src/ace.searchbox-autocomplete.js"></script>

<!-- inline scripts related to this page -->


<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="assets/css/ace.onpage-help.css" />
<!--<link rel="stylesheet" href="../docs/assets/js/themes/sunburst.css" />-->

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="assets/js/src/elements.onpage-help.js"></script>
<script src="assets/js/src/ace.onpage-help.js"></script>
<!--<script src="../docs/assets/js/rainbow.js"></script>
<script src="../docs/assets/js/language/generic.js"></script>
<script src="../docs/assets/js/language/html.js"></script>
<script src="../docs/assets/js/language/css.js"></script>
<script src="../docs/assets/js/language/javascript.js"></script>-->
<script src="js/Main.js"></script>
<script src="js/tab.js"></script>
<link rel="stylesheet" href="/css/fontstyle.css" />
<script src="/layer/layer.js"></script>
<script src="/toastr/js/toastr.js"></script>
<link rel="stylesheet" href="/toastr/css/toastr.css" />
<link rel="stylesheet" href="css/main.css" />
<script type="application/javascript">
    jQuery(function($){

        var height=document.documentElement.clientHeight;//获取浏览器可见区域的高度

        $(".main-content").height(height-45);
        $(".main-container").height(height-45);
        $(".page-content").height(height-45-55);
        $(".tabbable").height(height-45-55);
       var tabbableheight= ($(".tabbable").height());
        var myTabheight=  $("#myTab").height();
       //alert(tabbableheight-myTabheight);
        $("#tab-content-page").height( tabbableheight-myTabheight-35);
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/initSystem/getTree.action",
            data: {
                "uId": sessionStorage.getItem("uId")
            },
            success: function (result) {
                TreeNodes(result);
                document.getElementById('nav').innerHTML = html;//生成菜单


//                //默认加载首页
//                var options={
//                    tabMainName:"myTab",
//                    tabName:$("#chushiye")[0].dataset.name,
//                    tabTitle:$("#chushiye")[0].innerHTML,
//                    tabUrl:$("#chushiye")[0].dataset.url
//                }
//                addTab(options);
                $('.onClick').on('click', function () {
                    var span = $(this).find("span")[0];

                    var tabTitle=span.innerHTML;
                    var tabName=span.dataset.name;
                    var tabUrl=span.dataset.url;

                    var options={
                        tabMainName:"myTab",
                        tabName:tabName,
                        tabTitle:tabTitle,
                        tabUrl:tabUrl
                    }
                    addTab(options);
                    $("#chushiye").parent().css("background-color","#47A0DB");
                });
                $("#chushiye").parent().trigger("click");
                $("#chushiye").parent().css("background-color","#2d86c1");
                $("#tab_a_1").children().hide();
            },
            error: function (result) {
               // alert("目录导出错误");
            }
        });
        $('#logout').on('click', function (){
                window.location.href="login.jsp";
            })
        $('#editpwd').on('click', function (){
            layer.open({
                type: 1,
                title: "修改密码",
                shadeClose: false,
                //shade: 0.8,
                area: ['30%', '40%'],
                content: $('#AddForm'),
                btn: ['保存', '关闭'],
                btnAlign: 'c', //按钮居中
                yes: function (index) {
                    EditPwd(index);

                },
                btn2: function () {
                    layer.close();
                },success:function (layero,index) {

                }
            });
        })

        function EditPwd(index) {

            var  pwd=$("#pwd").val();
            var  qpwd=$("#qpwd").val();
            if(pwd==""||qpwd==""){
                layer.msg("密码不允许为空");
                return;
            }
            if(pwd!=qpwd){
                layer.msg("确认密码错误");
                return;
            }
            var User={
                passWord:pwd
            }
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/sysuser/updatePwd.action",
                //traditional: true,
                data: {
                    "sysuser":JSON.stringify(User)
                },
                success: function (re) {
//                    re = JSON.parse(result)
                    if (re.status == "true") {
                        layer.msg(re.msg, {time: 1000});
                        layer.close(index);

                    } else if (re.status == "false") {
                        layer.msg(re.msg, {time: 1000});
                    }
                },
                error: function (re) {
                    layer.msg('修改异常！', {time: 1000});
                }
            });
        }

    });

</script>
<script type="text/javascript">
    var NotifyWebSocket = {};
    NotifyWebSocket.socket = null;
    NotifyWebSocket.connect = (function(host) {
        if ('WebSocket' in window) {
            NotifyWebSocket.socket = new WebSocket(host);

        } else {
            console.log('Error: WebSocket is not supported by this browser.');
            // return;
        }
        NotifyWebSocket.socket.onopen = function() {
            console.log('WebSocket is Open');
        };
        NotifyWebSocket.socket.onclose = function() {
            console.log('WebSocket is Closed');
        };

        NotifyWebSocket.socket.onmessage = function(message) {
            notifysound.clientNotify(message.data);
            console.log(message.data);
        };
        NotifyWebSocket.socket.onerror = function(event){
        };
    });

    NotifyWebSocket.initialize = (function() {
        //notifysound.resources();
        if (window.location.protocol == 'http:') {

            NotifyWebSocket.connect('ws://' + window.location.host + '/WebSocket');
        } else {
            NotifyWebSocket.connect('ws://' + window.location.host + '/WebSocket');
        }

    });
    NotifyWebSocket.sendMessage = (function(message) {

        if (message != '') {
            NotifyWebSocket.socket.send(

            );
        }
    });

    toastr.options = {
        positionClass: 'toast-bottom-right',
        timeOut:10000,
        extendedTimeOut:1000000,
        closeButton:true
    };

    var notifysound = {};
    notifysound.clientNotify = (function(msg){
        var _obj_ = JSON.parse(msg);
        if(_obj_.message){
            toastr.success(_obj_.message);
        }

        if(_obj_.url){
            $('<div id="notifyId" style="display:none"><audio id="notifyClientAuto"></audio></div>').appendTo('body');
            $('#notifyClientAuto')[0].setAttribute('src', _obj_.url);
            $('#notifyClientAuto')[0].play();
        }

    });
    notifysound.mail = (function(msg){
        /*toastr.info(msg);*/
        /* $('#notifymail')[0].play();*/
    });

    notifysound.ring = (function(msg){
        /*   toastr.warning(msg);
         $('#notifyring')[0].play();*/
    });

    notifysound.msg = (function(message){
        /* toastr.warning(message);
         $('#notifymsg')[0].play();*/
    });

    notifysound.system = (function(msg){
        /*toastr.warning(msg);
         $('#notifysystem')[0].play();*/
    });

    notifysound.resources = (function(){
        /* var system = $CONFIG['contextpath']+'/resources/audio/system.wav';
         var msg = $CONFIG['contextpath']+'/resources/audio/msg.wav';
         var ring = $CONFIG['contextpath']+'/resources/audio/ring.wav';
         var mail = $CONFIG['contextpath']+'/resources/audio/mail.wav';
         $('<audio id="notifysystem"><source src='+system+' type="audio/wav"></audio>').appendTo('body');
         $('<audio id="notifymsg"><source src='+msg+' type="audio/wav"></audio>').appendTo('body');
         $('<audio id="notifyring"><source src='+ring+' type="audio/wav"></audio>').appendTo('body');
         $('<audio id="notifymail"></audio>').appendTo('body');*/
    });

    NotifyWebSocket.initialize();
</script>

</body>

</html>