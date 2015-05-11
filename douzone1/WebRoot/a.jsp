<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>A+B Problem</title>
	</head>

	<body>
		<h2>超碉求和，绝对让你怕！</h2>
		<s:form action="sum" namespace="/mystruts">
			<s:textfield name="operand1" label=" 操作数1" />
			<s:textfield name="operand2" label=" 操作数2" />
			<s:submit value="怒求和" />
		</s:form>
	</body>
</html>
