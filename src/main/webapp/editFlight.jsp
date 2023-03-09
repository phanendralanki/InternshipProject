<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update flight Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-lg-4">
				<form action="#" method="POST" class="">
				<%
				Connection connection;
				PreparedStatement prepare;
				ResultSet res;

				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo", "root", "user");

				String id = request.getParameter("id");
				prepare = connection.prepareStatement("select *from flightDetails where id=?");
				prepare.setString(1, id);

				res = prepare.executeQuery();

				while (res.next()) {
				%>
					<div align="left">
						<label class="form-label">Flight Id:</label> <input type="text"
							class="form-control" placeholder="flight Id" name="flightId"
							id="flightId" value="<%=res.getString("flightId")%>" />
					</div>

					<div align="left">
						<label class="form-label">Flight Name: </label> <input type="text"
							class="form-control" placeholder="Flight Name" name="flightName"
							id="flightName" value="<%=res.getString("flightName")%>" />
					</div>

					<div align="left">
						<label class="form-label">Start point</label> <input type="text"
							class="form-control" placeholder="start point" name="startPoint"
							id="startPoint" value="<%=res.getString("startPoint")%>" />
					</div>
					<div align="left">
						<label class="form-label">Destination point</label> <input
							type="text" class="form-control" placeholder="Destination Point"
							name="destinationPoint" id="destinationPoint" value="<%=res.getString("DestinationPoint")%>" />
					</div>
					<div align="left">
						<label class="form-label">Seats</label> <input type="text"
							class="form-control" placeholder="Enter no of seats"
							name="seats_count" id="seats_count" value="<%=res.getString("seats_count")%>" />
					</div>
					<div align="left">
						<label class="form-label">Seat Price</label> <input type="text"
							class="form-control" placeholder="Enter seat price"
							name="seat_price" id="seat_price" value="<%=res.getString("seat_price")%>"/>
					</div>
					<%
				}
				%>
					<br />
					<div align="right">
						<input type="submit" id="submit" value="update" name="submit"
							class="btn btn-info"> <input type="reset" id="reset"
							value="reset" name="reset" class="btn btn-warning" />
					</div>

				</form>
			</div>
			
			<div>
				<a href="MainAdmin.jsp">Go Back</a>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>


	<%
	if (request.getParameter("submit") != null) {
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
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo", "root", "user");
		
		PreparedStatement pst = con.prepareStatement("update flightDetails set flightId=?, flightName=?,startPoint=?,destinationPoint=?,seats_count=?,seat_price=? where id=? ");
		
		pst.setString(1, flightId);
		pst.setString(2, flightName);
		pst.setString(3, startPoint);
		pst.setString(4, destinationPoint);
		pst.setString(5, seats_count);
		pst.setString(6, seat_price);
		pst.setString(7,id);
		pst.executeUpdate();
	%>

	<script>
		alert("record added");
	</script>
	<%
	}
	%>

</body>
</html>