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