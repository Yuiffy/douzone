package action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
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
	private int id;
	private List<String> smap;

	public List<String> getSmap() {
		return smap;
	}

	public void setSmap(List<String> smap) {
		this.smap = smap;
	}

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

	public String GetFollower() {
		dataMap = new HashMap<String, Object>();
		if (!func.Dzone.CheckLogin(email, password)) {
			dataMap.put("msg", "账号登陆状态错误，请重新登陆！");
			dataMap.put("re", -1);
			return SUCCESS;
		}
		String ss = String
				.format("select email,uname from user,friend where friend.user_email=user.email and friend.friendemail='%s'",
						email);
		AnyList any = new AnyList(ss);
		dataMap.put("list", any.getList2());
		dataMap.put("msg", "查找粉丝成功！");
		dataMap.put("re", 0);
		return SUCCESS;
	}

	public String UpRizhi() {
		dataMap = new HashMap<String, Object>();
		if (!func.Dzone.CheckLogin(email, password)) {
			dataMap.put("msg", "账号登陆状态错误，请重新登陆！");
			dataMap.put("re", -1);
			return SUCCESS;
		}
		if (smap == null) {
			System.out.println("UpRizhi smap null");
			dataMap.put("msg", "post错误！");
			dataMap.put("re", -2);
		}
		String ss = "";
		String title = func.Dzone.Diao(smap.get(0));
		String rizhi = func.Dzone.Diao(smap.get(1));
		int did = new Integer(smap.get(2));
		if (did == -1) {
			ss = String
					.format("insert into diary (user_email,dname,data) values(\'%s\',\'%s\',\'%s\')",
							email, title, rizhi);
		} else {
			ss = String
					.format("replace into diary (did,user_email,dname,data) values(%d,\'%s\',\'%s\',\'%s\')",
							new Integer(smap.get(2)), email, title, rizhi);
		}
		if (!sql.Query.Q(ss)) {
			dataMap.put("re", -3);
			dataMap.put("msg", "Up日志错误！我也不懂怎么回事");
			return SUCCESS;
		}
		dataMap.put("re", 0);
		dataMap.put("msg", "Up日志成功！");
		return SUCCESS;
	}

	public String FriendAll() {
		dataMap = new HashMap<String, Object>();
		if (!func.Dzone.CheckLogin(email, password)) {
			dataMap.put("msg", "账号登陆状态错误，请重新登陆！");
			dataMap.put("re", -1);
			return SUCCESS;
		}
		String ss = String
				.format("select update_time,diary.user_email,data,did,dname from diary,friend where (friend.friendemail=diary.user_email and friend.user_email='%s')or(diary.user_email='%s')group by did order by update_time desc",
						email, email);
		List<Integer> dnum = new ArrayList<Integer>();
		dnum.add(2);
		dnum.add(4);
		AnyList any = new AnyList(ss, dnum);
		List<List<String>> thelist = any.getList2();

		String sreply = String
				.format("select replytodiary.update_time, replytodiary.user_email, replytodiary.data, replytodiary.rid, replytodiary.diary_did from replytodiary,diary,friend where ((friend.friendemail=diary.user_email and friend.user_email='%s')or(diary.user_email='%s'))and replytodiary.diary_did=diary.did group by rid order by replytodiary.update_time desc",
						email, email);
		dnum = new ArrayList<Integer>();
		dnum.add(2);
		AnyList replyany = new AnyList(sreply, dnum);
		List<List<String>> thereplist = replyany.getList2();
		Map<Integer, List<List<String>>> reptorizhi = new HashMap<Integer, List<List<String>>>();
		int rsize = thereplist.size();
		for (int i = 1; i < rsize; i++) {
			int tdid = new Integer(thereplist.get(i).get(4));
			List<List<String>> t = reptorizhi.get(tdid);
			if (t == null) {
				t = new ArrayList<List<String>>();
			}
			t.add(thereplist.get(i));
			reptorizhi.put(tdid, t);
		}
		dataMap.put("list", thelist);
		dataMap.put("repmap", reptorizhi);
		dataMap.put("msg", "查找好友动态和自己动态成功！");
		dataMap.put("re", 0);
		return SUCCESS;
	}

	public String ReplytoRizhi() {
		dataMap = new HashMap<String, Object>();
		if (!func.Dzone.CheckLogin(email, password)) {
			dataMap.put("msg", "账号登陆状态错误，请重新登陆！");
			dataMap.put("re", -1);
			return SUCCESS;
		}
		String ss = String
				.format("insert into replytodiary (user_email,diary_did,data) values(\'%s\',%d,\'%s\')",
						email, id, func.Dzone.Diao(aim));
		if (!sql.Query.Q(ss)) {
			dataMap.put("msg", "回复日志失败！");
			dataMap.put("re", -3);
			return SUCCESS;
		}
		dataMap.put("msg", "回复日志成功！");
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}