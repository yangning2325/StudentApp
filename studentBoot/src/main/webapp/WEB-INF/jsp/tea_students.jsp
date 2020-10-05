<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/3
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="panel panel-info"  style="height:420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-xuesheng1"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">本班学生信息</span>
    </div>
    <div class="panel-body" >
        <table class="table table-hover">
            <thead>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>出生年月</th>
            <th>地址</th>
            <th>电话</th>
            <th>邮箱</th>
            <th>QQ</th>
            </thead>
            <tbody id="tables">
            <c:forEach items="${students}" var="list">
                <tr>
                    <td>${list.stuNum}</td>
                    <td>${list.stuName}</td>
                    <td>${list.stuSex}</td>
                    <td>${list.stuBirth}</td>
                    <td>${list.stuAddress}</td>
                    <td>${list.stuPhone}</td>
                    <td>${list.stuEmail}</td>
                    <td>${list.stuQQ}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
