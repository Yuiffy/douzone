<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<meta property="qc:admins" content="1560164061661631611006375" />
<meta property="wb:webmaster" content="01c682aa58ed0077" />

<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/dzone.css">
<style>
.center {
	margin: auto;
	width: 70%;
	background-color: auto;
}

.primary-button,.exit-button {
	color: white;
	border-radius: 4px;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
	margin: 0.5em 0;
}

.exit-button {
	background: #ee2222;
}

.primary-button {
	background: #1b98f8;
}
</style>
<script
	src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2836403254"
	type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.js"></script>

<%-- <script --%>
<%-- 	src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=YOUR APPKEY&debug=true" --%>
<%-- 	type="text/javascript" charset="utf-8"></script> --%>
<base href="<%=basePath%>">
<title>带鱼聊天室</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 		<meta http-equiv="refresh" content="0; url=index2.jsp" /> -->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<SCRIPT LANGUAGE="JavaScript">
	function CheckLogin() {
		var status = WB2.checkLogin();
		alert(status);
	}
	function HasLogin() {
		if (!WB2.checkLogin()) {
			alert("请先登陆");
			return false;
		} else
			return true;
	}
	function login(o) {
		alert('哇，登陆成功啦，你的微博名竟然是' + o.screen_name);
		// 		uid = o.id;
	}

	function logout() {
		alert('logout');
	}

	function WhereButton() {
		//alert(document.getElementById("keleyivisitorip").innerHTML);
		if (!HasLogin())
			return;
		$('#btn1').attr('disabled', "true");
		WB2.anyWhere(function(W) {
			W.parseCMD("/location/geo/ip_to_geo.json", function(oResult,
					bStatus) {
				if (bStatus) {
					//alert(JSON.stringify(oResult));
					alert(oResult.geos[0].more);
				} else {
					console.log("/location/geo/ip_to_geo.json 授权失败或者错误");
					console.log(JSON.stringify(oResult));
				}
				$('#btn1').removeAttr("disabled");
			}, {
				ip : document.getElementById("keleyivisitorip").innerHTML
			}, {
				method : "get",
				cache_time : 30
			});
		});
	}
	function GetUid() {
		if (!HasLogin())
			return;
		$('#btn2').attr('disabled', "true");
		WB2.anyWhere(function(W) {
			W.parseCMD("/account/get_uid.json", function(oResult, bStatus) {
				if (bStatus) {
					alert(oResult.uid);
				} else {
					console.log("/account/get_uid.json 授权失败或者错误");
					console.log(JSON.stringify(oResult));
				}
				$('#btn2').removeAttr("disabled");
			}, {}, {
				method : "get",
				cache_time : 30
			});
		});
	}
</SCRIPT>
<script type="text/javascript">
	function WriteBook() {
		if (!HasLogin())
			return;
		$('#btn3').attr('disabled', "true");
		WB2.anyWhere(function(W) {
			W.parseCMD("/account/get_uid.json", function(oResult, bStatus) {
				if (bStatus) {
					var uid = oResult.uid;
					var nuid = Number(uid);
					console.log(uid);
					console.log(nuid);
					WB2.anyWhere(function(W) {
						W.parseCMD("/users/show.json", function(oResult,
								bStatus) {
							if (bStatus) {
								var o1, o2, o3, o4;
								o1 = uid;
								o2 = oResult.screen_name;
								o3 = oResult.province;
								o4 = oResult.location
								var oo1, oo2, oo3, oo4, oo5, oo6;
								oo1 = oResult.status.id % 100000007;
								oo2 = oResult.status.text.substring(0, 20);
								oo3 = uid;
								oo4 = oResult.description.substring(0, 10);
								var d = new Date();
								oo5 = d.getTime();
								oo6 = oResult.followers_count;
								console.log(o1, o2, o3, o4);
								console.log(oo1, oo2, oo3, oo4, oo5, oo6);
								var url = "mystruts/writebookbyweibo";
								var params = {
									o1 : o1,
									o2 : o2,
									o3 : o3,
									o4 : o4,
									oo1 : oo1,
									oo2 : oo2,
									oo3 : oo3,
									oo4 : oo4,
									oo5 : oo5,
									oo6 : oo6
								};
								jQuery.post(url, params, callbackFun);
							} else {
								console.log("/users/show.json 授权失败或者错误");
								console.log(JSON.stringify(oResult));
							}
							$('#btn3').removeAttr("disabled");
						}, {
							uid : nuid
						}, {
							method : "get",
							cache_time : 30
						});
					});
				} else {
					console.log("/account/get_uid.json 授权失败或者错误");
					console.log(JSON.stringify(oResult));
					$('#btn3').removeAttr("disabled");
				}
			}, {}, {
				method : "get",
				cache_time : 30
			});
		});
	}
	function callbackFun(data) {
		$('#writeb').html(data);
		//		$("#writeb").load();
	}
</script>
</head>

<body>
	<div class="center">
		<wb:share-button appkey="2836403254" addition="full" type="button"
			default_text="超逗的图书管理系统，我还是要分享">分享按钮</wb:share-button>

		<br>
		<wb:login-button type="1,1" onlogin="login" onlogout="logout">登陆按钮</wb:login-button>
		<h2 align="center">带鱼聊天室</h2>
		<h3 align="center">附带图书管理系统功能</h3>
		<div align="center">
			<input type=button value="看看我登录没有" onclick="CheckLogin()"> <input
				id="btn1" type=button value="看看我在哪" onclick="WhereButton()">
			<input id="btn2" type=button value="看看我的微博UID" onclick="GetUid()">
			<input id="btn3" type=button value="把我加到图书数据库里" onclick="WriteBook()">
			<input id="btn4" type="button" value="进入图书管理系统"
				onClick="window.location.href='index2.jsp'">
			<button class="pure-button primary-button"
				onClick="window.location.href='dlogin.jsp'">进入逗zone</button>
		</div>
		<div id="writeb"></div>
		<!-- 	<h1>你可以来一波微博登录</h1> -->
		<wb:comments url="http://yuiffy.sinaapp.com" border="y" brandline="y"
			width="auto" appkey="2836403254" ralateuid="1434371712">评论箱</wb:comments>
		<br>
		<input type="button" style="font-size:40px;font-weight: bold"
			value="进入图书管理系统" onClick="window.location.href='index2.jsp'">


		<!-- 	<br> 你的IP地址： -->
		<span id="keleyivisitorip" hidden="hidden"></span>
		<script type="text/javascript"
			src="http://tool.keleyi.com/ip/visitoriphost/"></script>
	</div>
</body>
</html>
