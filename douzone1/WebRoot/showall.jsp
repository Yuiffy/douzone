<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="sql.BookList" import="sql.BookInfo"
	import="sql.AuthorList" import="sql.AuthorInfo"%>
<html>
	<head>
		<title>全部图书和作者详细信息</title>
	</head>

	<body>
		<h3>
			全图书详细信息
		</h3>
		<table border=1>
			<tr>
				<td>
					ISBNw
				</td>
				<td>
					Title
				</td>
				<td>
					AuthorID
				</td>
				<td>
					Publisher
				</td>
				<td>
					PublishDate
				</td>
				<td>
					Price
				</td>
			</tr>
			<%
				BookList booklist = new BookList("select * from book");
				List<BookInfo> li = booklist.getList();
				for (int i = 0; i < li.size(); i++) {
			%>
			<tr>
				<td><%=li.get(i).getISBN()%></td>
				<td>
					<a
						href="<%=request.getContextPath()%>/mystruts/inform.action?ISBN=<%=li.get(i).getISBN()%>"><%=li.get(i).getTitle()%></a>
				</td>
				<td><%=li.get(i).getAuthorID()%></td>
				<td><%=li.get(i).getPublisher()%></td>
				<td><%=li.get(i).getPublishDate()%></td>
				<td><%=li.get(i).getPrice()%></td>
				<td>
					<input type="button" value="删除"
						onClick="window.location.href='<%=request.getContextPath()%>/mystruts/delbook.action?ISBN=<%=li.get(i).getISBN()%>&authorName=<%=request.getAttribute("authorName")%>'">
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<h3>
			全作者详细信息
		</h3>
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
				AuthorList alist = new AuthorList("select * from author");
				List<AuthorInfo> li2 = alist.getList();
				for (int i = 0; i < li2.size(); i++) {
			%>
			<tr>
				<td><%=li2.get(i).getAuthorID()%></td>
				<td>
					<a
						href="<%=request.getContextPath()%>/mystruts/find.action?authorName=<%=li2.get(i).getName()%>"><%=li2.get(i).getName()%></a>
				</td>
				<td><%=li2.get(i).getAge()%></td>
				<td><%=li2.get(i).getCountry()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<input type="button" value="初始化数据库"
			onClick="window.location.href='<%=request.getContextPath()%>/mystruts/initdb.action'">

		<h2><s:property value="print" /></h2>
		<input type="button" value="返回"
			onClick="window.location.href='<%=request.getContextPath()%>/index2.jsp'">
	</body>
</html>
