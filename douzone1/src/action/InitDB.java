package action;

import com.opensymphony.xwork2.ActionSupport;
import sql.Query;

public class InitDB extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1857325482456636204L;
	private String print = "";

	public String execute() {
		boolean b = false;
		try {
			b = Query.InitDatabase();
		} catch (Exception e) {
			setPrint("初始化数据库失败( ⊙o⊙ )");
			return "fail";
		}
		if (b) {
			setPrint("初始化数据库成功，也可能已经有那些表了所以没进行操作。O(∩_∩)O");
			return "success";
		} else {
			setPrint("初始化数据库大失败( ⊙o⊙ )");
			return "fail";
		}
	}

	public void setPrint(String print) {
		this.print = print;
	}

	public String getPrint() {
		return print;
	}
}
