<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/30
  Time: 10:53
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
        function addTea() {
            var tea_id= $("#tea_id3").val()
            var userName= $("#userName3").val()
            var password= $("#password3").val()
            var teaName= $("#teaName3").val()
            var teaNum= $("#teaNum3").val()
            var gradeName= $("#gradeName3").val()
            var className= $("#className3").val()
            var teaSex;
            var sex= $(".teaSex3")
            for (var i=0;i<sex.length;i++){
                if (sex[i].checked) {
                    teaSex=sex[i].value
                }
            }
            var teaCourse= $("#teaCourse3").val()

            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/adminAddTea",
                async:true,
                data:{"tea_id":tea_id,"userName":userName,"password":password,"teaName":teaName,
                    "teaNum":teaNum,"gradeName":gradeName,"className":className
                    ,"teaSex":teaSex,"teaCourse":teaCourse},
                success:function(data) {
                    if (data) {
                        setTimeout(function(){  alert("添加成功！"); location.reload()}, 800);
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
            <span class="iconfont icon-nanlaoshi"style="font-size: 25px;"></span>&nbsp;
            <span id="title" style="font-size: 20px;">添加老师</span>
        </div>
        <div class="panel-body" >
            <div class="form-horizontal" id="forms">

                <div class="form-group">
                    <label for="tea_id3" class="col-sm-2 control-label">老师Id:</label>
                    <div class="col-sm-10">
                        <input type="text" name="tea_id" class="form-control" id="tea_id3" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="userName3" class="col-sm-2 control-label">账号:</label>
                    <div class="col-sm-10">
                        <input type="text" name="userName" class="form-control" id="userName3" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="password3" class="col-sm-2 control-label">密码:</label>
                    <div class="col-sm-10">
                        <input type="password" name="password" class="form-control" id="password3" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="teaName3" class="col-sm-2 control-label">姓名:</label>
                    <div class="col-sm-10">
                        <input type="text" name="teaName" class="form-control" id="teaName3" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="teaNum3" class="col-sm-2 control-label">教职工号:</label>
                    <div class="col-sm-10">
                        <input type="text" name="teaNum" class="form-control" id="teaNum3" />
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">级部:</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="gradeName3">
                            <option>一年级</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">班级:</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="className3">
                            <option>1班</option>
                            <option>2班</option>
                            <option>3班</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">性别:</label>
                    <div class="col-sm-10">
                        <input type="radio" name="sex" class="teaSex3" value="男" checked>男
                        &nbsp;&nbsp; &nbsp;&nbsp;
                        <input type="radio" name="sex" class="teaSex3" value="女">女
                    </div>
                </div>

                <div class="form-group">
                    <label for="teaCourse3" class="col-sm-2 control-label">所授科目:</label>
                    <div class="col-sm-10">
                        <input type="text" name="teaCourse" class="form-control" id="teaCourse3">
                    </div>
                </div>
                <br/>
                <button type="submit" class="btn btn-success" onclick="addTea()">添加</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
