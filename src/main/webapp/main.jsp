<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="description" content="overview &amp; stats"/>
    <!-- basic styles -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <%--<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />--%>
    <%--<link rel="stylesheet" href="assets/css/ace-skins.min.css" />--%>
    <script src="assets/js/ace-extra.min.js"></script>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="navbar navbar-default" id="navbar" style="background-color: white">
    <%--<script type="text/javascript">--%>
    <%--try{ace.settings.check('navbar' , 'fixed')}catch(e){}--%>
    <%--</script>--%>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand" style="color: black">
                <small>
                    <i class="icon-leaf"></i>
                    涉密载体监控系统
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>
                        <span class="user-info">
									张三
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                Settings
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                Profile
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="#">
                                <i class="icon-off"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>

<div class="main-container" id="main-container">


    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">

            <ul class="nav nav-list" id="nav">

            </ul><!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <!--<script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>-->
        </div>

        <div id="main-page" class="main-content" style="background-color: #f7f8fc;padding: 20px;">
            <div id="main-page-content" class="page-content" style="background-color:white;padding: 0px;">
                <div class="row" style="height:100%;">
                    <div class="col-sm-12" style="height:100%;">
                        <div class="tabbable" style="background-color:#f7f8fc;height: 100% ">
                            <ul class="nav nav-tabs" id="myTab" style="background-color: #f7f8fc;">
                                <li class="active">
                                    <a data-toggle="tab" href="#home" class="tab">
                                        <i class="green icon-home bigger-110"></i>
                                        Home
                                    </a>
                                </li>

                            </ul>

                            <div class="tab-content" id="tab-content-page" style="background-color: white;height: 96%">
                                <div id="home" class="tab-pane in active">
                                    <p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
                                </div>

                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div>

            </div>


        </div><!-- /.main-content -->


    </div><!-- /.main-container-inner -->


</div><!-- /.main-container -->

<!-- basic scripts -->
<script src="assets/js/jquery-2.0.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
<script src="js/Main.js"></script>
<script src="js/tab.js"></script>
<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function ($) {
        var explorer = navigator.userAgent;
        //firefox
        if (explorer.indexOf("Firefox") >= 0) {
            var _body = document.compatMode == 'BackCompat' ? document.body : document.documentElement;
            var h = _body.clientHeight - 60 + 'px';
            document.getElementById('main-page').style.minHeight = h;
            document.getElementById('main-page').style.height = "auto";
        }
//Chrome
        else if (explorer.indexOf("Chrome") >= 0) {

            var _body = document.compatMode == 'BackCompat' ? document.body : document.documentElement;
            var h = _body.clientHeight - 60 + 'px';
            document.getElementById('main-page').style.minHeight = h;
            document.getElementById('main-page').style.maxHeight = h;
            document.getElementById('main-page').style.height = h;
//
            // $("#main-page").height(h);
//          $("#main-container-inner").height(h);
//          $("#tab-content-page").height(h - 110);
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/initSystem/getTree.action",
            data: {
                "uId": sessionStorage.getItem("uId")
            },
            success: function (result) {
                TreeNodes(result);

                document.getElementById('nav').innerHTML = html;
                $('.onClick').on('click', function () {
                    var span = $(this).find("span")[0];

                    var tabTitle = span.innerHTML;
                    var tabName = span.dataset.name;
                    var tabUrl = span.dataset.url;
                    var options = {
                        tabMainName: "myTab",
                        tabName: tabName,
                        tabTitle: tabTitle,
                        tabUrl: tabUrl
                    }
                    addTab(options);
                });
            },
            error: function (result) {
                alert("目录导出错误");
            }

        });
        //单位查询按钮

    })
</script>
</body>
</html>
