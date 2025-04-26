<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div style="background-color: aqua; width: 60%; margin: auto; height: auto; padding: 100px; display: flex; justify-content: center;align-items: center;">
		<div style="margin: auto; ">
			<form action="loginForm" method="post">
				<h1 style="margin-top: 20px; margin-bottom: 20px; text-align: center;">Login Form</h1>
				<div style="margin-top: 17px;">
					<label for="email">Email : </label>
					<input type="text" id="email" name="email">
				</div>
				<div style="margin-top: 17px;">
					<label for="pass">Password : </label>
					<input type="password" id="pass" name="pass">
				</div>
				<div style="margin-top: 17px;">
					<input type="submit">
				</div>
			</form>
		</div>
	</div>
</body>
</html>