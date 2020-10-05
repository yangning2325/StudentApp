<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style>
			#boxAll2{
				width: 1080px;
				height: 400px;
				position: relative;
				left: -15px;
			}
			#forms1{
				width: 600px;
				height: 400px;
				margin: 10px auto;
			}
			.form-control{
				width: 260px;
			}
		</style>
		<script type="text/javascript">
				function updateAdminOwn(adm_id) {
					var userName= $("#AdminCount").val()
					var password= $("#AdminPaw").val()
					var password2=$("#AdminPaw2").val()
					if (password!=password2) {
						alert("密码不一致");
						return false;
					}
					var admName= $("#admName").val()
					if (confirm("你确定要修改吗？")) {
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/updateOwn",
						contentType:"application/json;charset=UTF-8",
						async:true,
						data:JSON.stringify({adm_id:adm_id,userName:userName,password:password,admName}),
						success:function(data) {
							if (data) {
								setTimeout(function(){  alert("修改成功！");}, 500);
							}else {
								alert("修改失败！")
								}
							}
						});
					}
				}
		</script>
	</head>
	<body>
	<div id="box">
		<div class="panel panel-success"style="height: 420px">
			<div class="panel-heading">
			<span class="iconfont icon-chengyuan"style="font-size: 25px;"></span>&nbsp;
			<span id="title" style="font-size: 20px;">个人信息修改</span>
			</div>
			<div class="panel-body" >
					<div class="form-horizontal" id="forms1">

						<div class="form-group">
							<label for="admName" class="col-sm-2 control-label">姓名:</label>
							<div class="col-sm-10">
								<input type="text" name="admName" class="form-control" id="admName" value=${admin.admName}>
							</div>
						</div>

						<div class="form-group">
							<label for="AdminCount" class="col-sm-2 control-label">账号:</label>
							<div class="col-sm-10">
								<input type="text" name="userName" class="form-control" id="AdminCount" value=${admin.userName}>
							</div>
						</div>

						<div class="form-group">
							<label for="AdminPaw" class="col-sm-2 control-label">新密码:</label>
							<div class="col-sm-10">
								<input type="password" name="password" class="form-control" id="AdminPaw" >
							</div>
						</div>

						<div class="form-group">
							<label for="AdminPaw2" class="col-sm-2 control-label">确认密码:</label>
							<div class="col-sm-10">
								<input type="password" name="password" class="form-control" id="AdminPaw2">
							</div>
						</div>
						<br/>
						<button type="submit" class="btn btn-success" onclick="updateAdminOwn(${admin.adm_id})">修改</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>