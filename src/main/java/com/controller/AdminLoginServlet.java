package com.controller;

import java.io.IOException;

import com.bean.AdminLoginBean;
import com.dao.AdminLoginDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLoginServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		AdminLoginBean loginBean = new AdminLoginBean();

		loginBean.setEmail(email);
		loginBean.setPassword(password);

		AdminLoginDao login = new AdminLoginDao();

		try {
			String validate = login.authenticateAdmin(loginBean);

			if (validate.equals("Admin")) {
				System.out.println("Admin's Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("Admin", email); // setting session attribute
				request.setAttribute("email", email);

				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			} else if (validate.equals("AirIndia")) {
				System.out.println("Air India Admin's Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("AirIndia", email); // setting session attribute
				request.setAttribute("email", email);

				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			} else if (validate.equals("British")) {
				System.out.println("British Admin's Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("British", email); // setting session attribute
				request.setAttribute("email", email);

				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			} else if (validate.equals("Emirates")) {
				System.out.println("Emirates Admin's Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("Emirates", email); // setting session attribute
				request.setAttribute("email", email);

				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			} else if (validate.equals("Quatar")) {
				System.out.println("Quatar India Admin's Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("Quatar", email); // setting session attribute
				request.setAttribute("email", email);

				request.getRequestDispatcher("Admin.jsp").forward(request, response);
			} else {
//	            System.out.println("Error message = "+userValidate);
//	            request.setAttribute("errMessage", userValidate);

				request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

}
