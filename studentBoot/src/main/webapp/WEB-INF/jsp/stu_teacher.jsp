<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/24
  Time: 20:14
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
                url:"${pageContext.request.contextPath}/getStuTeachers",
                async:true,
                success:function (data) {
                    for(var i=0; i<data.length;i++){
                        // alert(data[i].teaName)
                        $("#tables").append("<tr>"+"<td>"+data[i].teaName+"</td>"+
                                                "<td>"+data[i].teaCourse+"</td>"+
                                                "<td>"+data[i].teaPhone+"</td>"+
                                                "<td>"+data[i].teaEmail+"</td>"+
                                                "<td>"+data[i].teaQQ+"</td>"+"</tr>")

                    }

                }
            });
        })
    </script>
</head>
<body>
<div class="panel panel-warning" style="height: 420px">
    <div class="panel-heading">
        <span class="iconfont icon-laoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">老师信息</span>
    </div>
    <div class="panel-body">

        <table class="table table-hover">
            <thead>
            <th>姓名</th>
            <th>课程</th>
            <th align="center">电话</th>
            <th>邮箱</th>
            <th>QQ</th>

            </thead>
            <tbody id="tables">
            </tbody>
        </table>

    </div>
</div>


</body>
</html>
