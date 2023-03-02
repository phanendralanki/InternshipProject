<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet" href="MyCode/css/bootstrap.min.css">

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
							value="reset" name="reset" class="btn btn-warning"/>
					</div>

				</form>
				
				<% 
					if(request.getParameter("add")!=null){
						String flightId = request.getParameter("flightId");
						String flightName = request.getParameter("flightName");
						String startPoint = request.getParameter("startPoint");
						String destinationPoint = request.getParameter("destinationPoint");
						String seats_count = request.getParameter("seats_count");
						String seat_price = request.getParameter("seat_price");
						
							Connection con;
					       // PreparedStatement pst;
					        ResultSet rs;
					        
					        Class.forName("com.mysql.cj.jdbc.Driver");
					        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
					        if(AirIndia!=null){
					        PreparedStatement pst = con.prepareStatement("insert into admins(flightId,flightName,startPoint,destinationPoint,seats_count,seat_price) values(?,?,?,?,?,?)");
					    
					        pst.setString(1,flightId);
					        pst.setString(2,flightName);
					        pst.setString(3,startPoint);
					        pst.setString(4,destinationPoint);
					        pst.setString(5,seats_count);
					       	pst.setString(6,seat_price); 
					        pst.executeUpdate();
					        }
						%>
						
						<script>
							alert("record added");
						</script>
					<% }else{%>
					
					<script>
						alert("record can't be added");
					</script>
					
					<% }%>
			<% if(AirIndia!=null){ %>
				
			<%}%>
			
			<%if(British!=null){%>
			<script>
				alert("British");
			</script>
			<%} %>
			<%if(Emirates!=null){%>
			<script>
				alert("Emirates");
			</script>
			<%} %>
			<% if(Quatar!=null){%>
			<script>
				alert("Quatar");
			</script>
			<%} %>
				
			</div>
		</div>
	</div>

	


	<!-- <a href="AdminLogoutServlet"><button>Logout</button></a>  -->
	<script src="MyCode/js/bootstrap.min.js"></script>
</body>
</html>