package action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sql.AnyList;

public class Dregister extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3247928074764504096L;
	private String email;
	private String password;
	private String uname;
	private String aim;

	private Map<String, Object> dataMap;

	public String execute() {
		dataMap = new HashMap<String, Object>();
		dataMap.put("ok", true);
		System.out.println("Dregister!" + email + "," + password);
		if (email == null || password == null || email.isEmpty()
				|| password.isEmpty()) {
			dataMap.put("ok", false);
			dataMap.put("msg", "错误！不懂怎么回事，难道是你太卡了？");
			return ERROR;
		}
		if (sql.SqlCon.isHave("select email from user where email='" + email
				+ "'")) {
			dataMap.put("ok", false);
			dataMap.put("msg", "这个邮箱已经被注册了，请换一个。");
			return SUCCESS;
		}
		String ss = String
				.format("insert into user (email,uname,password) values(\'%s\',\'%s\',\'%s\')",
						email, uname, password);
		if (!sql.Query.Q(ss)) {
			dataMap.put("ok", false);
			dataMap.put("msg", "注册失败！我也不懂怎么回事");
			return SUCCESS;
		}
		// if
		// (!SqlCon.isHave("select email from user where email='"+email+"' and password='"+password+"'")){
		// dataMap.put("ok", false);
		// dataMap.put("msg", "密码不对！请核实后再试。");
		// return SUCCESS;
		// }
		dataMap.put("msg", "哇，成功注册！欢迎您，" + email + "\n" + uname);
		return SUCCESS;
	}

	public String Login() {
		dataMap = new HashMap<String, Object>();
		dataMap.put("ok", true);
		System.out.println("Dregister.Login!" + email + "," + password);
		if (email == null || password == null || email.isEmpty()
				|| password.isEmpty()) {
			dataMap.put("ok", false);
			dataMap.put("msg", "错误！不懂怎么回事，难道是你太卡了？");
			return ERROR;
		}
		String s = "select uname,password from user where email='" + email
				+ "'";
		sql.AnyList any = new sql.AnyList(s);
		if (any.isEmpty()) {
			dataMap.put("ok", false);
			dataMap.put("msg", "没有这个邮箱，请去注册页面注册一下。");
			return SUCCESS;
		}
		List<List<String>> li2 = any.getList2();
		if (!li2.get(1).get(1).equals(password)) {
			dataMap.put("ok", false);
			dataMap.put("msg", "密码不对！请核实后再试。");
			return SUCCESS;
		}
		uname = li2.get(1).get(0);
		dataMap.put("email", email);
		dataMap.put("password", password);
		dataMap.put("msg", "哇，登陆成功！欢迎您，" + email + "\n" + uname);
		return SUCCESS;
	}

	public String AddFriend() {
		dataMap = new HashMap<String, Object>();
		if (!func.Dzone.CheckLogin(email, password)) {
			dataMap.put("msg", "账号登陆状态错误，请重新登陆！");
			dataMap.put("re", -1);
			return SUCCESS;
		}
		AnyList any = new AnyList("select email from user where email='" + aim
				+ "'");
		if (any.isEmpty()) {
			dataMap.put("msg", "没有这个人！");
			dataMap.put("re", -2);
			return SUCCESS;
		}
		String ss = String
				.format("insert into friend (user_email,friendemail) values('%s','%s')",
						email, aim);
		if (!sql.Query.Q(ss)) {
			dataMap.put("msg", "添加好友失败！");
			dataMap.put("re", -3);
			return SUCCESS;
		}
		dataMap.put("msg", "添加好友成功！");
		dataMap.put("re", 0);
		return SUCCESS;
	}

	public String GetFriend() {
		dataMap = new HashMap<String, Object>();
		if (!func.Dzone.CheckLogin(email, password)) {
			dataMap.put("msg", "账号登陆状态错误，请重新登陆！");
			dataMap.put("re", -1);
			return SUCCESS;
		}
		String ss = String
				.format("select email,uname from user,friend where friend.user_email='%s' and friend.friendemail=user.email",
						email);
		AnyList any = new AnyList(ss);
		dataMap.put("list", any.getList2());
		dataMap.put("msg", "查找好友成功！");
		dataMap.put("re", 0);
		return SUCCESS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public String getAim() {
		return aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}
}