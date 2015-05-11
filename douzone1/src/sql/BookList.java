package sql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookList {
	private List<BookInfo> list = new ArrayList<BookInfo>();

	public BookList() {

	}

	public List<BookInfo> getList() {
		return this.list;
	}

	public BookList(String s) {
		if(s=="select * from book where AuthorID=-1"){
			list=new ArrayList<BookInfo>();
			return;
		}
		SqlCon sqlC = new SqlCon();
		Connection conn = sqlC.getConn();
		try {
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(s);
			// /"select * from book where Author="+ authorName
			this.list = new ArrayList<BookInfo>();
			while (rs.next()) {
				this.list.add(new BookInfo(rs.getInt(1), rs.getString(2), rs
						.getInt(3), rs.getString(4), rs.getDate(5), rs
						.getDouble(6)));
			}
		} catch (SQLException e) {
			// e.printStackTrace();
		}
	}
}
