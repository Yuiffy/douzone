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
</head>

<body>
	<div id="center">
		<center>
			<h2>登陆逗Zone</h2>
			<s:form action="sum" namespace="/mystruts">
				<s:textfield name="operand1" label=" 用户名" />
				<s:textfield name="operand2" label=" 密码" />
				<s:submit value="登陆" />
			</s:form>
			<input id="btn" type="button" value="注册新账号"
				onClick="window.location.href='dregister.jsp'">
		</center>
	</div>
</body>
</html>
