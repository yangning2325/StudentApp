<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/22
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生信息系统</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/code.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js" ></script>
</head>
<body>
<form id="forms" method="post">
    <div id="box">
        <h2 style="color: chocolate;font-size: 25px;" align="center">用户登录</h2>
        <div id="login">
            <span class="iconfont icon-zhanghao1"style="font-size: 25px;"></span>
            <div id="name">
                <input type="text" class="form-control" placeholder="账户" name="userName" id="userName"><span id="checkName"></span>
            </div>
            <span class="iconfont icon-mima4" style="font-size: 25px;"></span>
            <div id="pw">
                <input type="password" class="form-control" placeholder="密码" name="password" id="password">
                <span id="checkPw"></span>
            </div>
            <br/>
            <div id="chNu">
                <input type="text" class="form-control" placeholder="请输入验证码" name="checkNum" id="checkNum">
                <div id="checkCode" class="code" onclick="createCode(4)"></div><span id="checkcd"></span>
            </div>
            <div id="choice">
                <input type="radio" name="people" class="people" value="student" checked>学生
                &nbsp;&nbsp; &nbsp;&nbsp;
                <input type="radio" name="people" class="people" value="teacher">老师
                   &nbsp;&nbsp;
                <input type="radio" name="people" class="people" value="admin" >管理员
            </div>
            <span id="checkAll">${msg}</span>
            <div id="btn">
                <button type="button" class="btn btn-success" id="bt">登录</button>
            </div>
            <br>
        </div>
    </div>
</form>
</body>
</html>
