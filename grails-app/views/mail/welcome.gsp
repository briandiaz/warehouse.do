<%--
  Created by IntelliJ IDEA.
  User: Brian
  Date: 12/12/2014
  Time: 1:20 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<i>Dear <%= person %>;</i>
<br/>
Welcome to <a href="http://localhost:8080/warehouse/">WareHouse.DO</a>
<br/>
To sign in at the <a href="http://localhost:8080/warehouse/person/create">site</a> this are your credentials:
<br/>
<br/>
<b>username:</b> <%= user.username %>
<b>password:</b> <%= user.password %>
<br/><br/><br/>
Thanks.

</body>
</html>