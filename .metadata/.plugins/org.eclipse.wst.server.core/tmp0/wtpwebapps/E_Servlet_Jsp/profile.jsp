<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.om.connection.EstablishConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div style="width: 100%; height: 80px; background-color: navy; color: white; display: flex; justify-content: center; align-items: center;">
		<a style="color: white; text-decoration: none; font-size: 35px; margin-right: 20px;" href="login.jsp">Login</a>
		<a style="color: white; text-decoration: none; font-size: 35px;" href="register.jsp">Register</a style="color: white; text-decoration: none; font-size: 35px;">
		<a style="color: white; text-decoration: none; font-size: 35px;" href="logout">Logout</a style="color: white; text-decoration: none; font-size: 35px;">
	</div>
	
	<h1>PROFILE PAGE</h1>
	<%
		String email = (String) session.getAttribute("email");
	
		if (email != null) {
		    Connection con = EstablishConnection.getConnection();
		    
		    PreparedStatement pst = con.prepareStatement("select name from register where email = ?");
		    pst.setString(1, email);
		    
		    ResultSet rs = pst.executeQuery();
		    String name = "";
		    if (rs.next()) {
		        name = rs.getString("name");
	    }
	%>

	<div>
		<h1>WELCOME, <%= name %>!</h1>
		<h5>Name : <%= name %> </h5>
		<h5>Email : <%= email %> </h5>
	</div>

	<%
		} else {
		    response.sendRedirect("login.jsp");  // No session => force login
		}
	%>
</body>
</html>