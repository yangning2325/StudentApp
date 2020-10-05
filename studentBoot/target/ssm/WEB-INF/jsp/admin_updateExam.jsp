<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/1
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        var e_id;
        function updateExamTime(id) {
            e_id=id;
        }
        function keepExams(){

            var e_date= $("#e_date").val()

            if (confirm("你确定要修改吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/updateExamTime",
                    contentType:"application/json;charset=UTF-8",
                    async:true,
                    data:JSON.stringify({e_id:e_id,e_date:e_date}),
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
    </script>
</head>
<body>
<div class="panel panel-danger" style="height: 420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-kaoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">考试时间</span>
    </div>
    <div class="panel-body">

        <table class="table table-hover">
                <th>考试科目</th>
                <th>考试时间</th>
                <th>操作</th>
            <c:forEach items="${exams}" var="list">
                <tr>
                    <td>${list.e_course}</td>
                    <td>${list.e_date}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                data-toggle="modal" data-target="#updatExam" onclick="updateExamTime(${list.e_id})">
                            修改
                        </button>
                    </td>
                </tr>

            </c:forEach>
        </table>
        <div class="modal fade" id="updatExam" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">考试时间修改</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">考试时间:</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" name="e_date" class="form-control" id="e_date">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                        <button class="btn btn-primary" type="button" onclick="keepExams()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
