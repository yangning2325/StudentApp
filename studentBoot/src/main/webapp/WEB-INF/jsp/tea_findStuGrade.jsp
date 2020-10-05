<%--
  Created by IntelliJ IDEA.
  User: 杨宁
  Date: 2020/9/28
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function findClassGrade() {
            var stu_Grade =$("#grade_Name").val()
            var stu_Class=$("#class_Name").val()
      /*      alert(stu_Grade)
            alert(stu_Class)*/
            $("#grades").empty()
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/findStuGrade",
                contentType:"application/json;charset=UTF-8",
                async:true,
                data:JSON.stringify({stu_Grade:stu_Grade,stu_Class:stu_Class}),
                success:function(data) {
                    for (var i=0;i<data.length;i++){
                        $("#grades").append("<tr><td>"+data[i].stu_name+"</td>"
                            +"<td>"+data[i].stu_Grade+" "+data[i].stu_Class+"</td>"
                            +"<td>"+data[i].gra_Chinese+"</td>"
                            +"<td>"+data[i].gra_Math+"</td>"
                            +"<td>"+data[i].gra_English+"</td>"
                            +"<td>"+data[i].allGrade+"</td>"
                            +"<td>"+(i+1)+"</td>")
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="panel panel-info"  style="height:420px;overflow: auto">
    <div class="panel-heading">
        <span class="iconfont icon-chengyuan"style="font-size: 25px;"></span>&nbsp;
        <span id="title" style="font-size: 20px;">学生成绩</span>
    </div>
    <div class="panel-body" >

        <table class="table table-hover">
            <thead>
            <td align="right" colspan="7">

                        年级：<select  id="grade_Name"style="height: 30px">
                        <option>一年级</option>
                        </select>&nbsp;&nbsp;
                        班级：<select id="class_Name" style="position: relative;left: 5px;height: 30px" >
                            <option>1班</option>
                            <option>2班</option>
                            <option>3班</option>
                        </select>
                            &nbsp;
                <button type="button" class="btn btn-success" onclick="findClassGrade()" style="position: relative;left: 5px">
                    查询
                </button>
            </td>
            </thead>
            <thead>
            <th>姓名</th>
            <th>班级</th>
            <th>语文</th>
            <th>数学</th>
            <th>英语</th>
            <th>总成绩</th>
            <th>名次</th>
            </thead>
            <tbody id="grades">
            <c:forEach items="${grades}" var="gra" varStatus="varStatus">
                <tr>
                    <td>${gra.stu_name}</td>
                    <td>${gra.stu_Grade}&nbsp;${gra.stu_Class}</td>
                    <td>${gra.gra_Chinese}</td>
                    <td>${gra.gra_Math}</td>
                    <td>${gra.gra_English}</td>
                    <td>${gra.allGrade}</td>
                    <td>${varStatus.count}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
