package com.onlineQuiz.dbUtil;

import java.sql.*;

public class DbUtil {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/OnlineQuiz";
	private static String user = "root";
	private static String password = "123456";

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection successful!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
