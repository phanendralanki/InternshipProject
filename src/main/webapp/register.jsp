<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>

<div class="container">
	<div class="row">
	<div class="col-sm-4">
	<form action="RegisterServlet" class="form" method="post">
		<div>
			<label class="form-label">name</label>
			<input type="text" name="user_name" placeholder="Enter your name" class="form-control" />
		</div>
		<div>
			<label class="form-label">email</label>
			<input type="email" name="user_email" placeholder="Enter your email" class="form-control" />
		</div>
		<div>
			<label class="form-label">mobile</label>
			<input type="text" name="mobile" placeholder="Enter your mobile" class="form-control" />
		</div>
		<div>
			<label class="form-label">password</label>
			<input type="password" name="user_password" placeholder="Enter your password" class="form-control" />
		</div>
		<div>
			<label class="form-label">confirm password</label>
			<input type="password" name="cpassword" placeholder="Confirm password" class="form-control" />
		</div>
		<div text-align="left" class="mt-3">
			<button type="submit" class="btn btn-primary">submit</button>
			<button type="reset" class="btn btn-danger">reset</button>
		</div>
		
	</form>
	</div>
	</div>
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>