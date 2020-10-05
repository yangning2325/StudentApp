<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/24
  Time: 21:01
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
                url:"${pageContext.request.contextPath}/getExamRule",
                async:true,
                success:function (data) {
                    for (var i=0;i<data.length;i++){
                        $("#rules").append("<span>"+data[i].message+"</span>"+"<br/>")
                    }
                }
            });
        })
    </script>
</head>
<body>
<div class="panel panel-danger" style="height: 420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-kaoshi"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">考试规定</span>
    </div>
    <div class="panel-body">
        <p class="text-warning" style="font-size: 15px;" align="left" id="rules">

        </p>
    </div>
</div>

</body>
</html>
