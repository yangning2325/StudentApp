<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/25
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/getStuClass",
                async:true,
                success:function (data) {
                    $("#stu_Grade").html(data.gradeName)
                    $("#stu_Class").html(data.className)
                }
            });

            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/getStuMessage",
                async:true,
                success:function (data) {
                    $("#stu_Name").html(data.stuName)
                    $("#stu_Num").html(data.stuNum)
                    $("#stu_Grade").html(data.classes.gradeName)
                    $("#stu_Class").html(data.classes.className)
                    $("#stu_Sex").html(data.stuSex)
                    $("#stu_Birth").html(data.stuBirth)
                    $("#stu_Address").html(data.stuAddress)
                    $("#stu_Phone").html(data.stuPhone)
                    $("#stu_Email").html(data.stuEmail)
                    $("#stu_QQ").html(data.stuQQ)
                }
            });
        })

    </script>
</head>
<body>
<div class="modal fade" id="myModal" data-backdrop="static" tabindex="-1" role="dialog" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">学生信息</h4>
            </div>
            <div class="modal-body" style="font-size: 17px; color: darkgray;"align="center" >
                <div align="left" style="height: 300px;width: 400px;margin-top: 50px">
                    姓名：		<span id="stu_Name"></span><br />
                    学号：		<span id="stu_Num"></span><br />
                    年级：       <span id="stu_Grade"></span><br />
                    班级：       <span id="stu_Class"></span><br />
                    性别：		<span id="stu_Sex"></span><br/>
                    出生：      <span id="stu_Birth"></span><br/>
                    地址：		<span id="stu_Address"></span><br />
                    电话：		<span id="stu_Phone"></span><br />
                    邮箱：		<span id="stu_Email"></span><br />
                    Q&nbsp;&nbsp;Q： 		<span id="stu_QQ"></span><br />
                </div>

            </div>
            <div class="modal-footer">
                <button id="close" data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div style="height:200px"></div>
</body>
</html>
