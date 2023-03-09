package com.controller;

import java.io.IOException;

import com.bean.RegisterBean;
import com.dao.RegisterDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/LoginSerlvet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_email = request.getParameter("user_email");
		String user_password = request.getParameter("user_password");
		
		RegisterBean loginBean = new RegisterBean();
		
		loginBean.setUserEmail(user_email);
		loginBean.setPassword(user_password);
		
		RegisterDao loginDao = new RegisterDao();
		
		String userValidate = loginDao.authenticateUser(loginBean);
		
		if(userValidate.equals("success")) {
			HttpSession session = request.getSession();
	         session.setAttribute("user_email", user_email);
	         response.sendRedirect("home.jsp");
		}else {
			request.getRequestDispatcher("./login.jsp").forward(request,response);
		}
	}

}
