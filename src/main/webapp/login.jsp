<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
</head>
<body>
	<form action="LoginServlet" method="post">
		<label for="username">Username : </label> <input type="text"
			id="username" name="username" required><br> <label
			for="password">Password : </label> <input type="password"
			id="password" name="password" required><br>
		<button type="submit">Login</button>
	</form>
	<%
	String error = request.getParameter("error");
	if (error != null && error.equals("1")) {
	%>
	<p style="color: red;">Invalid username or password</p>
	<%
	}
	%>
	
	<%
	String rs = request.getParameter("registration");
	if (rs != null && rs.equals("success")) {
	%>
	<p style="color: green;">Your registration is successful. Please login.</p>
	<%
	}
	%>
</body>
</html>