package action;

import com.opensymphony.xwork2.ActionSupport;
import sql.Query;

public class NewAuthor extends ActionSupport {
	private static final long serialVersionUID = 5467263356128388361L;
	private String o1, o2, o3, o4;
	private String print = "";

	public String execute() {
		boolean b = false;
		try {
			b = Query.Author(Integer.parseInt(o1), o2, Integer.parseInt(o3), o4);
		} catch (Exception e) {
			setPrint("添加作者失败( ⊙o⊙ )");
			return "fail";
		}
		if (b) {
			setPrint("添加作者成功！O(∩_∩)O");
			return "success";
		} else {
			setPrint("添加作者失败( ⊙o⊙ )");
			return "fail";
		}
	}

	public void setO2(String o2) {
		this.o2 = o2;
	}

	public String getO2() {
		return o2;
	}

	public void setO1(String o1) {
		this.o1 = o1;
	}

	public String getO1() {
		return o1;
	}


	public void setO3(String o3) {
		this.o3 = o3;
	}

	public String getO3() {
		return o3;
	}
	
	public void setO4(String o4) {
		this.o4 = o4;
	}

	public String getO4() {
		return o4;
	}

	public void setPrint(String print) {
		this.print = print;
	}

	public String getPrint() {
		return print;
	}
}
