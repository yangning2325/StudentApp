<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/04
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        var gra_id;
        var num;
        function updateStuGrade(id) {
            gra_id=id;
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/findOneStuGra",
                async:true,
                data:{"gra_id":gra_id},
                success:function(data) {
                    $("#stu_name").val(data.stu_name)
                    $("#stuClass").val(data.stu_Grade+" "+data.stu_Class)
                    $("#gra_Chinese").val(data.gra_Chinese)
                    $("#gra_Math").val(data.gra_Math)
                    $("#gra_English").val(data.gra_English)
                }
            });
        }

        function keepStuGrade(){
            var stu_name= $("#stu_name").val()
            var gra_Chinese= $("#gra_Chinese").val()
            var gra_Math= $("#gra_Math").val()
            var gra_English= $("#gra_English").val()
            var allGrade= (gra_Chinese*1)+(gra_English*1)+(gra_Math*1)
            var ranks= $("#ranks").val()
            if ( confirm("你确定要修改吗？")) {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/updateStuGrades",
                    async:true,
                    contentType:"application/json;charset=UTF-8",
                    data:JSON.stringify({gra_id:gra_id,stu_name:stu_name,
                        gra_Chinese:gra_Chinese,gra_Math:gra_Math,gra_English:gra_English,allGrade:allGrade}),
                    success:function(data) {
                        if (data) {
                            setTimeout(function(){  alert("修改成功！"); },200);
                        }else {
                            alert("修改失败！")
                        }
                    }
                });
            }
        }
    function clearGrade() {
        if ( confirm("你确定要清空成绩吗？")) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/clearGrades",
                async:true,
                success:function(data) {
                    if (data) {
                        setTimeout(function(){  alert("清空成功！"); location.reload()}, 500);
                    }else {
                        alert("清空失败！")
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
        <span class="iconfont icon-chengji-"style="font-size: 25px;"></span>&nbsp;
        <span style="font-size: 20px;">学生成绩操作</span>
    </div>
    <div class="panel-body" >

        <table class="table table-hover">
            <thead><td align="right" colspan="9">
                <button type="button" class="btn btn-danger" onclick="clearGrade()">
                    清空成绩
                </button>
            </td>
            </thead>
            <thead>
            <th>编号</th>
            <th>姓名</th>
            <th>班级</th>
            <th>语文</th>
            <th>数学</th>
            <th>英语</th>
            <th>总分</th>
            <th>级部排名</th>
            <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${grades}" var="gra" varStatus="varStatus">
                <tr>
                    <td>${varStatus.count}</td>
                    <td>${gra.stu_name}</td>
                    <td>${gra.stu_Grade}&nbsp;${gra.stu_Class}</td>
                    <td>${gra.gra_Chinese}</td>
                    <td>${gra.gra_Math}</td>
                    <td>${gra.gra_English}</td>
                    <td>${gra.allGrade}</td>
                    <td>${varStatus.count}</td>
                    <td>
                        <button type="button" class="btn btn-primary"
                                data-toggle="modal" data-target="#stuGrade" onclick="updateStuGrade(${gra.gra_id})">
                            修改
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="stuGrade" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button"></button>
                        <h4 class="modal-title">学生成绩修改</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">姓名:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stu_name" class="form-control" id="stu_name" readonly>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">班级:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stuClass" class="form-control" id="stuClass" readonly>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">语文:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="gra_Chinese" class="form-control" id="gra_Chinese">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">数学:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="gra_Math" class="form-control" id="gra_Math">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">英语:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="gra_English" class="form-control" id="gra_English">
                                </div>
                            </div>

        <%--                    <div class="form-group">
                                <label class="col-sm-2 control-label">总分:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="allGrade" class="form-control" id="allGrade">
                                </div>
                            </div>--%>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="keepStuGrade()">保存修改</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
