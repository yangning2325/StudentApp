<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/30
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        var id;
        function updateCourse(CourseId) {
            id=CourseId;
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/findOneCourseTab",
                async:true,
                data:{"id":id},
                success:function(data) {
                    $("#one").val(data.one)
                    $("#two").val(data.two)
                    $("#three").val(data.three)
                   $("#four").val(data.four)
                    $("#five").val(data.five)
                   $("#six").val(data.six)
                    $("#seven").val(data.seven)
                }
            });
        }

        function keepCourse(){
            var one= $("#one").val()
            var two= $("#two").val()
            var three= $("#three").val()
            var four= $("#four").val()
            var five= $("#five").val()
            var six=$("#six").val()
            var seven= $("#seven").val()
            if (confirm("你确定要修改吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/updateCourseTab",
                    contentType:"application/json;charset=UTF-8",
                    async:true,
                    data:JSON.stringify({id:id,one:one,two:two,
                        three:three,four:four,five:five,
                        six:six,seven:seven}),
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
<div class="panel panel-info"  style="height:420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-kechengbiao1"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">课程表修改</span>
    </div>
    <div class="panel-body" >

        <table class="table table-hover">
            <thead>
            <th></th>
            <th>班级</th>
            <th>第一节</th>
            <th>第二节</th>
            <th>第三节</th>
            <th>第四节</th>
            <th>第五节</th>
            <th>第六节</th>
            <th>第七节</th>
            <th>操作</th>
            </thead>
            <tbody id="tables">
            <c:forEach items="${tables}" var="list">
                <tr>
                    <th>${list.week}</th>
                    <td>${list.classes.gradeName} ${list.classes.className}</td>
                    <td>${list.one}</td>
                    <td>${list.two}</td>
                    <td>${list.three}</td>
                    <td>${list.four}</td>
                    <td>${list.five}</td>
                    <td>${list.six}</td>
                    <td>${list.seven}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                data-toggle="modal" data-target="#myModal2" onclick="updateCourse(${list.id})">
                            修改
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="myModal2" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">课程表修改</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal" id="forms">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">第一节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="one" class="form-control" id="one">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">第二节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="two" class="form-control" id="two">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">第三节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="three" class="form-control" id="three">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">第四节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="four" class="form-control" id="four">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">第五节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="five" class="form-control" id="five">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">第六节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="six" class="form-control" id="six">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">第七节:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="seven" class="form-control" id="seven">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button" >关闭</button>
                        <button class="btn btn-primary" type="button" onclick="keepCourse()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
