<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
	<%
	String Admin = (String) session.getAttribute("Admin");
	String AirIndia = (String) session.getAttribute("AirIndia");
	String British = (String) session.getAttribute("British");
	String Emirates = (String) session.getAttribute("Emirates");
	String Quatar = (String) session.getAttribute("Quatar");
	%>

	<%
	if (Admin != null) {
	%>
	<nav class="nav navbar bg-primary text-white text-center">
	<div align="center">
	<h3>Welcome main Admin ${Admin}</h3>
	</div>
</nav>
<div class="container mt-3">
	<div class="row">
		<div class="col-sm-4">
			<form action="#" method="POST" class="">

				<div align="left">
					<label class="form-label">Admin name: </label> <input type="text"
						class="form-control" placeholder="Admin name" name="name"
						id="name" required autocomplete="off" />
				</div>

				<div align="left">
					<label class="form-label">Admin Email: </label> <input type="text"
						class="form-control" placeholder="Email" name="email" id="email"
						required autocomplete="off" />
				</div>

				<div align="left">
					<label class="form-label">Mobile:</label> <input type="text"
						class="form-control" placeholder="Mobile" name="mobile"
						id="startPoint" required autocomplete="off" />
				</div>
				<div align="left">
					<label class="form-label">Password:</label> <input type="password"
						class="form-control" placeholder="password" name="password"
						id="password" required autocomplete="off" />
				</div>
				<div align="left">
					<label class="form-label">role:</label> <input type="text"
						class="form-control" placeholder="Enter role" name="role"
						id="role" required autocomplete="off" />
				</div>

				<br />
				<div align="right">
					<input type="submit" id="add" value="add" name="add"
						class="btn btn-info"> <input type="reset" id="reset"
						value="reset" name="reset" class="btn btn-warning" />
				</div>

			</form>

			<!-- 
				<div>
					<a href="AdminLogout.java">Logout</a>
				</div>
				 -->

		</div>
		<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4  mt-3">
			<div class="panel-body">
				<table id="tbl-admin" class="table table-responsive table-bordered"
					cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Admin Name</th>
							<th>email</th>
							<th>mobile</th>
							<th>password</th>
							<th>role</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>

						<%
						Connection connection;
						// PreparedStatement pst;
						ResultSet result;

						Class.forName("com.mysql.cj.jdbc.Driver");
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo", "root", "user");
						
						String quer = "select *from admins";
						
						Statement statement = connection.createStatement();
						
						result = statement.executeQuery(quer);
						
						while(result.next()){
							String id = result.getString("id");
						
						
						%>

						<tr>
							<td><%=result.getString("name") %></td>
							<td><%=result.getString("email") %></td>
							<td><%=result.getString("mobile") %></td>
							<td><%=result.getString("password") %></td>
							<td><%=result.getString("role") %></td>
							<td><a href="update.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
						</tr>

					<%} %>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<h3>Add Flight details</h3>
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
						<input type="submit" id="submit" value="add" name="submit"
							class="btn btn-info"> <input type="reset" id="reset"
							value="reset" name="reset" class="btn btn-warning"/>
					</div>

				</form>
				
		</div>
	
	
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4 mt-5">
			<div class="panel-body">
				<table id="tbl-admin" class="table table-responsive table-bordered" cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>flightId</th>
							<th>flightName</th>
							<th>startPoint</th>
							<th>DestinationPoint</th>
							<th>seats_count</th>
							<th>seat price</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						<%
						Connection conn;
						// PreparedStatement pst;
						ResultSet res;

						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo", "root", "user");
						
						String q = "select *from flightDetails";
						
						Statement stmt = conn.createStatement();
						
						res = stmt.executeQuery(q);
						
						while(res.next()){
							String id = res.getString("id");
						
						
						%>

						<tr>
							<td><%=res.getString("flightId") %></td>
							<td><%=res.getString("flightName") %></td>
							<td><%=res.getString("startPoint") %></td>
							<td><%=res.getString("destinationPoint") %></td>
							<td><%=res.getString("seats_count") %></td>
							<td><%=res.getString("seat_price") %></td>
							<td><a href="editFlight.jsp?id=<%=id%>">Edit</a></td>
							<td><a href="deleteFlight.jsp?id=<%=id%>">Delete</a></td>
						</tr>

					<%} %>
						
					</thead>
				</table>
			</div>
		</div>
</div>
</div>




	<%
	}
	%>

	<%
	if (request.getParameter("add") != null) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		Connection con;
		// PreparedStatement pst;
		ResultSet rs;

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo", "root", "user");
		PreparedStatement pst = con.prepareStatement("insert into admins(name,email,mobile,password,role) values(?,?,?,?,?)");

		pst.setString(1, name);
		pst.setString(2, email);
		pst.setString(3, mobile);
		pst.setString(4, password);
		pst.setString(5, role);

		pst.executeUpdate();
	%>

	<script>
		alert("record added");
	</script>
	<%
	}
	%>

	<% 
					if(request.getParameter("submit")!=null){
						String flightId = request.getParameter("flightId");
						String flightName = request.getParameter("flightName");
						String startPoint = request.getParameter("startPoint");
						String destinationPoint = request.getParameter("destinationPoint");
						String seats_count = request.getParameter("seats_count");
						String seat_price = request.getParameter("seat_price");
						
							Connection connect;
					       // PreparedStatement pst;
					        ResultSet resu;
					        
					        Class.forName("com.mysql.cj.jdbc.Driver");
					        connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo","root","user");
					        
					        PreparedStatement pst = connect.prepareStatement("insert into flightDetails(flightId,flightName,startPoint,destinationPoint,seats_count,seat_price) values(?,?,?,?,?,?)");
					    
					        pst.setString(1,flightId);
					        pst.setString(2,flightName);
					        pst.setString(3,startPoint);
					        pst.setString(4,destinationPoint);
					        pst.setString(5,seats_count);
					       	pst.setString(6,seat_price); 
					        pst.executeUpdate();
						%>
						
						<script>
							alert("record added");
						</script>
					<% }%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>