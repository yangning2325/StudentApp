<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style>
			#boxAll1{
				height: 420px;
			}
			#box2{
				width: 800px;
				height: 400px;
			}
			#inbox2{
				width: 650px;
				height: 400px;
				margin: 20px auto;
				position: relative;
			}
			.form-control{
				width: 260px;
			}
		</style>
		<script type="text/javascript">
			$(function () {
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/getStuMessage",
					async:true,
					success:function (data) {
						$("#stuAddress").val(data.stuAddress)
						$("#stuPhone").val(data.stuPhone)
						$("#stuEmail").val(data.stuEmail)
						$("#stuQQ").val(data.stuQQ)
					}
				});
				$("#bt2").click(function () {
					var stuAddress= $("#stuAddress").val()
					var stuPhone= $("#stuPhone").val()
					var stuEmail= $("#stuEmail").val()
					var stuQQ= $("#stuQQ").val()
					if (confirm("你确定要修改吗？")) {
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/updateStuMessage",
						async:true,
						data:{"stuAddress":stuAddress,"stuPhone":stuPhone,"stuEmail":stuEmail,"stuQQ":stuQQ},
						success:function(data) {
							if (data) {
								setTimeout(function(){  alert("修改成功！");}, 500);
							}else {
								alert("修改失败！")
							}
						}
					});
				}
				})

			})
		</script>
	</head>
	<body>
		<div class="panel panel-success" id="boxAll1">
			<div class="panel-heading">
			<span class="iconfont icon-chengyuan"style="font-size: 25px;"></span>&nbsp;
			<span id="title" style="font-size: 20px;">个人信息修改</span>
			</div>
			<div id="box2">
				<div id="inbox2">
					<div class="panel-body" >
						<div class="form-horizontal">

							<div class="form-group">
								<label for="stuAddress" class="col-sm-2 control-label">地址:</label>
								<div class="col-sm-10">
									<input type="text" name="stuAddress" class="form-control" id="stuAddress" />
								</div>
							</div>

							<div class="form-group">
								<label for="stuPhone" class="col-sm-2 control-label">电话:</label>
								<div class="col-sm-10">
									<input type="text" name="stuPhone" class="form-control" id="stuPhone" />
								</div>
							</div>

							<div class="form-group">
								<label for="stuEmail" class="col-sm-2 control-label">邮箱:</label>
								<div class="col-sm-10">
									<input type="email" name="stuEmail" class="form-control" id="stuEmail" />
								</div>
							</div>

							<div class="form-group">
								<label for="stuQQ" class="col-sm-2 control-label">QQ:</label>
								<div class="col-sm-10">
									<input type="text" name="stuQQ" class="form-control" id="stuQQ" />
								</div>
							</div>
							<br/>
							<button type="submit" class="btn btn-success" id="bt2">修改</button>
						</div>
					</div>
				</div>
			</div>

			</div>
	</body>
</html>