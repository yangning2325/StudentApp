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
    </script>
</head>
<body>
<div class="modal fade" id="teaMes" data-backdrop="static" tabindex="-1" role="dialog" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">教师信息</h4>
            </div>
            <div class="modal-body" style="font-size: 17px; color: darkgray;"align="center" >
                <div align="left" style="height: 300px;width: 400px;margin-top: 50px">
                    姓名：		<span>${TEACHER.teaName}</span><br />
                    职工号：		<span>${TEACHER.teaNum}</span><br />
                    年级：       <span>${TEACHER.classes.gradeName}</span><br />
                    班级：       <span>${TEACHER.classes.className}</span><br />
                    所授科目：   <span>${TEACHER.teaCourse}</span><br />
                    性别：		<span>${TEACHER.teaSex}</span><br/>
                    地址：		<span>${TEACHER.teaAddress}</span><br />
                    电话：		<span>${TEACHER.teaPhone}</span><br />
                    邮箱：		<span>${TEACHER.teaEmail}</span><br />
                    Q&nbsp;&nbsp;Q： 		<span>${TEACHER.teaQQ}</span><br />
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
