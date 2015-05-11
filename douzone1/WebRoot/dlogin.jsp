<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="action.FirstAction" import="sql.AuthorList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>登陆逗zone</title>
<style type="text/css">
#center {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
	width: 400px;
	height: 200px;
	background: #eeeeee
}
</style>
<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script>
	function validate_form(thisform) {
		with (thisform) {
			$('#submitbtn').attr('disabled', "true");
			if (!validate_email_password(email, password)) {
				$('#submitbtn').removeAttr("disabled");
				return false;
			} else {
				var url = "ajax/dlogi";
				var params = {
					email : email.value,
					password : password.value
				};
				jQuery.post(url, params, ajaxBack);
			}
			return false;
		}
	}
	function countd(t){
		$('#countdown').html("等待"+t+"秒后跳转到登陆后页面");
		t--;
		setTimeout("countd("+t+")",1000);
	}
	function ajaxBack(data) {
		console.log(data);
		$('#submitbtn').removeAttr("disabled");
		with (data.dataMap) {
			if (ok){
				$('#forms').hide();
				countd(5);
			}
			$('#writeb').html(msg+"<br>");
		}
	}
</script>
</head>

<body>
	<div id="center">
		<center>
			<h2>登陆逗Zone</h2>
			<form id="forms" name="zhuce" action="dlogin.jsp"
				onsubmit="return validate_form(this);" method="post">
				邮箱：<input type="text" name="email" />
				<br>
				密码：<input type="password" name="password" />
				<br>
				<input id="submitbtn" type="submit" value="登陆" />
			</form>
			<div id="writeb"></div>
			<div id="countdown"></div>
			<br>
			<input id="btn" type="button" value="注册新账号"
				onClick="window.location.href='dregister.jsp'">
		</center>
	</div>
</body>
</html>
