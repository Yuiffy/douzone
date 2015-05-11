package action;

import com.opensymphony.xwork2.ActionSupport;

public class Inform extends ActionSupport {
	private static final long serialVersionUID = 8139381969233993502L;
	private String ISBN;
	public String execute() {
		System.out.println("Inform ISBN="+ISBN);
		return "success";
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getISBN() {
		return ISBN;
	}
}
