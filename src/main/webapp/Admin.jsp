<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<%
				if (Admin != null) {
				%>
				<!--form-->
				<form action="#" method="POST" class="">

					<div align="left">
						<label class="form-label">Admin Name</label> <input type="text"
							class="form-control" placeholder="Admin Name" name="name"
							id="name" required />
					</div>

					<div align="left">
						<label class="form-label">Email</label> <input type="text"
							class="form-control" placeholder="Email" name="course"
							id="course" required />
					</div>

					<div align="left">
						<label class="form-label">Mobile</label> <input type="text"
							class="form-control" placeholder="Enter your number" name="fee"
							id="fee" required />
					</div>
					<div align="left">
						<label class="form-label">Password</label> <input type="text"
							class="form-control" placeholder="Enter your password" name="fee"
							id="fee" required />
					</div>
					<div align="left">
						<label class="form-label">Role</label> <input type="text"
							class="form-control" placeholder="Enter your role" name="fee"
							id="fee" required />
					</div>
					<br />
					<div align="right">
						<input type="button" id="add" value="add" name="add"
							class="btn btn-info"> <input type="reset" id="reset"
							value="reset" name="reset" class="btn btn-warning">

					</div>

				</form>
				<%
				} else {
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
							id="fee" required />
					</div>
					<div align="left">
						<label class="form-label">Destination point</label> <input type="text"
							class="form-control" placeholder="Destination Point" name="destinationPoint"
							id="destinationPoint" required />
					</div>
					<div align="left">
						<label class="form-label">Seats</label> <input type="text"
							class="form-control" placeholder="Enter no of seats" name="seats_count"
							id="seats_count" required />
					</div>
					<div align="left">
						<label class="form-label">Seat Price</label> <input type="text"
							class="form-control" placeholder="Enter seat price" name="seat_price"
							id="seat_price" required />
					</div>
					
					<br />
					<div align="right">
						<input type="button" id="add" value="add" name="add"
							class="btn btn-info"> <input type="reset" id="reset"
							value="reset" name="reset" class="btn btn-warning">

					</div>

				</form>
				<%
				}
				%>
			</div>
		</div>
	</div>


	<script src="MyCode/js/bootstrap.min.js"></script>
</body>
</html>