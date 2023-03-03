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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		AdminLoginBean loginBean = new AdminLoginBean();

		loginBean.setEmail(email);
		loginBean.setPassword(password);

		AdminLoginDao login = new AdminLoginDao();
		HttpSession session = null;
		try {
			String validate = login.authenticateAdmin(loginBean);
			  switch (validate) {
              case "Admin":
                  session = request.getSession(); //Creating a session
                  session.setAttribute("Admin", email); //setting session attribute
                  request.setAttribute("email", email);
                  request.getRequestDispatcher("./MainAdmin.jsp").forward(request, response);
                  break;
              case "AirIndia":
                  session = request.getSession(); //Creating a session
                  session.setAttribute("AirIndia", email); //setting session attribute
                  request.setAttribute("email", email);
                  
                  request.getRequestDispatcher("./Admin.jsp").forward(request, response);
                  break;
              case "British":
                  session = request.getSession(); //Creating a session
                  session.setAttribute("British", email); //setting session attribute
                  request.setAttribute("email", email);
                  request.getRequestDispatcher("./Admin.jsp").forward(request, response);
                  break;
              case "Emirates":
                  session = request.getSession(); //Creating a session
                  session.setAttribute("Emirates", email); //setting session attribute
                  request.setAttribute("email", email);
                  request.getRequestDispatcher("./Admin.jsp").forward(request, response);
                  break;
              case "Quatar":
                  session = request.getSession(); //Creating a session
                  session.setAttribute("Quatar", email); //setting session attribute
                  request.setAttribute("email", email);
                  request.getRequestDispatcher("./Admin.jsp").forward(request, response);
                  break;
              default:
                  System.out.println("Error message = " + validate);
                  request.setAttribute("errMessage", validate);

                  request.getRequestDispatcher("./adminLogin.jsp").forward(request, response);
                  break;
			  }
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

}
