<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pavo AirLines</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

 <% 
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
            
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            
            response.setHeader("Expires","0"); //Proxies
            
            
            if(session.getAttribute("user_email") == null){
            response.sendRedirect("login.jsp");
            }
        %>

</head>
<body>
	<div align="center">
	<h1>Welcome ${user_email} </h1>
	</div>
	
	<div class="container-fluid mt-5">
		<div class="row">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 mt-5"> 
				
				<div class="panel-body">
				<table id="tbl-admin" class="table table-responsive table-bordered" cellpadding="0" width="100%">
					<thead>
						<tr>
							<th scope="col">flightName</th>
							<th scope="col">startPoint</th>
							<th scope="col">DestinationPoint</th>
							<th scope="col">seats_count</th>
							<th scope="col">seat price</th>
							<th scope="col">Book</th>
							<th scope="col">Delete</th>
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
							
							<td><%=res.getString("flightName") %></td>
							<td><%=res.getString("startPoint") %></td>
							<td><%=res.getString("destinationPoint") %></td>
							<td><%=res.getString("seats_count") %></td>
							<td><%=res.getString("seat_price") %></td>
							<td><a href="#"><button>Book</button></a></td>
							<td><a href="#"><button>Remove</button></a></td>
						</tr>

					<%} %>
						
					</thead>
				</table>
			
			</div>
		</div>
	</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>