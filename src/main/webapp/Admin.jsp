<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Admin")== null) )
{
%>
<jsp:forward page="adminLogin.jsp"></jsp:forward>
<%} %>
<body>
	<center>
		<h2>Admin's home</h2>
	</center>
	
	<script src="MyCode/js/bootstrap.min.js"></script>
</body>
</html>