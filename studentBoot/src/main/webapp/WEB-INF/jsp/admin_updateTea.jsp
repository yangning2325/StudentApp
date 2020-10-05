<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/29
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/adminFindClass",
                async:true,
                success:function(data) {
                    for (var i=0;i<data.length;i++){
                        $("#gradeName2").append("<option>"+data[i].gradeName+"</option>")
                        $("#className2").append("<option>"+data[i].className+"</option>")
                    }

                }
            });
        })
        var teaId;
        function updateTea(id) {
            teaId=id;
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/adminFindTea",
                async:true,
                data:{"teaId":teaId},
                success:function(data) {
                    $("#userName2").val(data.userName)
                    $("#teaName").val(data.teaName)
                    $("#teaNum").val(data.teaNum)
                    $("#teaCourse").val(data.teaCourse)
                }
            });
        }

        function keepTea(){
            var userName= $("#userName2").val()
            var teaName= $("#teaName").val()
            var teaNum= $("#teaNum").val()
            var gradeName= $("#gradeName2").val()
            var className= $("#className2").val()
            var teaSex;
            var sex= $(".teaSex")
            for (var i=0;i<sex.length;i++){
                if (sex[i].checked) {
                    teaSex=sex[i].value
                }
            }
            var teaCourse= $("#teaCourse").val()
            var t = confirm("你确定要修改吗？");
            if (t) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/adminUpdateTea",
                    async:true,
                    data:{"teaId":teaId,"userName":userName,"teaName":teaName,
                        "teaNum":teaNum,"gradeName":gradeName,"className":className,
                        "teaSex":teaSex,"teaCourse":teaCourse},
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
 /*       function closeAll(){
            $("#userName2").val("")
            $("#teaName").val("")
            $("#teaNum").val("")
            $("#teaCourse").val("")
        }*/

        function deleteTea(id) {
            if (confirm("你确定要删除吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/adminDeleteTea",
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
<div class="panel panel-info"  style="height:420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-nanlaoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">老师信息操作</span>
    </div>
    <div class="panel-body" >

        <table class="table table-hover">
            <thead>
            <th>账号</th>
            <th>姓名</th>
            <th>职工号</th>
            <th>性别</th>
            <th>所授班级</th>
            <th>所授科目</th>
            <th>操作</th>
            </thead>
            <tbody id="tables">
            <c:forEach items="${teachers}" var="list">
                    <td>${list.userName}</td>
                    <td>${list.teaName}</td>
                    <td>${list.teaNum}</td>
                    <td>${list.teaSex}</td>
                    <td> ${list.classes.gradeName}${list.classes.className}&nbsp;</td>

                    <td>${list.teaCourse}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                data-toggle="modal" data-target="#myModal1" onclick="updateTea(${list.tea_id})">
                                修改
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-danger" onclick="deleteTea(${list.tea_id})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="myModal1" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">老师信息修改</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal" id="forms">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="userName" class="form-control" id="userName2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">姓名:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="teaName"class="form-control" id="teaName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">职工号:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="teaNum" class="form-control" id="teaNum">
                                </div>
                            </div>
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">级部:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="gradeName2">

                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">班级:</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="className2">
                                        </select>
                                    </div>
                                </div>
<%--                            </c:forEach>--%>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别:</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="sex" class="teaSex" value="男" checked>男
                                    &nbsp;&nbsp; &nbsp;&nbsp;
                                    <input type="radio" name="sex" class="teaSex" value="女">女
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">所授科目:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="teaCourse" class="form-control" id="teaCourse">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" onclick="closeAll()">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="keepTea()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
