package sql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuthorList {
	private List<AuthorInfo> list = new ArrayList<AuthorInfo>();

	public AuthorList() {

	}

	public List<AuthorInfo> getList() {
		return this.list;
	}

	public AuthorList(String s) {
		SqlCon sqlC = new SqlCon();
		Connection conn = sqlC.getConn();
		try {
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(s);
			// /"select * from book where Author="+ authorName
			this.list = new ArrayList<AuthorInfo>();
			while (rs.next()) {
				AuthorInfo ai = new AuthorInfo();
				ai.setAuthorID(rs.getInt(1));
				ai.setName(rs.getString(2));
				ai.setAge(rs.getInt(3));
				ai.setCountry(rs.getString(4));
				this.list.add(ai);
			}
		} catch (SQLException e) {
			// e.printStackTrace();
		}
	}
}
