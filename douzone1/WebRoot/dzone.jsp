<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>逗zone</title>
<script src="js/jquery.js"></script>
<script src="js/md5.js"></script>
<script src="js/dz.js"></script>
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/dzone.css">
<script>
	function onload() {
		if (!get_login_status()) {
			alert("请先登陆！");
			location.href = "dlogin.jsp";
		} else {
			$('#myemail').html(EMAIL);
			var em = EMAIL;
			var pa = PASSWORD;
			var url = "ajax/getfollower";
			var params = {
				email : em,
				password : pa,
			};
			jQuery.post(url, params, gfollowerCountBack);
			setTimeout(findFriend(), 0);
			setTimeout(friendAll(), 0);
		}
	}
	function findFriend() {
		fbutton(1);
		var em = EMAIL;
		var pa = PASSWORD;
		var url = "ajax/getfriend";
		var params = {
			email : em,
			password : pa,
		};
		jQuery.post(url, params, gfBack);
	}
	function findFollower() {
		fbutton(1);
		var em = EMAIL;
		var pa = PASSWORD;
		var url = "ajax/getfollower";
		var params = {
			email : em,
			password : pa,
		};
		jQuery.post(url, params, gfollowerBack);
	}
	function gfollowerBack(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
				return;
			}
			$('#follower-count').html("(" + (list.length - 1) + ")");
			var s = "";
			for (var i = 1; i < list.length; i++) {
				s += "<div class=\"friend-item friend-item-selected pure-g\"><div class=\"pure-u-1\">";
				s += "<h5 class=\"friend-name\">" + list[i][0] + "<\h5>";
				s += "<h4 class=\"friend-subject\">" + list[i][1] + "<\h4>";
				s += "</div></div>";
			}
			$('#list').html(s);
		}
	}
	function gfollowerCountBack(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
				return;
			}
			$('#follower-count').html("(" + (list.length - 1) + ")");
		}
	}
	function gfBack(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
				return;
			}
			$('#friend-count').html("(" + (list.length - 1) + ")");
			var s = "";
			for (var i = 1; i < list.length; i++) {
				s += "<div class=\"friend-item friend-item-selected pure-g\"><div class=\"pure-u-1\">";
				s += "<h5 class=\"friend-name\">" + list[i][0] + "<\h5>";
				s += "<h4 class=\"friend-subject\">" + list[i][1] + "<\h4>";
				s += "</div></div>";
			}
			$('#list').html(s);
		}
	}
	function addFriend() {
		var aimEmail = window.prompt("添加好友", "请在此输入要添加的好友邮箱");
		if (!v_email(aimEmail, "请输入正确格式的email")
				|| !v_sql(aimEmail, "请不要乱搞sql注入")) {
			return false;
		} else {
			var em = EMAIL;
			var pa = PASSWORD;
			var url = "ajax/dadd";
			var params = {
				email : em,
				password : pa,
				aim : aimEmail
			};
			jQuery.post(url, params, daddBack);
		}
		return false;
	}
	function daddBack(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == 0) {
				alert(msg);
				findFriend();
			} else if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
			} else
				alert(msg);
		}
	}
	var RIZHI = -1;
	function update_rizhi(thisform) {
		fbutton(1);
		with (thisform) {
			var em = EMAIL;
			var pa = PASSWORD;
			var url = "ajax/uprizhi";
			var params = {
				email : em,
				password : pa,
				smap : {
					0 : rizhiTitle.value,
					1 : rizhi.value,
					2 : RIZHI
				}
			};
			jQuery.post(url, params, uprizhiback);
		}
		return false;
	}
	function uprizhiback(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == 0) {
				alert(msg);
				friendAll();
			} else if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
			} else
				alert(msg);
		}
	}
	function writeRizhi() {
		fbutton(1);
		$('#main').load("uprizhi.html");
		setTimeout(dajiahao, 100);
	}
	function dajiahao() {
		if ($('#rizhi')[0].value == "")
			$('#rizhi').html("大家好，我是" + EMAIL);
		if ($('#rizhiTitle')[0].value == "")
			$('#rizhiTitle').val("我就是我，是" + EMAIL);
	}
	function friendAll() {
		fbutton(1);
		var em = EMAIL;
		var pa = PASSWORD;
		var url = "ajax/friendall";
		var params = {
			email : em,
			password : pa,
		};
		jQuery.post(url, params, friendallback);
	}
	function friendallback(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == 0) {
				var s = "";

				for (var i = 1; i < list.length; i++) {
					//update_time, diary.user_email, data, did, dname
					var title = list[i][4];
					var neirong = list[i][2];
					var time = list[i][0];
					var author = list[i][1];
					var did = list[i][3];
					s += "<div class=\"friend-content\"><div class=\"friend-content-header pure-g\"><div class=\"pure-u-1-2\"><h1 class=\"friend-content-title\">";
					s += title;
					s += "</h1><p class=\"friend-content-subtitle\">From <a>";
					s += author;
					s += "</a> at <span>";
					s += time;
					s += "</span></p></div><div class=\"pure-u-1-2 friend-content-controls\"><button class=\"pure-button secondary-button\" onClick=\"";
					s += "replytorizhi(" + did + ")";//回复按钮!
					s += "\">Reply</button></div></div><div class=\"friend-content-body\">";
					s += "<p>" + neirong
							+ "</p></div><div class=\"friend-reply\">";
					console.log("did=", did);
					console.log(repmap[did]);
					if (repmap[did] != null) {
						for (var j = 0; j < repmap[did].length; j++) {
							s += "<p class=\"friend-content-subtitle\">";
							s += "<a>" + repmap[did][j][1] + "</a>" + ":";
							s += repmap[did][j][2] + "\t";
							s += "<span>" + repmap[did][j][0] + "</span>";
							s += "</p>";
						}
					}
					s += "</div></div>";
				}
				$('#main').html(s);
			} else if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
			} else
				alert(msg);
		}
	}
	function replytorizhi(did) {
		var reply = window.prompt("回复日志", "在此输入要回复的内容");
		if (reply == null)
			return false;
		if (reply == "在此输入要回复的内容" || reply == "") {
			alert("居然不写也想回复？别想啦！");
			return false;
		} else {
			fbutton(1);
			var em = EMAIL;
			var pa = PASSWORD;
			var url = "ajax/replytorizhi";
			var params = {
				email : em,
				password : pa,
				id : did,
				aim : reply
			};
			jQuery.post(url, params, replytorizhi_back);
		}
		return false;
	}
	function replytorizhi_back(data) {
		console.log(data);
		with (data.dataMap) {
			if (re == 0) {
				alert(msg);
				friendAll();
			} else if (re == -1) {
				alert(msg);
				location.href = "dlogin.jsp";
			} else
				alert(msg);
		}
	}
	function todo() {
		alert("其实还没有完成这个功能，不管了！");
	}
