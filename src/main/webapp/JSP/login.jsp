<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String msg = (String) session.getAttribute("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
.login-btn {
	margin-top: 15px;
	background-color: blue;
	color: white;
	text-align: center;
	font-weight: 700;
	border: none;
	border-radius: 7px;
	width: 60px;
	height: 36px;
	cursor: pointer;
	text-align: center;
	justify-content: center;
	transition: opacity 2s, box-shadow 1s;
}

.login-btn:hover {
	opacity: 0.6;
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.15);
}

.loging-btn:active {
	opacity: 0.3;
}

.error-msg {
	color: red;
	font-weight: bold;
}
</style>

</head>
<body>

	<div>
		<%@include file="header.jsp" %>
	</div>
	
	<div class="container mt-1">
		<div class="row">
			<div class="text:center">
				<h3>Login Here</h3>
				<%
				if (msg == null) {
					msg = "";
				}
				%>


				<p class="error-msg" style="text-align: center"><%=msg%></p>

			</div>
			<div class="col-sm-4">
				<form action="LoginServlet" class="form" method="post">
					<div>
						<label class="form-label">Email</label> <input type="text"
							name="user_email" placeholder="enter your email"
							class="form-control" />
					</div>
					<div>
						<label class="form-label">password</label> <input type="password"
							name="user_password" placeholder="enter your password"
							class="form-control" />
					</div>

					<div>
						<button class="login-btn">Login</button>
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