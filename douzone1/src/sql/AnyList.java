package sql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AnyList {
	private List<List<String>> list2 = new ArrayList<List<String>>();

	public AnyList() {

	}

	public List<String> getList() {
		List<String> list = new ArrayList<String>();
		int ma = list2.size();
		for (int i = 0; i < ma; i++) {
			String s = "";
			List<String> ls = list2.get(i);
			int ma2 = ls.size();
			for (int j = 0; j < ma2; j++)
				s += ls.get(j) + "\t";
			list.add(s);
		}
		return list;
	}

	public List<List<String>> getList2() {
		return this.list2;
	}

	public boolean isEmpty() {
		return list2.size() <= 1;
	}

	public AnyList(String s) {
		SqlCon sqlC = new SqlCon();
		Connection conn = sqlC.getConn();
		try {
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(s);
			// /"select * from book where Author="+ authorName
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			List<String> tlist = new ArrayList<String>();
			for (int i = 0; i < columnCount; i++) {
				String t = rsmd.getColumnName(i + 1);
				tlist.add(t);
			}
			this.list2.add(tlist);
			while (rs.next()) {
				tlist = new ArrayList<String>();
				for (int i = 0; i < columnCount; i++) {
					String t = rs.getString(i + 1);
					tlist.add(t);
				}
				this.list2.add(tlist);
			}
			rs.close();
			statement.close();
			conn.close();
			sqlC.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		}
	}
}
