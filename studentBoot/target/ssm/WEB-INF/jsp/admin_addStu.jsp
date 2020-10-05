<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/29
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #boxAll1{
            width: 1080px;
            height: 400px;
            position: relative;
            left: -15px;
        }
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
        function addStu() {
            var stu_id= $("#stu_id1").val()
            var userName= $("#userName1").val()
            var password= $("#password1").val()
            var stuName= $("#stuName1").val()
            var stuNum= $("#stuNum1").val()
            var gradeName= $("#gradeName1").val()
            var className= $("#className1").val()
            var stuSex;
            var sex= $(".stuSex1")
            for (var i=0;i<sex.length;i++){
                if (sex[i].checked) {
                    stuSex=sex[i].value
                }
            }
            var stuBirth= $("#stuBirth1").val()

            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/adminAddStu",
                async:true,
                data:{"stu_id":stu_id,"userName":userName,"password":password,"stuName":stuName,
                    "stuNum":stuNum,"gradeName":gradeName,"className":className
                    ,"stuSex":stuSex,"stuBirth":stuBirth},
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
    <div id="box">
        <div class="panel panel-success" id="boxAll1"  style="height:420px;overflow: auto">
            <div class="panel-heading">
                <span class="iconfont icon-chengyuan"style="font-size: 25px;"></span>&nbsp;
                <span id="title" style="font-size: 20px;">添加学生</span>
            </div>
            <div class="panel-body" >
                <div class="form-horizontal" id="forms">

                    <div class="form-group">
                        <label for="stu_id1" class="col-sm-2 control-label">学生Id:</label>
                        <div class="col-sm-10">
                            <input type="text" name="stu_id" class="form-control" id="stu_id1" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userName1" class="col-sm-2 control-label">账号:</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" class="form-control" id="userName1" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password1" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="password1" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stuName1" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" name="stuName" class="form-control" id="stuName1" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stuNum1" class="col-sm-2 control-label">学号:</label>
                        <div class="col-sm-10">
                            <input type="text" name="stuNum" class="form-control" id="stuNum1" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">级部:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="gradeName1">
                            <option>一年级</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">班级:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="className1">
                                <option>1班</option>
                                <option>2班</option>
                                <option>3班</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10">
                            <input type="radio" name="sex" class="stuSex1" value="男"checked>男
                            &nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="radio" name="sex" class="stuSex1" value="女">女
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stuBirth1" class="col-sm-2 control-label">出生年月:</label>
                        <div class="col-sm-10">
                            <input type="date" name="stuBirth" class="form-control" id="stuBirth1">
                        </div>
                    </div>
                    <br/>
                    <button type="submit" class="btn btn-success" onclick="addStu()">添加</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
