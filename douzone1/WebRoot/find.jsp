<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="action.Find" import="sql.BookList" import="sql.BookInfo"%>

<html>
<head>
<title>输名找书</title>
<base target="_self" />
</head>

<body>
	<h3>输入名字，查询该名字的作者所著的全部图书的题目</h3>
	<s:form action="find" namespace="/mystruts">
		<s:textfield name="authorName" label=" 作者名字" />
		<s:submit value="查找" />
	</s:form>
	<%
		String where = (String) request.getAttribute("where");
		System.out.println(where);
		if (where != null) {
			BookList booklist = new BookList("select * from book where "
					+ where);
			List<BookInfo> li = booklist.getList();
	%>
	找到了<%=li.size()%>条结果：
	<br />
	<table border=1>
		<tr>
			<td>ISBN</td>
			<td>Title</td>
			<td>AuthorID</td>
			<td>Publisher</td>
			<td>PublishDate</td>
			<td>Price</td>
		</tr>
		<%
			for (int i = 0; i < li.size(); i++) {
		%>
		<tr>
			<td><%=li.get(i).getISBN()%></td>
			<td>
				<%
					//String s="/mystruts/infrom?ISBN="+li.get(i).getISBN();
				%> <a
				href="<%=request.getContextPath()%>/mystruts/inform.action?ISBN=<%=li.get(i).getISBN()%>"><%=li.get(i).getTitle()%></a>
			</td>
			<td><%=li.get(i).getAuthorID()%></td>
			<td><%=li.get(i).getPublisher()%></td>
			<td><%=li.get(i).getPublishDate()%></td>
			<td><%=li.get(i).getPrice()%></td>
			<td><input type="button" value="删除"
				onClick="window.location.href='<%=request.getContextPath()%>/mystruts/delbook.action?ISBN=<%=li.get(i).getISBN()%>&authorName=<%=request.getAttribute("authorName")%>'">
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
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
