<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="action.Inform" import="sql.BookList"
	import="sql.BookInfo" import="sql.AuthorList" import="sql.AuthorInfo"%>
<html>
	<head>
		<title>图书和作者详细信息</title>
	</head>

	<body>
		<h3>
			图书详细信息
		</h3>
		<table border=1>
			<tr>
				<td>
					ISBN
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
				String IB = (String) request.getAttribute("ISBN");
				System.out.println(IB);
				BookList booklist = new BookList("select * from book where ISBN="
						+ IB);
				List<BookInfo> li = booklist.getList();
				BookInfo bInfo = new BookInfo();
				int AID = 0;
				for (int i = 0; i < li.size(); i++) {
					AID = li.get(i).getAuthorID();
					bInfo = li.get(i);
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
			</tr>
			<%
				}
			%>
		</table>
		<h3>
			作者详细信息
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
				AuthorList alist = new AuthorList(
						"select * from author where AuthorID=" + AID);
				List<sql.AuthorInfo> li2 = alist.getList();
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
		<br />
		<%
			request.setAttribute("c1", bInfo.getISBN());
			request.setAttribute("c2", bInfo.getTitle());
			request.setAttribute("c3", bInfo.getAuthorID());
			request.setAttribute("c4", bInfo.getPublisher());
			request.setAttribute("c5", bInfo.getPublishDate());
			request.setAttribute("c6", bInfo.getPrice());
		%>
		<table border=1>
			<tr>
				<td>
					修改该书信息
					<s:form action="/mystruts/upbook?ISBN=%{#request.c1}">
						<s:textfield name="o2" label=" Title" value="%{#request.c2}" />
						<s:textfield name="o3" label=" AuthorID" value="%{#request.c3}" />
						<s:textfield name="o4" label=" Publisher" value="%{#request.c4}" />
						<s:textfield name="o5" label=" PublishDate" value="%{#request.c5}" />
						<s:textfield name="o6" label=" Price" value="%{#request.c6}" />
						<s:submit value="提交" />
					</s:form>
					<h6>
						本系统为公共开放，请勿添加违规信息
					</h6>
					<h2>
						<s:property value="print" />
					</h2>
				</td>
			</tr>
		</table>
		<input type="button" value="返回"
			onClick="window.location.href='<%=request.getContextPath()%>/index2.jsp'">
	</body>
</html>
