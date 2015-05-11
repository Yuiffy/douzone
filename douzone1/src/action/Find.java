package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sql.SqlCon;

import com.opensymphony.xwork2.ActionSupport;

public class Find extends ActionSupport {
	private static final long serialVersionUID = 6568930727198676719L;

	private String authorName = "";
	private String where = "AuthorID=-1";

	public void setAuthorName(String s) {
		this.authorName = s;
	}

	public String getAuthorName() {
		return this.authorName;
	}

	public String execute() {
		SqlCon sqlC = new SqlCon();
		Connection conn = sqlC.getConn();
		Statement statement;
		try {
			statement = conn.createStatement();
			if (sqlC.isOnline() == false)
				statement.executeQuery("use bookdb");
			String s = "select AuthorID from author where Name=\'" + authorName
					+ "\'";
			System.out.println(s);
			ResultSet rs = statement.executeQuery(s);
			if (rs.next()) {
				System.out.println("YES!I FOUND IT!");
				String wh = "";
				wh += "AuthorID=" + String.valueOf(rs.getInt(1));
				while (rs.next()) {
					wh += "or AuthorID=" + String.valueOf(rs.getInt(1));
				}
				setWhere(wh);
			}
		} catch (SQLException e) {
			// TODO wow
			// e.printStackTrace();
		}
		return "success";
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getWhere() {
		return where;
	}
}
