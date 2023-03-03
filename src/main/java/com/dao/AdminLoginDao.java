package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.AdminLoginBean;
import com.mysql.cj.xdevapi.Statement;
import com.util.DBConnection;

public class AdminLoginDao {
	public String authenticateAdmin(AdminLoginBean loginBean) {
		String email = loginBean.getEmail();
		String password = loginBean.getPassword();
		
		Connection con = null;
	    java.sql.Statement statement = null;
	    ResultSet resultSet = null;
	 
	    String emailDB = "";
	    String passwordDB = "";
	    String role = "";
	    
	    try {
	    	con = DBConnection.getConnection();
	    	statement =  con.createStatement();
	    	resultSet = statement.executeQuery("select email,password,role from admins ");
	    
	    	while(resultSet.next()) {
	    		emailDB = resultSet.getString("email");
	    		passwordDB = resultSet.getString("password");
	    		role = resultSet.getString("role");
	    		
	    		if(email.equals(emailDB)&& password.equals(passwordDB)&&role.equalsIgnoreCase("Admin")) {
	    			return "Admin";
	    		}else if(email.equals(emailDB)&&password.equals(passwordDB)&&role.equalsIgnoreCase("AirIndiaAdmin")) {
	    			return "AirIndia";
	    		}else if(email.equals(emailDB)&&password.equals(passwordDB)&&role.equals("BristishAdmin")) {
	    			return "British";
	    		}else if(email.equals(emailDB)&&password.equals(passwordDB)&&role.equals("EmiratesAdmin")) {
	    			return "Emirates";
	    		}else if(email.equals(emailDB)&&password.equals(passwordDB)&&role.equals("QuatarAdmin")) {
	    			return "Quatar";
	    		}
	    		
	    	}
	    }catch(SQLException e) {
	    	e.printStackTrace();
	    }
		
		return "Invalid user credentials";
	}
}
