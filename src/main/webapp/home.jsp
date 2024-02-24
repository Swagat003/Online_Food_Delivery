<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	HttpSession session1 = request.getSession(false);

	// Check if the session is not null and the username attribute is set
	if (session1 != null && session1.getAttribute("username") != null) {
		// Get the username from the session
		String username = (String) session1.getAttribute("username");
	%>
	home page
	<p>
		Welcome <strong> <%=username%>
		</strong>
	</p>
	<br>
	
	<%@ page import = "com.company.dao.FoodDao, com.company.dao.FoodList , java.util.ArrayList, java.util.List" %>
	
	<% 
	FoodDao food = new FoodDao();
	List<FoodList> rs = food.displayFood();
	for (FoodList f:rs){
	%>
		<h2><%=f.food_name %> <%=f.price %></h2>
		<h3><%=f.catagory %></h3><br>
	<%
	}
	%>
	
	
	<a href="LogoutServlet">LOGOUT</a>
	<%
	} else {
	// Redirect to the login page if the session is not valid
	response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>