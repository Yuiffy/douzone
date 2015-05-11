package action;

import com.opensymphony.xwork2.ActionSupport;
import sql.Query;

public class DelBook extends ActionSupport {
	private static final long serialVersionUID = -2690985087670782512L;
	private String ISBN;
	private String authorName;
	private String print = "";

	public String execute() {
		boolean b = false;
		try {
			b = Query.DelBook(Integer.parseInt(ISBN));
		} catch (Exception e) {
			setPrint("删除图书失败( ⊙o⊙ )");
			return "fail";
		}
		if (b) {
			setPrint("删除图书成功！O(∩_∩)O");
			return "success";
		} else {
			setPrint("删除图书失败( ⊙o⊙ )");
			return "fail";
		}
	}


	public void setISBN(String o1) {
		this.ISBN = o1;
	}

	public String getISBN() {
		return ISBN;
	}
	public void setPrint(String print) {
		this.print = print;
	}

	public String getPrint() {
		return print;
	}


	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}


	public String getAuthorName() {
		return authorName;
	}


}
