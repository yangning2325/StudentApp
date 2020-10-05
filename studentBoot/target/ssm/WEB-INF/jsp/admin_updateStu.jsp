<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/28
  Time: 15:21
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
                        $("#gradeName").append("<option>"+data[i].gradeName+"</option>")
                        $("#className").append("<option>"+data[i].className+"</option>")
                    }

                }
            });
        })
        var stuId;
        function updateStu(id) {
            stuId=id;
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/adminFindStu",
                async:true,
                data:{"stuId":stuId},
                success:function(data) {
                    $("#userName").val(data.userName)
                    $("#stuName").val(data.stuName)
                    $("#stuNum").val(data.stuNum)
                }
            });
        }

        function keepStu(){
            var userName= $("#userName").val()
            var stuName= $("#stuName").val()
            var stuNum= $("#stuNum").val()
            var gradeName= $("#gradeName").val()
            var className= $("#className").val()
            var stuSex;
            var sex= $(".stuSex")
            for (var i=0;i<sex.length;i++){
                if (sex[i].checked) {
                    stuSex=sex[i].value
                }
            }
            var stuBirth= $("#stuBirth").val()
            var t = confirm("你确定要修改吗？");
            if (t) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/adminUpdateStu",
                    async:true,
                    data:{"stuId":stuId,"userName":userName,"stuName":stuName,
                        "stuNum":stuNum,"gradeName":gradeName,"className":className
                        ,"stuSex":stuSex,"stuBirth":stuBirth},
                    success:function(data) {
                        if (data) {
                            setTimeout(function(){  alert("修改成功！"); location.reload()}, 500);
                        }else {
                            alert("修改失败！")
                        }
                    }
                });
            }
        }


        function deleteStu(id) {
                if (confirm("你确定要删除吗？")) {
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/adminDeleteStu",
                        async:true,
                        data:{"stuId":id},
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
<div class="panel panel-info"  style="height:420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-chengyuan"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">学生信息操作</span>
    </div>
    <div class="panel-body" >

        <table class="table table-hover">
            <thead>
            <th>账号</th>
            <th>姓名</th>
            <th>学号</th>
            <th>班级</th>
            <th>性别</th>
            <th>出生年月</th>
            <th>操作</th>
            </thead>
            <tbody id="tables">
            <c:forEach items="${students}" var="list">
                <tr>
                    <td>${list.userName}</td>
                    <td>${list.stuName}</td>
                    <td>${list.stuNum}</td>
                    <td>${list.classes.gradeName}${list.classes.className}</td>
                    <td>${list.stuSex}</td>
                    <td>${list.stuBirth}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                data-toggle="modal" data-target="#myModal" onclick="updateStu(${list.stu_id})">
                            修改
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-danger" onclick="deleteStu(${list.stu_id})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="myModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">学生信息修改</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal" id="forms">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="userName" class="form-control" id="userName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">姓名:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stuName" class="form-control" id="stuName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">学号:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stuNum" class="form-control" id="stuNum">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">级部:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="gradeName">

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">班级:</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="className">
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别:</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="sex" class="stuSex" value="男" checked>男
                                    &nbsp;&nbsp; &nbsp;&nbsp;
                                    <input type="radio" name="sex" class="stuSex" value="女">女
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="stuBirth" class="col-sm-2 control-label">出生年月:</label>
                                <div class="col-sm-10">
                                    <input type="date" name="stuBirth" class="form-control" id="stuBirth">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" onclick="closeWin()">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="keepStu()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
