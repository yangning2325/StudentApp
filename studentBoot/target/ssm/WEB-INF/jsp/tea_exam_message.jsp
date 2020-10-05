<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/3
  Time: 19:50
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
        <span class="iconfont icon-kaoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">教师监考</span>
    </div>
    <div class="panel-body" >
        <table class="table table-hover">
            <th>监考科目</th>
            <th>监考时间</th>
            <th>监考班级</th>
            <c:forEach items="${exams}" var="list">
                <tr>
                    <td>${list.e_course}</td>
                    <td>${list.e_date}</td>
                    <td><c:if test="${teacherExam!=null}">${teacherExam.examClass.gradeName}
                        ${teacherExam.examClass.className}</c:if></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
