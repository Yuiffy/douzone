function validate_email(field, alerttxt) {
	with (field) {
		apos = value.indexOf("@");
		dotpos = value.lastIndexOf(".");
		if (apos < 1 || dotpos - apos < 2) {
			alert(alerttxt);
			return false;
		} else {
			return true;
		}
	}
}
function v_email(value, alerttxt) {
	apos = value.indexOf("@");
	dotpos = value.lastIndexOf(".");
	if (apos < 1 || dotpos - apos < 2) {
		alert(alerttxt);
		return false;
	} else {
		return true;
	}
}
function validate_required(field, alerttxt) {
	with (field) {
		if (value == null || value == "") {
			alert(alerttxt);
			return false;
		} else {
			return true;
		}
	}
}
function validate_sql(field, alerttxt) {
	with (field) {
		var a = new Array(";", "'", "\"");
		for (i in a) {
			if (value.indexOf(a[i]) != -1) {
				alert(alerttxt);
				return false;
			}
		}
		return true;
	}
}
function v_sql(value, alerttxt) {
	var a = new Array(";", "'", "\"");
	for (i in a) {
		if (value.indexOf(a[i]) != -1) {
			alert(alerttxt);
			return false;
		}
		return true;
	}
}
function validate_email_password(email, password) {
	if (validate_email(email, "email格式不合法，请输入类似aaa@bbb.ccc这样的email!") == false
			|| validate_sql(email, "请不要在email里写点什么分号引号之类的东西！以为我不懂SQL注入吗！") == false) {
		email.focus();
		return false;
	} else if (validate_required(password, "请输入密码！") == false
			|| validate_sql(password, "请不要在密码里写点什么分号引号之类的东西！以为我不懂SQL注入吗！") == false) {
		password.focus();
		return false;
	}
	return true;
}
function setCookie(c_name, value, expiredays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + expiredays);
	document.cookie = c_name + "=" + escape(value)
			+ ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
}
function delCookie(c_name) {
	setCookie(c_name, "", -10000);
}
function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1)
				c_end = document.cookie.length;
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
	return "";
}

function countDownTo(t, msg, aim, element) {
	element.html("等待" + t + "秒后跳转到" + msg);
	if (t <= 0) {
		location.href = aim;
	}
	setTimeout(function() {
		countDownTo(t - 1, msg, aim, element);
	}, 1000);
}

var STATUS = -1;
var EMAIL = "";
var PASSWORD = "";

function get_login_status() {
	var tpassword = getCookie("password");
	var temail = getCookie("email");
	if (tpassword == null || tpassword == "" || temail == null || temail == "") {
		STATUS = 0;
		return false;
	}
	PASSWORD = tpassword;
	EMAIL = temail;
	STATUS = 1;
	return true;
}
function check_login() {
	return STATUS;
}
function exit_login() {
	delCookie("email");
	delCookie("password");
	STATUS=-1;
	EMAIL="";
	PASSWORD="";
	location.href = "dlogin.jsp";
}