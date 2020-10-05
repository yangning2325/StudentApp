<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/01
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">

        function deleteAdvice(id) {
            if (confirm("你确定要删除吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/deleteAdvice",
                    async:true,
                    data:{"id":id},
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


        function addAdvice() {
            var advice= $("#schoolAdvices").val()
            var date = new Date();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var time = date.getFullYear() + "年" + month + "月" + strDate
                + "日" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/addAdvice",
                async:true,
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify({advice:advice,time:time}),
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
<div class="panel panel-danger" style="height: 420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-tongzhi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">学校通知</span>
    </div>
    <div class="panel-body">

            <table class="table table-hover">
                <tr><td align="right" colspan="3">
                    <button type="button" class="btn btn-success"
                            data-toggle="modal" data-target="#addAdvice">
                        添加
                    </button>
                </td></tr>
                <tr>
                    <th>操作</th>
                    <th>通知信息</th>
                    <th>通知时间</th>
                </tr>

                <c:forEach items="${advice}" var="list">
                    <tr>
                    <th>
                    <button type="button" class="btn btn-danger" onclick="deleteAdvice(${list.id})">删除</button>
                    </th>
                        <td><p class="text-warning" style="font-size: 15px;" align="left" id="advices">${list.advice}</p></td>
                        <td>${list.time}</td>
                    </tr>
                </c:forEach>
            </table>
        <div class="modal fade" id="addAdvice" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">学校通知</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal" >

                            <div class="form-group">
                                <label class="col-sm-2 control-label">通知内容:</label>
                                <div class="col-sm-10">
                                    <textarea  class="form-control" name="advice" id="schoolAdvices"></textarea>                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                        <button class="btn btn-primary" type="button" onclick="addAdvice()">添加</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
