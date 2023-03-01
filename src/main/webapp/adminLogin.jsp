<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" href="MyCode/css/bootstrap.min.css">

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<form class="form-control" action="AdminLoginServlet" method="post">
					<div>
						<label class="form-label">Email:</label> <input type="text"
							class="form-control" name="email" />
					</div>
					<div>
						<label class="form-label">password:</label> <input type="password"
							class="form-control" name="password" />
					</div>
					<div class="align-right mt-3">
						<input type="submit" value="submit" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>


	<script src="MyCode/js/bootstrap.min.js"></script>
</body>
</html>