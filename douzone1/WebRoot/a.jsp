<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>A+B Problem</title>
<style>
body {
	background-image: url(images/192022.jpg);
}

#email {
	display: inline;
	background: #333;
	color: #ddd;
}

#center {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
	width: 400px;
	height: 200px;
	background: #333; color : #ddd;
	text-align: center;
	color: #ddd;
}
</style>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.3.0/pure-min.css">

<script src="js/jquery.js"></script>
<script src="js/md5.js"></script>
<script src="js/dz.js"></script>
<script>
	function onload() {
		if (!get_login_status()) {
			alert("请先登陆！");
			location.href = "dlogin.jsp";
		} else {
			$('#email').html("用户：" + EMAIL);
		}
	}
</script>
</head>

<body onload="onload()">
	<%
		
	%>
	<div id="email"></div>
	<button class="pure-button" onclick="exitLogin()">退出登录</button>
	<div id="center">
		<br>
		<h2>超碉求和，绝对让你怕！</h2>
		<s:form action="sum" namespace="/mystruts">
			<s:textfield name="operand1" label=" 操作数1" />
			<s:textfield name="operand2" label=" 操作数2" />
			<s:submit value="怒求和" />
		</s:form>
	</div>
</body>
</html>
