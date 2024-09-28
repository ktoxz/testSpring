package com.example.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseManager {
	public static Connection myConn = null;
	private static String user = "root";
	private static String password = "123123";
	private static String url = "jdbc:mysql://localhost:3306/asm_web2";
	public static DatabaseManager instance;
	public static void ConnectToDb() throws SQLException {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver"); // Nạp driver MySQL
	    } catch (ClassNotFoundException e) {
	        throw new SQLException("MySQL JDBC driver not found.", e);
	    }
		myConn = DriverManager.getConnection(url,user, password);
	}
	
	public static DatabaseManager getInstance() throws SQLException {
		if(instance == null) {
			instance = new DatabaseManager();
			ConnectToDb();
		}
		return instance;
	}
	
}
