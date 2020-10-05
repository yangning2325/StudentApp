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
        #box{
            width: 1100px;
            height: 400px;
        }
        #inbox{
            width: 650px;
            height: 400px;
            margin: 20px auto;
            position: relative;
        }
        .form-control{
            width: 260px;
        }

        #checkPw,#checkPw1,#checkPw2{
            font-size: 12px;
            color: red;
            position: absolute;
            top: 10px;
            left: 405px;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            var pwOk=false;
            var pwOk1=false;
            var pwOk2=false;
            var pw=null
            $("#password").blur(function  () {
                pw=$(this).val();
                if (pw==""||pw==null) {
                    $("#checkPw").html("旧密码不能为空！")
                    pwOk=false;
                }else{
                    pwOk=true;
                }
            })
            $("#password").focus(function () {
                $("#checkPw").html("")
            })
            var pw1=null
            $("#password1").blur(function  () {
                pw1=$(this).val();
                if (pw1=="" || pw1==null) {
                    $("#checkPw1").html("新密码不能为空！")
                    pwOk1=false;
                }else if (pw1==pw){
                    $("#checkPw1").html("新密码与旧密码重复！")
                    pwOk1=false;
                } else{
                    pwOk1= true;
                }

            })
            $("#password1").focus(function () {
                $("#checkPw1").html("")
            })

            $("#password2").blur(function  () {
                var pw2=$(this).val();
                if (pw2=="" || pw2==null) {
                    $("#checkPw2").html("确认密码不能为空！")
                    pwOk2=false;
                }else if (pw2!=pw1) {
                    $("#checkPw2").html("两次密码输入不一致！")
                    pwOk2=false;
                } else{
                    pwOk2= true;
                }

            })
            $("#password2").focus(function () {
                $("#checkPw2").html("")
            })

            $("#btt").click(function () {
                var password=$("#password").val();
                var password1=$("#password1").val();
                if (pwOk&&pwOk1&&pwOk2) {
                    if (confirm("你确定要修改吗？")) {
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/updateTeaPw",
                        async:true,
                        data:{"password":password,"password1":password1},
                        success:function (data) {
                            if (!data){
                                $("#checkPw").html("原密码错误")
                            }else {
                                alert("修改成功！")
                                $("#password").val("")
                                $("#password1").val("")
                                $("#password2").val("")
                            }
                        }
                    });
                    }
                }
            })
        })

    </script>
</head>
<body>

<div class="panel panel-success" style="height: 420px">
    <div class="panel-heading">
        <span class="iconfont icon-mima1"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">密码修改</span>
    </div>

    <div id="box">
        <div id="inbox">
            <div class="panel-body">
                <div class="form-horizontal" >
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">旧的密码:</label>
                        <div class="col-sm-10" >
                            <input type="password" name="password" class="form-control" id="password">
                            <span id="checkPw"></span>
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <label for="password1" class="col-sm-2 control-label">新的密码:</label>
                        <div class="col-sm-10">
                            <input type="password" name="password1" class="form-control" id="password1" >
                            <span id="checkPw1"></span>
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <label for="password2" class="col-sm-2 control-label">确认密码:</label>
                        <div class="col-sm-10">
                            <input type="password" name="password2" class="form-control" id="password2" >
                            <span id="checkPw2"> </span>
                        </div>
                    </div>
                    <br/>
                    <button id="btt" class="btn btn-success">修改</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
