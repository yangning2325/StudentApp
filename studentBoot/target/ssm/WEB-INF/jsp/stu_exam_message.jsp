<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/25
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="panel panel-success" style="height: 420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-xueshengguanli"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">考生</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span style="font-size: 17px;">${stu.stuName}</span>
    </div>
    <div class="panel-body">
        <table class="table table-striped">
            <thead>
            <th>考试科目</th>
            <th>考试时间</th>
            <th>考试地点</th>
            <th>监考老师</th>
            </thead>
            <tbody>
            <c:forEach items="${exam}" var="list">
                <tr>
                    <td>${list.e_course}</td>
                    <td>${list.e_date}</td>
                    <td>${stuExam.examClass.gradeName} ${stuExam.examClass.className}</td>
                    <td>
                        <c:forEach items="${stuExam.examTeacher}" var="stus">
                            ${stus.teaName}&nbsp;
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
