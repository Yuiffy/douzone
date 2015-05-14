<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="action.FirstAction" import="sql.AuthorList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>登陆逗zone</title>
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/dzone.css">
<style type="text/css">
#center {
	background: #dddddd;
	padding: 0.3em 1em;
	border-radius: 50px;
	
		text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -150px;
	margin-left: -200px;
	width: 400px;
	height: 300px;
}
</style>
<script src="js/jquery.js"></script>
<script src="js/md5.js"></script>
<script src="js/dz.js"></script>
<script>
	function validate_form(thisform) {
		with (thisform) {
			$('#submitbtn').attr('disabled', "true");
			if (!validate_email_password(email, password)) {
				$('#submitbtn').removeAttr("disabled");
				return false;
			} else {
				password.value = MD5(password.value);
				var url = "ajax/dlogi";
				var params = {
					email : email.value,
					password : password.value
				};
				jQuery.post(url, params, ajaxBack);
				$('#btn').attr('onClick',"window.location.href='dzone.jsp'");
				$('#btn').html("直接进入");
			}
			return false;
		}
	}
	function ajaxBack(data) {
		console.log(data);
		$('#submitbtn').removeAttr("disabled");
		with (data.dataMap) {
			if (ok) {
				$('#forms').hide();
				console.log(data.dataMap);
				setCookie("email", email);
				setCookie("password", password);
				countDownTo(3, "登陆后页面", "dzone.jsp", $('#countdown'));
			}
			$('#writeb').html(msg + "<br>");
		}
	}
	function on_load() {
		if (get_login_status()) {
			$('#forms').html("欢迎回来！" + EMAIL);
			countDownTo(3, "登陆后页面", "dzone.jsp", $('#countdown'));
		}
	}
</script>
</head>

<body onload="on_load()">
	<div id="center">
		<h2>登陆逗Zone</h2>
		<form id="forms" name="zhuce" action="dlogin.jsp"
			onsubmit="return validate_form(this);" method="post">
			邮箱：<input type="text" name="email" />
			<br>
			密码：<input type="password" name="password" />
			<br>
			<input class="pure-button primary-button" id="submitbtn"
				type="submit" value="登陆" />
		</form>
		<div id="writeb"></div>
		<div id="countdown"></div>
		<br>
		<button class="pure-button primary-button" id="btn"
			onClick="window.location.href='dregister.jsp'">注册新账号</button>
	</div>
</body>
</html>
