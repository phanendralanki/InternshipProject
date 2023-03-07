<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>


<%
	if (request.getParameter("add") != null) {
		String id = request.getParameter("id");
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
		PreparedStatement pst = con.prepareStatement("update admins set name=?,email=?,mobile=?,password=?,role=? where id=?");

		pst.setString(1, name);
		pst.setString(2, email);
		pst.setString(3, mobile);
		pst.setString(4, password);
		pst.setString(5, role);
		pst.setString(6,id);

		pst.executeUpdate();
	%>

	<script>
		alert("record updated");
	</script>
	<%
	}
	%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="row">
		<div class="col-sm-4">
			<form action="#" method="POST" class="">

				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;

				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pavo", "root", "user");

				String id = request.getParameter("id");
				pst = con.prepareStatement("select *from admins where id=?");
				pst.setString(1, id);

				rs = pst.executeQuery();

				while (rs.next()) {
				%>
				<div align="left">
					<label class="form-label">Admin name: </label> <input type="text"
						class="form-control" placeholder="Admin name" name="name"
						id="name" required autocomplete="off" value="<%= rs.getString("name") %> "/>
				</div>

				<div align="left">
					<label class="form-label">Admin Email: </label> <input type="text"
						class="form-control" placeholder="Email" name="email" id="email"
						required autocomplete="off" value="<%= rs.getString("email") %> " />
				</div>

				<div align="left">
					<label class="form-label">Mobile:</label> <input type="text"
						class="form-control" placeholder="Mobile" name="mobile"
						id="startPoint" required autocomplete="off" value="<%= rs.getString("mobile") %> " />
				</div>
				<div align="left">
					<label class="form-label">Password:</label> <input type="text"
						class="form-control" placeholder="password" name="password"
						id="password" required autocomplete="off"
						value="<%=rs.getString("password")%> " />
				</div>
				<div align="left">
					<label class="form-label">role:</label> <input type="text"
						class="form-control" placeholder="Enter role" name="role"
						id="role" required autocomplete="off"
						value="<%=rs.getString("role")%> " />
				</div>
				<%
				}
				%>
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
			<div align="right mt-3" >
				<p><a href="MainAdmin.jsp">Click back</a></p>
			</div>
		</div>
	</div>

	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>