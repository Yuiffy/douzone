package action;

import java.sql.Date;

import sql.Query;

import com.opensymphony.xwork2.ActionSupport;

public class WriteBookByWeibo extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 782996771659977510L;
	private String print = "";

	private String o1, o2, o3, o4;
	private String oo1, oo2, oo3, oo4, oo6;
	public String getOo1() {
		return oo1;
	}

	public void setOo1(String oo1) {
		this.oo1 = oo1;
	}

	public String getOo2() {
		return oo2;
	}

	public void setOo2(String oo2) {
		this.oo2 = oo2;
	}

	public String getOo3() {
		return oo3;
	}

	public void setOo3(String oo3) {
		this.oo3 = oo3;
	}

	public String getOo4() {
		return oo4;
	}

	public void setOo4(String oo4) {
		this.oo4 = oo4;
	}

	public String getOo6() {
		return oo6;
	}

	public void setOo6(String oo6) {
		this.oo6 = oo6;
	}

	public long getOo5() {
		return oo5;
	}

	public void setOo5(long oo5) {
		this.oo5 = oo5;
	}

	long oo5;
	public String execute() {
		boolean b = false;
		try {
			b = Query.Author(Integer.parseInt(o1), o2, Integer.parseInt(o3), o4);
		} catch (Exception e) {
			setPrint("加作者失败！");
			return "fail";
		}
		if (b) {
			setPrint("你被添加进去啦！");
		} else {
			setPrint("好像你已经在里面了，");
		}
		
		b = false;
		Date dat=new Date(oo5);
		try {
			System.out.println(oo1+oo2+oo3+oo4+oo6);
			System.out.println(oo5);
			b = Query.Book(Integer.parseInt(oo1), oo2, Integer.parseInt(oo3), oo4,
					dat, Double.parseDouble(oo6));
		} catch (Exception e) {
			appPrint("添加图书失败( ⊙o⊙ )");
			e.printStackTrace();
			return "fail";
		}
		if (b) {
			appPrint("添加图书成功！O(∩_∩)O");
			return "success";
		} else {
			appPrint("写个新微博才能加新书( ⊙o⊙ )");
			return "fail";
		}
	}
	public void setPrint(String print) {
		this.print = print;
	}

	public void appPrint(String print) {
		this.print += print;
	}

	public String getPrint() {
		return print;
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
}
