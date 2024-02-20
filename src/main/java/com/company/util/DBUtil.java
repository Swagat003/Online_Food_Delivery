package com.company.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static final String URL = "jdbc:mysql://localhost:3306/food_delivery_system";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "password";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		System.out.println("Connected successfully");

		return conn;
	}
}
