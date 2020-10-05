<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/10/2
  Time: 21:23
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
                url:"${pageContext.request.contextPath}/findSchoolAdv",
                async:true,
                success:function (data) {
                   for (var i=0;i<data.length;i++) {
                       $("#adv").append("<span>"+data[i].advice+
                           "&nbsp;&nbsp;&nbsp;&nbsp;"+data[i].time+"</span><br/>")
                   }
                }
            });
        })
    </script>
</head>
<body>
<div class="modal fade" id="schoolAdvice" data-backdrop="static" tabindex="-1" role="dialog" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">学校通知信息</h4>
            </div>
            <div class="modal-body" style="font-size: 17px; color: darkgray;"align="center" >
                <div align="left" style="width: 400px;" id="adv">

                </div>

            </div>
            <div class="modal-footer">
                <button id="closes" data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div style="height:200px"></div>
</body>
</html>
