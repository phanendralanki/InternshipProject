<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="MyCode/css/bootstrap.min.css">


 <% //In case, if User session is not set, redirect to Login page.
   response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
            
              response.setHeader("Pragma","no-cache"); //HTTP 1.0
            
              response.setHeader("Expires","0"); //Proxies
           
              if(request.getAttribute("email")==null){
                
              
              %>
             <jsp:forward page="adminLogin.jsp"></jsp:forward>

              <%}%>

</head>

<body>

	<%
	String Admin = (String) session.getAttribute("Admin");
	String AirIndia = (String) session.getAttribute("AirIndia");
	String British = (String) session.getAttribute("British");
	String Emirates = (String) session.getAttribute("Emirates");
	String Quatar = (String) session.getAttribute("Quatar");
	%>




	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<%if (Admin != null){%>
				<!--form-->
			
				<form action="#" method="POST" class="">

					<div align="left">
						<label class="form-label">Admin Name</label> <input type="text"
							class="form-control" placeholder="Admin Name" name="name"
							id="name" required  autocomplete="off"/>
					</div>

					<div align="left">
						<label class="form-label">Email</label> <input type="text"
							class="form-control" placeholder="Email" name="email" id="email"
							required  autocomplete="off"/>
					</div>

					<div align="left">
						<label class="form-label">Mobile</label> <input type="text"
							class="form-control" placeholder="Enter your number"
							name="mobile" id="fee" required  autocomplete="off"/>
					</div>
					<div align="left">
						<label class="form-label">Password</label> <input type="password"
							class="form-control" placeholder="Enter your password"
							name="password" id="fee" required  autocomplete="off"/>
					</div>
					<div align="left">
						<label class="form-label">Role</label> <input type="text"
							class="form-control" placeholder="Enter your role" name="role"
							id="fee" required  autocomplete="off"/>
					</div>
					<br />
					<div align="right">
						<input type="submit" id="add" value="add" name="add"
							class="btn btn-info"> <input type="reset" id="reset"
							value="reset" name="reset" class="btn btn-warning">

					</div>

				</form>
				<%
				} else if (AirIndia != null) {
				%>
				<form action="#" method="POST" class="">

					<div align="left">
						<label class="form-label">Flight Id:</label> <input type="text"
							class="form-control" placeholder="flight Id" name="flightId"
							id="flightId" required />
					</div>

					<div align="left">
						<label class="form-label">Flight Name: </label> <input type="text"
							class="form-control" placeholder="Flight Name" name="flightName"
							id="flightName" required />
					</div>

					<div align="left">
						<label class="form-label">Start point</label> <input type="text"
							class="form-control" placeholder="start point" name="startPoint"
							id="startPoint" required />
					</div>
					<div align="left">
						<label class="form-label">Destination point</label> <input
							type="text" class="form-control" placeholder="Destination Point"
							name="destinationPoint" id="destinationPoint" required />
					</div>
					<div align="left">
						<label class="form-label">Seats</label> <input type="text"
							class="form-control" placeholder="Enter no of seats"
							name="seats_count" id="seats_count" required />
					</div>
					<div align="left">
						<label class="form-label">Seat Price</label> <input type="text"
							class="form-control" placeholder="Enter seat price"
							name="seat_price" id="seat_price" required />
					</div>

					<br />
					<div align="right">
						<input type="submit" id="add" value="add" name="add"
							class="btn btn-info"> <input type="reset" id="reset"
							value="reset" name="reset" class="btn btn-warning">

					</div>

				</form>
				<%
				} else if (British != null) {
				%>
				<h1>you are British Admin</h1>
				<%
				} else if (Emirates != null) {
				%>
				<h1>you are Emirates Admin</h1>
				<%
				} else if (Quatar != null) {
				%>
				<h1>you are Quatar Admin</h1>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<%
	if (Admin!= null) {
		if (request.getParameter("add") != null) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			%>
			<script>alert("added")</script>
		<%} %>
		
	<% }%>


	<a href="AdminLogoutServlet"><button>Logout</button></a>
	<script src="MyCode/js/bootstrap.min.js"></script>
</body>
</html>