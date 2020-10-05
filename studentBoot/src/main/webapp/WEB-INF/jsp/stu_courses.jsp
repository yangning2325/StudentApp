<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/24
  Time: 20:38
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
                url:"${pageContext.request.contextPath}/findCourseTable",
                async:true,
                success:function (data) {
                    var arr=new Array(7);
                    for (var m = 0;m < arr.length; m++) {
                        arr[m] =new Array();
                    }
                    for(var n=0,j = 0;n<data.length;n++,j++){
                        arr[0][j] = data[n].one;
                        arr[1][j] = data[n].two;
                        arr[2][j] = data[n].three;
                        arr[3][j] = data[n].four;
                        arr[4][j] = data[n].five;
                        arr[5][j] = data[n].six;
                        arr[6][j] = data[n].seven;
                        // j++;
                    }
                           for (var i = 0;i < 5; i++) {
                               $("#one").append("<td>"+arr[0][i]+"</td>")
                               $("#two").append("<td>"+arr[1][i]+"</td>")
                               $("#three").append("<td>"+arr[2][i]+"</td>")
                               $("#four").append("<td>"+arr[3][i]+"</td>")
                               $("#five").append("<td>"+arr[4][i]+"</td>")
                               $("#six").append("<td>"+arr[5][i]+"</td>")
                               $("#seven").append("<td>"+arr[6][i]+"</td>")
                           }
                       }
            });
        })
    </script>
</head>
<body>

<div class="panel panel-warning" style="height: 420px">
    <div class="panel-heading">
        <span class="iconfont icon-kechengbiao"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">${STUDENT.classes.gradeName}${STUDENT.classes.className}&nbsp;课程表</span>
    </div>
    <div class="panel-body">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <th></th>
            <th>周一</th>
            <th>周二</th>
            <th>周三</th>
            <th>周四</th>
            <th>周五</th>

            </thead>
            <tbody id="coursers">
            <tr id="one">
                <th>第一节</th>
            </tr>
            <tr id="two">
                <th>第二节</th>

            </tr>
            <tr id="three">
                <th>第三节</th>
            </tr>
            <tr id="four">
                <th>第四节</th>

            </tr>
            <tr><td colspan="6" align="center">午休</td></tr>
            <tr id="five">
                <th>第五节</th>

            </tr>
            <tr id="six">
                <th>第六节</th>

            </tr>
            <tr id="seven">
                <th>第七节</th>
            </tr>
            </tr>
            <tr><td colspan="6" align="center">晚休</td></tr>
            <tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
