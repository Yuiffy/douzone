<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ taglib prefix="s" uri="/struts-tags" %>
  
  <html>
    <head>
      <title>哼，我不怕！</title>
    </head>
    
    <body>    
      你以为你乱输东西，我就会爆吗？<br/>
      <h1>告诉你，我不怕！</h1>
      <h2>答案是：<br/>
      <s:property value="operand1" />加<s:property value="operand2" />
      </h2><br/>
      <input type="button" value="返回" onClick="window.location.href='<%=request.getContextPath()%>/a.jsp'">
    </body>
  </html> 