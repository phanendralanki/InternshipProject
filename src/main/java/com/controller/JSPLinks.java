package com.controller;

public interface JSPLinks {
	
	public String APP_CONTENT = "/PavoAirLines";
	
	public String PAGE_FOLDER = "/JSP";
	
	/*For header*/
	public String header = PAGE_FOLDER+"/header.jsp";
	
	/*For Login Page*/
	public String LoginView = PAGE_FOLDER+"/login.jsp";
	public String LoginServlet = APP_CONTENT+"/LoginServlet";
	
	/*For Registration Page */
	public String RegistrationView = PAGE_FOLDER+"/register.jsp";
	public String RegisterServlet = APP_CONTENT+"/RegisterServlet";
}
