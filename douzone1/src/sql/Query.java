package sql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;

public class Query {
	static public boolean Book(int c1, String c2, int c3, String c4, Date c5,
			double c6) {
		try {
			SqlCon sqlC = new SqlCon();
			sqlC.setWrite();
			System.out.println("New SqlCon(1) over");
			Connection conn = sqlC.getConn();
			System.out.println("getConn Over");
			Statement statement = conn.createStatement();
			System.out.println("conn.createStatement() OVER");
			String ss = String.format(
					"insert into book (email,uname,password) values(%d,\'%s\',%d,\'%s\',\'%s\',%f)",
					c1, c2, c3, c4, c5.toString(), c6);
			System.out.println(ss);
			statement.executeUpdate(ss);
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("NewBook Error");
			return false;
		}
		return true;
	}

	static public boolean UpBook(int c1, String c2, int c3, String c4, Date c5,
			double c6) {
		try {
			SqlCon sqlC = new SqlCon();
			sqlC.setWrite();
			System.out.println("New SqlCon(1) over");
			Connection conn = sqlC.getConn();
			System.out.println("getConn Over");
			Statement statement = conn.createStatement();
			System.out.println("conn.createStatement() OVER");
			String ss = String
					.format("update book set Title=\'%s\',AuthorID=\'%d\',Publisher=\'%s\',PublishDate=\'%s\',Price=%f where ISBN=%d",
							c2, c3, c4, c5.toString(), c6, c1);
			System.out.println(ss);
			statement.executeUpdate(ss);
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("NewBook Error");
			return false;
		}
		return true;
	}

	static public boolean Author(int c1, String c2, int c3, String c4) {
		SqlCon sqlC = new SqlCon();
		sqlC.setWrite();
		Connection conn = sqlC.getConn();
		try {
			Statement statement = conn.createStatement();
			String ss = String.format(
					"insert into author values(%d,\'%s\',%d,\'%s\')", c1, c2,
					c3, c4);
			System.out.println(ss);
			statement.executeUpdate(ss);
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("NewAuthor Error");
			return false;
		}
		return true;
	}

	static public boolean DelBook(int c1) {
		try {
			SqlCon sqlC = new SqlCon();
			sqlC.setWrite();
			System.out.println("New SqlCon(1) over");
			Connection conn = sqlC.getConn();
			System.out.println("getConn Over");
			Statement statement = conn.createStatement();
			System.out.println("conn.createStatement() OVER");
			String ss = String.format("delete from book where ISBN=%d", c1);
			System.out.println(ss);
			statement.executeUpdate(ss);
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("DelBook Error");
			return false;
		}
		return true;
	}

	static public boolean InitDatabase() {
		SqlCon sqlC = new SqlCon();
		sqlC.setWrite();
		Connection conn = sqlC.getConn();
		try {
			Statement statement = conn.createStatement();
			statement
					.executeUpdate("create database bookdb default character set utf8");
			statement.executeUpdate("use bookdb");
			statement
					.executeUpdate("CREATE TABLE IF NOT EXISTS `author` (  `AuthorID` int(11) NOT NULL DEFAULT '0',  `Name` varchar(99) CHARACTER SET utf8 DEFAULT NULL,  `Age` int(11) DEFAULT NULL,  `Country` varchar(99) CHARACTER SET utf8 DEFAULT NULL,  PRIMARY KEY (`AuthorID`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
			statement
					.executeUpdate("CREATE TABLE IF NOT EXISTS `book` (  `ISBN` int(11) NOT NULL DEFAULT '0',  `Title` varchar(99) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,  `AuthorID` int(11) DEFAULT NULL COMMENT 'FK',  `Publisher` varchar(99) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,  `PublishDate` date DEFAULT NULL,  `Price` double DEFAULT NULL,  PRIMARY KEY (`ISBN`),  KEY `AuthorID_idx` (`AuthorID`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;");
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.println("InitDB Error");
			return false;
		}
		return true;
	}

	static public boolean Update(String ss) {
		try {
			SqlCon sqlC = new SqlCon();
			sqlC.setWrite();
			System.out.println("New SqlCon(1) over");
			Connection conn = sqlC.getConn();
			System.out.println("getConn Over");
			Statement statement = conn.createStatement();
			System.out.println("conn.createStatement() OVER");
			System.out.println(ss);
			statement.executeUpdate(ss);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Query.Update Error");
			return false;
		}
		return true;
	}
}