</script>
</head>

<body onload="onload()">
	<div class="pure-g-r content" id="layout">
		<div class="pure-u" id="nav">
			<div class="nav-inner">
				<a href="javascript:void(0)"><span id="myemail">YOUR_EMAIL</span></a>
				<button class="pure-button primary-button" onClick="addFriend()">添加好友</button>
				<button class="pure-button primary-button" onClick="writeRizhi()">写日志</button>
				<br>
				<br>
				<div class="pure-menu pure-menu-open">
					<ul>
						<li><a href="javascript:void(0)" onClick="friendAll()">好友动态</a></li>
						<li><a href="javascript:void(0)" onClick="findFriend()">好友列表<span
								id="friend-count" class="friend-count">(?)</span></a></li>
						<li><a href="javascript:void(0)" onClick="findFollower()">粉丝列表<span
								id="follower-count" class="friend-count">(?)</span></a></li>
						<!-- 						<li><a href="javascript:void(0)" onClick="todo()">我的日志</a></li> -->
					</ul>
				</div>
				<br>
				<button class="pure-button exit-button" onClick="exit_login()">退出登陆</button>
			</div>
		</div>

		<div class="pure-u-1" id="list"></div>

		<div class="pure-u-1" id="main">


			<div class="friend-content">
				<div class="friend-content-header pure-g">
					<div class="pure-u-1-2">
						<h1 class="friend-content-title">欢迎使用逗zone</h1>
						<p class="friend-content-subtitle">
							From <a>Yuiffy</a> at <span>1:47pm, May 14, 2015</span>
						</p>
					</div>

					<div class="pure-u-1-2 friend-content-controls">
						<button class="pure-button secondary-button"
							onClick="replytorizhi(1)">Reply</button>
					</div>
				</div>

				<div class="friend-content-body">
					<p>就问你怕不怕。</p>

				</div>
			</div>

		</div>
	</div>


</body>
</html>
