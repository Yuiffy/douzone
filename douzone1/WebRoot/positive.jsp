<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="action.FirstAction" import="sql.AuthorList"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	<head>
		<title>显示代数和</title>
	</head>

	<body> 
		<font color="#0923b7">代数和为非负数，就问你怕不怕</font> 
		<h1>
			<s:property value="sum" />
		</h1>
		<br />
		<table border=1>
			<tr>
				<td>
					AuthorID
				</td>
				<td>
					Name
				</td>
				<td>
					Age
				</td>
				<td>
					Country
				</td>
			</tr>
			<%
				AuthorList al = new AuthorList(
						"select * from author where authorID="
								+ (String) request.getAttribute("sum"));
				List<sql.AuthorInfo> li = al.getList();
				for (int i = 0; i < li.size(); i++) {
			%>
			<tr>
				<td><%=li.get(i).getAuthorID()%></td>
				<td>
					<a
						href="<%=request.getContextPath()%>/mystruts/find.action?authorName=<%=li.get(i).getName()%>"><%=li.get(i).getName()%></a>
				</td>
				<td><%=li.get(i).getAge()%></td>
				<td><%=li.get(i).getCountry()%></td>
			</tr>
			<%
				}
			%>
		</table>

		<br />
		<input type="button" value="返回" onClick="window.location.href='<%=request.getContextPath()%>/a.jsp'">
	</body>
</html>
