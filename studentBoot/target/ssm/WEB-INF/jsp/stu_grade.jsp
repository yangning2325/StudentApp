<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

			#grades{
				width: 600px;
				height: 300px;
				margin: 50px auto;
			}
			.cou{
				font-size: 25px;
				color: darkgray;
			}
        </style>
		<script type="text/javascript">
			$(function () {
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/getStuGrade",
					async:true,
					success:function (data) {
						if (data!=null) {
							$("#stuChinese").html(data.gra_Chinese)
							$("#stuMath").html(data.gra_Math)
							$("#stuEnglish").html(data.gra_English)
							$("#stuAllGrade").html(data.allGrade)
						}
					}
				});
			})
		</script>
    </head>
    <body>
	<div class="panel panel-info" style="height: 420px">
		<div class="panel-heading">
			<span class="iconfont icon-chengjidan"style="font-size: 25px;"></span>&nbsp;
			<span id="title" style="font-size: 20px;">考试成绩</span>
		</div>
		<div class="panel-body">
				<div id="grades">
					<div class="cou"><span class="Chinese">语文：</span> <span id="stuChinese"></span></div>
					<div class="cou"><span class="Math">数学：</span> <span id="stuMath"></span></div>
					<div class="cou"><span class="English">英语：</span> <span id="stuEnglish"></span></div>
					<div class="cou"><span class="allGrades">总分：</span> <span id="stuAllGrade"></span></div>
				</div>
		</div>
	</div>
 	</body>
</html>