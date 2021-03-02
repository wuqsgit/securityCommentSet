<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="../../components/jquery/dist/jquery.js"></script>

<html>
<head>
    <title>登录</title>
    <link href="css/login.css" rel="stylesheet" type="text/css">
    <%--<script src="js/cloud.js" type="text/javascript"></script>--%>

</head>
<body class="main" >

<div id="mainBody">
    <div id="cloud1" class="cloud" style="background-position: 1268.4px 100px;"></div>
    <div id="cloud2" class="cloud" style="background-position: 744px 460px;"></div>
</div>

<div class="logintop">
    <span style="font-size: 15px;font-weight: bolder">天熠-密码装备管理系统</span>
    <ul>
        <li><a href="#" target="_blank"><b><font color="#FFF">帮助</font></b></a></li>
    </ul>
</div>

<div class="loginbody">

    <span class="systemlogo"></span>

    <div class="loginbox" style="position: absolute; margin-left: 30%;">
        <%--<div style="width:165px; height:96px; position:absolute;margin-top:8px;left:-70px">--%>
            <%--&lt;%&ndash;<div class="tou"></div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="initial_left_hand" id="left_hand"></div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="initial_right_hand" id="right_hand"></div>&ndash;%&gt;--%>
        <%--</div>--%>
        <div>
            <ul>

                <li><input id="username" name="username" type="text" class="loginuser ipt" placeholder="请输入用户名"
                           value="cs">
                </li>
                <li><input id="password" name="password" type="password" class="loginpwd ipt" placeholder="请输入密码"
                           value="123456"></li>
                <li><input id="login" name="login" type="submit" class="loginbtn" value="登录"><a  style="padding-left: 50px;color: red;font-weight: bold" id="msg"></a></li>
            </ul>
        </div>
    </div>

</div>

<div class="loginbm">版权所有 2015-2018 <a href="http://www.dz580.com">航天二院706所</a></div>

<script>
    /**
     * 对layui进行全局配置
     */
    jQuery(function ($) {
        var username = $('#username').val();
        var password = $('#password').val();
        var height=document.documentElement.clientHeight;//获取浏览器可见区域的高度
        var topheight=(height-636)/2;
        $(".loginbox").css("margin-top",topheight);
        //单位查询按钮
        $('#login').on('click', function () {
            login(this);
        });
        function login() {
            var tree = [];
            var username = $('#username').val();
            var password = $('#password').val();
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/initSystem/checkLogin.action",
                data: {
                    "uLoginName": username,
                    "uPwd": password
                },
                success: function (result) {
                    if(result.status=="true"){
                        window.location.href="index.jsp";
                    }
                    else{
                        $("#msg").text(result.msg);
                    }

                },
                error: function (result) {

                    $("#msg").text("密码错误 或 登录名不存在");
                   // alert("密码错误 或 登录名不存在");
                }
            });
        }
        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13){
                login();
            }
        };


    })




</script>


</body>
</html>
