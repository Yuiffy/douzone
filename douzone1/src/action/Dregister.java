package action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sql.Query;
import sql.SqlCon;

public class Dregister extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3247928074764504096L;
	private String email;
	private String password;
	private String uname;

	private Map<String, Object> dataMap;

	public String execute() {
		dataMap = new HashMap<String, Object>();
		dataMap.put("ok", true);
		System.out.println("Dregister!" + email + "," + password);
		if (email == null || password == null) {
			dataMap.put("ok", false);
			dataMap.put("msg", "错误！不懂怎么回事，难道是你太卡了？");
			return ERROR;
		}
		if (SqlCon.isHave("select email from user where email='" + email + "'")) {
			dataMap.put("ok", false);
			dataMap.put("msg", "这个邮箱已经被注册了，请换一个。");
			return SUCCESS;
		}
		String ss = String
				.format("insert into user (email,uname,password) values(\'%s\',\'%s\',\'%s\')",
						email, uname, password);
		if (!Query.Update(ss)) {
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
		if (email == null || password == null) {
			dataMap.put("ok", false);
			dataMap.put("msg", "错误！不懂怎么回事，难道是你太卡了？");
			return ERROR;
		}
		if (!SqlCon
				.isHave("select email from user where email='" + email + "'")) {
			dataMap.put("ok", false);
			dataMap.put("msg", "没有这个邮箱，请去注册页面注册一下。");
			return SUCCESS;
		}
		String s = "select email from user where email='" + email
				+ "' and password='" + password + "'";
		if (!SqlCon.isHave(s)) {
			dataMap.put("ok", false);
			dataMap.put("msg", "密码不对！请核实后再试。");
			return SUCCESS;
		}
		sql.AnyList any = new sql.AnyList(
				"select uname from user where email='" + email
						+ "' and password='" + password + "'");
		List<String> li = any.getList();
		uname=li.get(1);
		dataMap.put("msg", "哇，登陆成功！欢迎您，" + email + "\n" + uname);
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
}