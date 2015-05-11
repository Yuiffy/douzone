 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>
  
  <html>
    <head>
      <title>显示代数和</title>
    </head>
    
    <body>
      代数和为负数，怕了吧<h1><s:property value="sum" /></h1>
      		<h2><s:property value="print" /></h2>
      		<input type="button" value="初始化数据库"
			onClick="window.location.href='<%=request.getContextPath()%>/mystruts/initdb.action'">
      <input type="button" value="返回" onClick="window.location.href='<%=request.getContextPath()%>/a.jsp'">
    </body>
  </html> 