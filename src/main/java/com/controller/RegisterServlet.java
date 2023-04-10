package com.controller;

import java.io.IOException;



import com.bean.RegisterBean;
import com.dao.RegisterDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="RegisterServlet",urlPatterns= {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(JSPLinks.RegistrationView);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String error_message = "There is a problem with your email or mobile";
		// Copying all the input parameters in to local variables
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		String mobile = request.getParameter("mobile");
		String user_password = request.getParameter("user_password");

		RegisterBean register = new RegisterBean();
		register.setUserName(user_name);
		register.setUserEmail(user_email);
		register.setMobile(mobile);
		register.setPassword(user_password);

		RegisterDao registerDao = new RegisterDao();
		// The core Logic of the Registration application is present here. We are going
		// to insert user data in to the database.
		String userRegistered = registerDao.registerUser(register);

		if (userRegistered.equals("SUCCESS")) // On success, you can display a message to user on Home page
		{
			
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else // On Failure, display a meaningful message to the User.
		{
			session.setAttribute("error-msg", error_message);
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}

	}

}
