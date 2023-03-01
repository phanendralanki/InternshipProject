package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.AdminLoginBean;
import com.mysql.cj.xdevapi.Statement;
import com.util.DBConnection;

public class AdminLoginDao {
	public String authenticateAdmin(AdminLoginBean loginBean) {
		String user_email = loginBean.getEmail();
		String user_password = loginBean.getPassword();
		
		Connection con = null;
//	    Statement statement = null;
//	    ResultSet resultSet = null;
	 
	    String emailDB = "";
	    String passwordDB = "";
	    String role = "";
	    
	    try {
	    	con = DBConnection.getConnection();
	    	java.sql.Statement statement =  con.createStatement();
	    	ResultSet resultSet = ((java.sql.Statement) statement).executeQuery("select email,password,role from admins ");
	    
	    	while(resultSet.next()) {
	    		emailDB = resultSet.getString("email");
	    		passwordDB = resultSet.getString("password");
	    		role = resultSet.getString("role");
	    		
	    		if(user_email.equals(emailDB)&& user_password.equals(passwordDB)&&role.equals("Admin")) {
	    			return "Admin";
	    		}else if(user_email.equals(emailDB)&&user_password.equals(passwordDB)&&role.equals("AirIndiaAdmin")) {
	    			return "AirIndia";
	    		}else if(user_email.equals(emailDB)&&user_password.equals(passwordDB)&&role.equals("BristishAdmin")) {
	    			return "British";
	    		}else if(user_email.equals(emailDB)&&user_password.equals(passwordDB)&&role.equals("EmiratesAdmin")) {
	    			return "Emirates";
	    		}else if(user_email.equals(emailDB)&&user_password.equals(passwordDB)&&role.equals("QuatarAdmin")) {
	    			return "Quatar";
	    		}
	    		
	    	}
	    }catch(SQLException e) {
	    	e.printStackTrace();
	    }
		
		return "Invalid user credentials";
	}
}
