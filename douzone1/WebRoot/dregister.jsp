<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="action.FirstAction" import="sql.AuthorList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML">

<html>
<head>
<title>登陆逗zone</title>
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/dzone.css">
<style type="text/css">
#center {

}

aside {
	background: #dddddd;
	padding: 0.3em 1em;
	border-radius: 50px;
	
		text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -200px;
	margin-left: -200px;
	width: 400px;
	height: 400px;
}

aside a,aside a:visited {
	color: rgb(169, 226, 255);
}
</style>
<script src="js/jquery.js"></script>
<script src="js/dz.js"></script>
<script src="js/md5.js"></script>
<script>
	function validate_form(thisform) {
		with (thisform) {
			$('#submitbtn').attr('disabled', "true");
			if (!validate_email_password(email, password)) {
				$('#submitbtn').removeAttr("disabled");
				return false;
			} else if (password.value != password2.value) {
				alert("两次密码不一样啊，快好好输一输");
				password2.focus();
				$('#submitbtn').removeAttr("disabled");
				return false;
			} else {
				var url = "ajax/dreg";
				var pass5 = MD5(password.value);
				console.log(password.value);
				var params = {
					email : email.value,
					uname : uname.value,
					password : pass5
				};
				jQuery.post(url, params, ajaxBack);
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
			}
			$('#writeb').html(msg);
		}
	}
	function callbackFun(data) {
		$('#writeb').html(data);
	}
</script>
</head>

<body>
	<aside>
		<div id="center">
			<h2>注册逗Zone</h2>
			<form id="forms" name="zhuce" action="dregister.jsp"
				onsubmit="return validate_form(this);" method="post">
				邮箱：<input type="text" name="email" />
				<br>
				密码：<input type="password" name="password" />
				<br>
				再次输入密码：<input type="password" name="password2" />
				<br>
				昵称：<input type="text" name="uname" />
				<br>
				<select name="sex">
					<option value="male">男</option>
					<option value="female">女</option>
				</select>
				<br>
				<input id="submitbtn" type="submit" value="注册"
					class="pure-button primary-button" />
			</form>
			<div id="writeb"></div>
			<input id="btn" type="button" value="返回登陆界面"
				class="pure-button primary-button"
				onClick="window.location.href='dlogin.jsp'">
		</div>
	</aside>
</body>
</html>
