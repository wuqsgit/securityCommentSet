<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/8
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/dept/insert.action" method="post">
  <table>
    <tr>
      <th>ID:</th>
      <td>
        <input type="text" name="deptId">
      </td>
      <td>
      <th>单位:</th>
      <td>
        <input type="text" name="deptName">
      </td>
      </td>
      <td>
      <th>地址:</th>
      <td>
        <input type="text" name="deptAddress">
      </td>

      <td>
        <input type="submit" value="注册">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
