<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/30
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/adminFindClass",
                async:true,
                success:function(data) {
                    for (var i=0;i<data.length;i++){
                        $("#UpTeaGrade").append("<option>"+data[i].gradeName+"</option>")
                        $("#UpTeaClass").append("<option>"+data[i].className+"</option>")
                        $("#addTeaGrade").append("<option>"+data[i].gradeName+"</option>")
                        $("#addTeaClass").append("<option>"+data[i].className+"</option>")
                    }

                }
            });
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/findNotExamTea",
                async:true,
                success:function(data) {
                    for (var i=0;i<data.length;i++){
                        $("#addTeas").append("<option>"+data[i].teaName+"</option>")
                    }
                }
            });

        })
        var teaId
        function updateExamTea(id) {
            teaId=id;
        }

        function keepExamTea() {

            var gradeName= $("#UpTeaGrade").val()
            var className= $("#UpTeaClass").val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/updateEXamTea",
                async:true,
                data:{"teaId":teaId,"gradeName":gradeName,"className":className},
                success:function(data) {
                    if (data) {
                        setTimeout(function(){  alert("修改成功！"); location.reload()}, 500);
                    }else {
                        alert("修改失败！")
                    }
                }
            });
        }

        function addExamTea() {
            var gradeName= $("#addTeaGrade").val()
            var className= $("#addTeaClass").val()
            var teaName=$("#addTeas").val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/addEXamTea",
                async:true,
                data:{"teaName":teaName,"gradeName":gradeName,"className":className},
                success:function(data) {
                    if (data) {
                        setTimeout(function(){  alert("添加成功！"); location.reload()}, 500);
                    }else {
                        alert("添加失败！")
                    }
                }
            });
        }

        function deleteTeaExam(id) {
            if (confirm("你确定要删除吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/adminDeleteTeaExam",
                    async:true,
                    data:{"teaId":id},
                    success:function(data) {
                        if (data) {
                            setTimeout(function(){  alert("删除成功！");  location.reload()}, 500);
                        }else {
                            alert("删除失败！")
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>
<div class="panel panel-success" style="height: 420px;overflow: auto;">
    <div class="panel-heading" align="center">
        <span class="iconfont icon-kaoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">考场安排</span>&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <div class="panel-body">
        <table class="table table-striped">
            <thead><td align="right" colspan="4">
                <button type="button" class="btn btn-success"
                                                 data-toggle="modal" data-target="#addExamTea">
                添加监考老师
            </button>
            </td>
            </thead>
            <tr>
            <th>监考老师</th>
            <th>教职工号</th>
            <th>监考地点</th>
            <th>操作</th>
            </tr>
            <tbody>
            <c:forEach items="${teacherExam}" var="tea">
                <tr>
                    <td>${tea.teaName}</td>
                    <td>${tea.teaNum}</td>
                    <td>${tea.examClass.gradeName} ${tea.examClass.className}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                    data-toggle="modal" data-target="#updateExamTea" onclick="updateExamTea(${tea.tea_id})">
                        修改
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-danger" onclick="deleteTeaExam(${tea.tea_id})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="updateExamTea" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"></button>
                    <h4 class="modal-title">教师考场修改</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal" >

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">级部:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="UpTeaGrade">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="UpTeaClass">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                    <button class="btn btn-primary" type="button" onclick="keepExamTea()">保存修改</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addExamTea" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"></button>
                    <h4 class="modal-title">添加监考老师</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal" >

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">监考老师:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="addTeas">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">级部:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="addTeaGrade">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="addTeaClass">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                    <button class="btn btn-primary" type="button" onclick="addExamTea()">添加</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
