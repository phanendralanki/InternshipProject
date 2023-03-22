package com.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.util.*;

@WebServlet("/addFlights")
@MultipartConfig
public class AddFlights extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Part p = req.getPart("file");
		String flightImage = p.getSubmittedFileName();

		//String remark = req.getParameter("remark");
		String flightId = req.getParameter("flightId");
		String flightName = req.getParameter("flightName");
		String startPoint = req.getParameter("startPoint");
		String destinationPoint = req.getParameter("destinationPoint");
		String seats_count = req.getParameter("seats_count");
		String seat_price = req.getParameter("seat_price");
		//System.out.println(fileName+""+remark+""+flightId+""+flightName+""+startPoint+""+destinationPoint+""+seats_count+""+seat_price);
		
		
		HttpSession session = req.getSession();
		try {
			
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/files","root","user");
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into flightDetails(flightId,flightName,startPoint,destinationPoint,seats_count,seat_price,flightImage) values(?,?,?,?,?,?,?)");
			
			ps.setString(1,flightId);
			ps.setString(2, flightName);
			ps.setString(3, startPoint);
			ps.setString(4, destinationPoint);
			ps.setString(5, seats_count);
			ps.setString(6, seat_price);
			ps.setString(7, flightImage);
			int i = ps.executeUpdate();
			
			if(i==1) {
				//System.out.println("upload success");
				String path = getServletContext().getRealPath("")+"images";
				System.out.println(path);
				File file = new File(path);
				p.write(path+file.separator+flightImage);
				//System.out.println("upload success");
				System.out.println(path);
				
				session.setAttribute("msg", "success");
				
				resp.sendRedirect("MainAdmin.jsp");
				
			}else {
				System.out.println("upload failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
