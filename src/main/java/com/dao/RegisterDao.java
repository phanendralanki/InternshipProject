package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.RegisterBean;
import com.util.DBConnection;

public class RegisterDao {
	 public String registerUser(RegisterBean registerBean)
     {
         String user_name = registerBean.getUserName();
         String user_email = registerBean.getUserEmail();
         String mobile = registerBean.getMobile();
         String user_password = registerBean.getPassword();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.getConnection();
             String query = "insert into data(user_name,user_email,mobile,user_password) values (?,?,?,?)"; //Insert user details into the table 'data'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, user_name);
             preparedStatement.setString(2, user_email);
             preparedStatement.setString(3, mobile);
             preparedStatement.setString(4, user_password);
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
     }
	 
	 public String authenticateUser(RegisterBean loginBean) {
		 
		 String user_email = loginBean.getUserEmail(); //Assign user entered values to temporary variables
		 String user_password = loginBean.getPassword();
		 
		 Connection con = null;
		 java.sql.Statement statement = null;
		 ResultSet resultSet = null;
		 
		 String userEmailDB = "";
		 String passwordDB = "";
		 
		 try {
			 con = DBConnection.getConnection();
			 statement =  con.createStatement();
			 resultSet =  statement.executeQuery("select user_email,user_password from data");
			 
			 while(resultSet.next()) {
				 userEmailDB = resultSet.getString("user_email");
				 passwordDB = resultSet.getString("user_password");
				 
				 if(user_email.equals(userEmailDB)&& user_password.equals(passwordDB)) {
					 return "success";
				 }
			 }
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }
		 
		 
		return "Invalid user credentials";
		 
	 }
}
