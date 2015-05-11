package action;

import java.sql.Date;

import com.opensymphony.xwork2.ActionSupport;
import sql.Query;

public class NewBook extends ActionSupport {
	private static final long serialVersionUID = -426956885413357397L;
	private String o1, o2, o3, o4, o5="1900-01-01", o6;
	private String print = "";

	public String execute() {
		boolean b = false;
		try {
			b = Query.Book(Integer.parseInt(o1), o2, Integer.parseInt(o3), o4,
					Date.valueOf(o5), Double.parseDouble(o6));
		} catch (Exception e) {
			setPrint("添加图书失败( ⊙o⊙ )");
			return "fail";
		}
		if (b) {
			setPrint("添加图书成功！O(∩_∩)O");
			return "success";
		} else {
			setPrint("添加图书失败( ⊙o⊙ )");
			return "fail";
		}
	}

	public void setO6(String o6) {
		this.o6 = o6;
	}

	public String getO6() {
		return o6;
	}

	public void setO4(String o4) {
		this.o4 = o4;
	}

	public String getO4() {
		return o4;
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

	public void setO5(String o5) {
		this.o5 = o5;
	}

	public String getO5() {
		return o5;
	}

	public void setO3(String o3) {
		this.o3 = o3;
	}

	public String getO3() {
		return o3;
	}

	public void setPrint(String print) {
		this.print = print;
	}

	public String getPrint() {
		return print;
	}
}
