<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.company.dao.* , java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/home.css">

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
	 <input type='text' id="searchField" placeholder="Search your food..."> <button id="searchBtn">search</button><br><br>
	<div>
		<button class="catagoryBtn" data-value="pizza" data-selected="false">Pizza</button>
		<button class="catagoryBtn" data-value="burger" data-selected="false">Burger</button>
		<button class="catagoryBtn" data-value="biriyani" data-selected="false">Biriyani</button>
	</div>
	<div id='food-container'>
	<% 
	FoodDao food = new FoodDao();
	List<FoodList> rs = food.displayFood();;

	for (FoodList f:rs){
	%>
	<div class='food-item'>
		<h2><%=f.food_name %><br> <%=f.price %></h2>
		<h3><%=f.catagory %></h3><br>
	</div>
	<%
	}
	%>
	
	</div>
	
	<a href="LogoutServlet">LOGOUT</a>
	<%
	} else {
	// Redirect to the login page if the session is not valid
	response.sendRedirect("login.jsp");
	}
	%>
	<script type="text/javascript" src="js/home.js"></script>
</body>
</html>