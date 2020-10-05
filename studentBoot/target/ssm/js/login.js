$(function() {
			var nameOk = false;
			var pwOk = false;
			var codeOK=false;
			 $("#userName").blur(function() {
				var uname = $(this).val();
				if(uname == "" || uname == null) {
					$("#checkName").html("账号不能为空！")
					nameOk = false;
				} else {
					nameOk = true;
				}
			})
			$("#userName").focus(function() {
				$("#checkName").html("")
			})
			
			$("#password").blur(function() {
				var pw = $(this).val();
				if(pw == "" || pw == null) {
					$("#checkPw").html("账号不能为空！")
					pwOk = false;
				} else {
					pwOk = true;
				}
			})
			$("#password").focus(function() {
				$("#checkPw").html("")
			})
			
			$("#checkNum").blur(function() {
				var codeNum = $("#checkCode").html().toUpperCase();
				var code = $(this).val();
				if(code == "" || code == null) {
					$("#checkcd").html("验证码不能为空！")
					codeOK = false;
				}else if(codeNum!=code.toUpperCase()){
					$("#checkcd").html("验证码错误！")
					codeOK = false;
				} else {
					codeOK = true;
				}
			})
			$("#checkNum").focus(function() {
				$("#checkcd").html("")
			})

	$("#bt").click(function () {
		var pe=$(".people");

		if (nameOk&&pwOk&&codeOK) {
			for (var i=0;i<pe.length;i++) {
				if (pe[i].checked) {
					if(pe[i].value=="student"){
						$("#forms").attr('action','checkStuLogin')
						$("#forms").submit()
					}else if(pe[i].value=="teacher"){
						$("#forms").attr('action','checkTeaLogin')
						$("#forms").submit()
					}else{
						$("#forms").attr('action','checkAdmLogin')
						$("#forms").submit()
					}
				}
			}
		}
	})
})