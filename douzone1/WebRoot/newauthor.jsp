<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>添加新作者</title>
	</head>

	<body>
		<h2>
			添加新作者
		</h2>
		<h6>
			本系统为公共开放，请勿添加违规信息
		</h6>
		<s:form action="newauthor" namespace="/mystruts">
			<s:textfield name="o1" label=" AuthorID" />
			<s:textfield name="o2" label=" Name" />
			<s:textfield name="o3" label=" Age" />
			<s:textfield name="o4" label=" Country" />
			<s:submit value="添加" />
		</s:form>
		<h2>
			<s:property value="print" />
		</h2>
<!-- 	<input type="button" value="返回" -->
<!-- 		onClick="window.location.href='<%=request.getContextPath()%>/index2.jsp'"> -->
	<form action="<%=request.getContextPath()%>/index2.jsp" target="_top">
		<input type="submit" value="返回" />
	</form>
	</body>
</html>
