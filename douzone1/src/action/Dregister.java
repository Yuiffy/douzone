package action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.Map;

public class Dregister extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3247928074764504096L;
	private String email;
	private String password;
	private Map<String, Object> dataMap;

	public String execute() {
		dataMap=new HashMap<String , Object>();
		dataMap.put("ok", true);

//		if (!email.equals("123@qq.com")) {
//			dataMap.put("ok", false);
//			dataMap.put("msg", "邮箱不对！");
//			return SUCCESS;
//		}
//		if (!password.equals("123")){
//			dataMap.put("ok", false);
//			dataMap.put("msg", "密码不对！");
//			return SUCCESS;
//		}
		dataMap.put("msg", "哇，成功！");
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

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
}