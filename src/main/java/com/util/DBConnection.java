package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/pavo";
		String username = "root";
		String password = "user";
		
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url,username,password);
			System.out.println("Connection established= "+con);
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return con;
	}
}
