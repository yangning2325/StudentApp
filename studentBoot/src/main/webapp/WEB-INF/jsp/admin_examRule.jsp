<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/24
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        var id;
        function updateRul(RulerId) {
            id=RulerId;
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/findEXamRuler",
                async:true,
                data:{"id":id},
                success:function(data) {
                    $("#rulers").html(data.message)
                }
            });
        }

        function keepRuler(){
            var message= $("#rulers").val()
            if (confirm("你确定要修改吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/UpdateEXamRuler",
                    contentType:"application/json;charset=UTF-8",
                    async:true,
                    data:JSON.stringify({id:id,message:message}),
                    success:function(data) {
                        if (data) {
                            setTimeout(function(){  alert("修改成功！"); location.reload()
                                $("#form_in6").show()
                            }, 500);
                        }else {
                            alert("修改失败！")
                        }
                    }
                });
            }
        }


        function deleteRul(c_id) {
            if (confirm("你确定要删除吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/DeleteEXamRuler",
                    async:true,
                    data:{"id":c_id},
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

        function addRul() {
            var message=$("#message").val()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/addEXamRuler",
                async:true,
                data:{"message":message},
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
        <span class="iconfont icon-kaoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">考试规定</span>
    </div>
    <div class="panel-body">

            <table class="table table-hover">
                <tr><td align="right" colspan="2">
                    <button type="button" class="btn btn-success"
                            data-toggle="modal" data-target="#addRuler">
                        添加
                    </button>
                </td></tr>
                <c:forEach items="${rule}" var="list">
                    <tr>
                    <th>
                    <button type="button" class="btn btn-primary"
                            data-toggle="modal" data-target="#updateRuler" onclick="updateRul(${list.id})">
                        修改
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-danger" onclick="deleteRul(${list.id})">删除</button>
                    </th>
                        <td><p class="text-warning" style="font-size: 15px;" align="left" id="rules">${list.message}</p></td>
                    </tr>
                </c:forEach>
            </table>
        <div class="modal fade" id="updateRuler" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">考试规则修改</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">考试规则:</label>
                                <div class="col-sm-10">

                                    <textarea  class="form-control" name="message" id="rulers"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                        <button class="btn btn-primary" type="button" onclick="keepRuler()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="addRuler" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">添加考试规则</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal" >

                            <div class="form-group">
                                <label class="col-sm-2 control-label">考试规则:</label>
                                <div class="col-sm-10">
                                    <textarea  class="form-control" name="message" id="message"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                        <button class="btn btn-primary" type="button" onclick="addRul()">添加</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
