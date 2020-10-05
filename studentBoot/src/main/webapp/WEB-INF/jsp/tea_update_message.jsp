<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/3
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
/*        #boxAll1{
            width: 1080px;
            height: 400px;
            position: relative;
            left: -15px;
        }*/
        #forms{
            width: 600px;
            height: 400px;
            margin: 10px auto;
        }
        .form-control{
            width: 260px;
        }
    </style>
    <script type="text/javascript">
        function updateTea(tea_id){

                var teaAddress= $("#teaAddress").val()
                var teaPhone= $("#teaPhone").val()
                var teaEmail= $("#teaEmail").val()
                var teaQQ= $("#teaQQ").val()
                if (confirm("你确定要修改吗？")) {
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/updateTeaMessage",
                        contentType:"application/json;charset=UTF-8",
                        async:true,
                        data:JSON.stringify({tea_id:tea_id,teaAddress:teaAddress,teaPhone:teaPhone,teaEmail:teaEmail,teaQQ:teaQQ}),
                        success:function(data) {
                            if (data) {
                                setTimeout(function(){  alert("修改成功！");}, 500);
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
    <div class="panel panel-success" style="height: 420px">
        <div class="panel-heading">
            <span class="iconfont icon-chengyuan"style="font-size: 25px;"></span>&nbsp;
            <span id="title" style="font-size: 20px;">个人信息修改</span>
        </div>
        <div class="panel-body" >
            <div class="form-horizontal" id="forms">

                <div class="form-group">
                    <label for="teaAddress" class="col-sm-2 control-label">地址:</label>
                    <div class="col-sm-10">
                        <input type="text" name="teaAddress" class="form-control" id="teaAddress" value=${TEACHER.teaAddress}>
                    </div>
                </div>

                <div class="form-group">
                    <label for="teaPhone" class="col-sm-2 control-label">电话:</label>
                    <div class="col-sm-10">
                        <input type="text" name="teaPhone" class="form-control" id="teaPhone" value=${TEACHER.teaPhone}>
                    </div>
                </div>

                <div class="form-group">
                    <label for="teaEmail" class="col-sm-2 control-label">邮箱:</label>
                    <div class="col-sm-10">
                        <input type="email" name="teaEmail" class="form-control" id="teaEmail" value=${TEACHER.teaEmail}>
                    </div>
                </div>

                <div class="form-group">
                    <label for="teaQQ" class="col-sm-2 control-label">QQ:</label>
                    <div class="col-sm-10">
                        <input type="text" name="teaQQ" class="form-control" id="teaQQ" value=${TEACHER.teaQQ}>
                    </div>
                </div>
                <br/>
                <button type="submit" class="btn btn-success" onclick="updateTea(${TEACHER.tea_id})">修改</button>
            </div>
        </div>
    </div>
</body>
</html>
