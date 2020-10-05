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
                        $("#UpStuGrade").append("<option>"+data[i].gradeName+"</option>")
                        $("#UpStuClass").append("<option>"+data[i].className+"</option>")
                        $("#addStuGrade").append("<option>"+data[i].gradeName+"</option>")
                        $("#addStuClass").append("<option>"+data[i].className+"</option>")
                    }

                }
            });
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/findNotExamStu",
                async:true,
                success:function(data) {
                    for (var i=0;i<data.length;i++){
                        $("#addStus").append("<option>"+data[i].stuName+"</option>")
                    }
                }
            });

        })
        var stuId
        function updateExamStu(id) {
            stuId=id;
        }

        function keepExamStu() {

            var gradeName= $("#UpStuGrade").val()
            var className= $("#UpStuClass").val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/updateEXamStu",
                async:true,
                data:{"stuId":stuId,"gradeName":gradeName,"className":className},
                success:function(data) {
                    if (data) {
                        setTimeout(function(){  alert("修改成功！"); location.reload()}, 500);
                    }else {
                        alert("修改失败！")
                    }
                }
            });
        }

        function addExamStu() {
            var gradeName= $("#addStuGrade").val()
            var className= $("#addStuClass").val()
            var stuName=$("#addStus").val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/addEXamStu",
                async:true,
                data:{"stuName":stuName,"gradeName":gradeName,"className":className},
                success:function(data) {
                    if (data) {
                        setTimeout(function(){  alert("添加成功！"); location.reload()}, 500);
                    }else {
                        alert("添加失败！")
                    }
                }
            });
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
                                                 data-toggle="modal" data-target="#addExamStu">
                添加考生
            </button>
            </td>
            </thead>
            <tr>
            <th>考生</th>
            <th>考号</th>
            <th>考试地点</th>
            <th>操作</th>
            </tr>
            <tbody>
            <c:forEach items="${examMessages}" var="stu">
                <tr>
                    <td>${stu.stuName}</td>
                    <td>${stu.stuNum}</td>
                    <td>${stu.examClass.gradeName} ${stu.examClass.className}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                    data-toggle="modal" data-target="#updateExamStu" onclick="updateExamStu(${stu.stu_id})">
                        修改
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="updateExamStu" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"></button>
                    <h4 class="modal-title">考生考场修改</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal" >

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">级部:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="UpStuGrade">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="UpStuClass">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                    <button class="btn btn-primary" type="button" onclick="keepExamStu()">保存修改</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addExamStu" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"></button>
                    <h4 class="modal-title">添加考生</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal" >

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">考生:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="addStus">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">级部:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="addStuGrade">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="addStuClass">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                    <button class="btn btn-primary" type="button" onclick="addExamStu()">添加</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
