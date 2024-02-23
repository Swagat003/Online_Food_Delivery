<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up page</title>
</head>
<body>
	<form action="SignupServlet" method="post">
		<label for="username">Username : </label> <input type="text"
			id="username" name="username" required><br> <label
			for="email">Email : </label> <input type="email" id="email"
			name="email" required><br> <label for="password">Password
			: </label> <input type="password" id="password" name="password" required><br>
		<button type="submit">Sign up</button>
	</form>
	<%
	String error = request.getParameter("error");
	if (error != null && error.equals("1")) {
	%>
	<p>Username already exist!</p>
	<%
	}
	%>
</body>
</html>