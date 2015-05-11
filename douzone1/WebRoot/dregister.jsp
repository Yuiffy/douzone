<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="action.FirstAction" import="sql.AuthorList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>登陆逗zone</title>
<style type="text/css">
#center {
	text-align: center;
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
<script>
	function validate_email(field, alerttxt) {
		with (field) {
			apos = value.indexOf("@");
			dotpos = value.lastIndexOf(".");
			if (apos < 1 || dotpos - apos < 2) {
				alert(alerttxt);
				return false;
			} else {
				return true;
			}
		}
	}
	function validate_required(field, alerttxt) {
		with (field) {
			if (value == null || value == "") {
				alert(alerttxt);
				return false
			} else {
				return true
			}
		}
	}
	function validate_form(thisform) {
		with (thisform) {
			$('#submitbtn').attr('disabled', "true");
			if (validate_email(email, "email格式不合法，请输入类似aaa@bbb.ccc这样的email!") == false) {
				email.focus();
				$('#submitbtn').removeAttr("disabled");
				return false;
			} else if (validate_required(password, "请输入密码！") == false) {
				password.focus();
				$('#submitbtn').removeAttr("disabled");
				return false;
			} else {
				var url = "ajax/dreg";
				var params = {
					operand1 : email.value,
					operand2 : password.value
				};
				jQuery.post(url, params, ajaxBack);
			}
			return false;
		}
	}
	function gank() {
		var url = "mystruts/sum";
		var params = {
			operand1 : 1,
			operand2 : 2
		};
		jQuery.post(url, params, callbackFun);
	}
	function ajaxBack(data) {
		console.log(data);
		$('#submitbtn').removeAttr("disabled");
		with (data.dataMap) {
			if (ok)
				$('#forms').hide();
			$('#writeb').html(msg);
		}
	}
	function callbackFun(data) {
		$('#writeb').html(data);
	}
</script>
</head>

<body>
	<div id="center">
		<h2>注册逗Zone</h2>
		<form id="forms" name="zhuce" action="mystruts/sum"
			onsubmit="return validate_form(this);" method="post">
			邮箱：<input type="text" name="email" /> <br> 密码：<input
				type="password" name="password" /> <br> <select name="sex">
				<option value="male">男</option>
				<option value="female">女</option>
			</select> <br> <input id="submitbtn" type="submit" value="注册" />
		</form>
		<div id="writeb"></div>
		<input id="btn" type="button" value="返回登陆界面"
			onClick="window.location.href='dlogin.jsp'">
	</div>
	<input id="btn2" type="button" value="diaozha" onClick="gank()">
</body>
</html>
