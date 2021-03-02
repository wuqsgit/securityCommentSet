<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/14
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="height:100%;" >
<div style="text-align: center;top: 40%;left:40%;position:absolute;font-family: '微软雅黑';font-weight: bolder;color: green">
    <l1>登陆超时，2秒后将跳转到登陆页</l1>
</div>
<script type="text/javascript">

    setTimeout(login,2000);
    function login() {
        top.location.href="login.jsp";
    }

</script>
</body>
</html>
