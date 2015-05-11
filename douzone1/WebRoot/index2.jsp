<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>带鱼新主页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<frameset rows="50%,50%" noresize="noresize">
<frameset cols="50%,50%">
	<frame src="find.jsp">
	<frame src="newbook.jsp">
	</frameset>
	<frameset cols="50%,50%">
	<frame src="newauthor.jsp">
	<frame src="a.jsp">
	</frameset>
	<noframes>
		<body>您的浏览器无法处理框架！请换一个碉一点的浏览器。
		</body>
	</noframes>
</frameset>
</html>
