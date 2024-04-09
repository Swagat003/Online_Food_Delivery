<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.company.dao.* , java.util.ArrayList, java.util.List" %>
<%@page import="com.company.dao.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/home.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <title>HUNGER</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<%
	HttpSession session1 = request.getSession(false);
	
	// Check if the session is not null and the username attribute is set
	if (session1 != null && session1.getAttribute("username") != null) {
		// Get the username from the session
		String username = (String) session1.getAttribute("username");
		User auth = (User) request.getSession().getAttribute("auth");
		if (auth != null) {
		    request.setAttribute("person", auth);
		}
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
		if (cart_list != null) {
			request.setAttribute("cart_list", cart_list);
		}
	%>
	<div id="header">
        <header>
            <div id="logo-menu">
                <img class="logo" src="images/LOGO.png" alt="Logo">
                <h1 id="Menu">Menu <i class="ri-arrow-down-s-fill"></i>
                    <ul>
                        <li class="menu-list">Pizza</li>
                        <li class="menu-list">Burger</li>
                        <li class="menu-list">Biryani</li>
                        <li class="menu-list">Chinese</li>
                        <li class="menu-list">Dosa</li>
                        <li class="menu-list">Rolls</li>
                        <li class="menu-list">Salad</li>
                        <li class="menu-list">Cakes</li>
                        <li class="menu-list">Ice Creams</li>
                        <li class="menu-list">Shakes</li>
                    </ul>
                </h1>
            </div>
            <nav>
                <div id="search_bar">
                    <input type="search" id="searchField" placeholder="Search for foods">
                    <button id="searchBtn">
                        <i class="ri-search-line"></i>
                    </button>
                </div>
                <h1 id="About"> <i class="ri-information-line"></i>About</h1>
                <h1 id="Account">
                    <i class="ri-account-circle-line"></i><%=username%><i id="arrow-down" class="ri-arrow-down-s-fill"></i>
                    <div id="logout"><a href="LogoutServlet">LOGOUT</a></div>
                </h1>
                <h1 id="Cart"><i class="ri-shopping-cart-line"></i><a href="cart.jsp">Cart</a>
                	<% 
                	ArrayList<Cart> cart_list0 = (ArrayList<Cart>) session.getAttribute("cart-list");
            		if (cart_list0 != null && cart_list0.size() > 0 ) {
            			int noOfItemInCart = cart_list0.size();
            			request.setAttribute("noOfItemInCart",noOfItemInCart);
            		 %>
    				<div id="cart-item-no">${noOfItemInCart}</div>
					<% } %>

                </h1> 
            </nav>
        </header>
    </div>
	<main>
        <section id="categories">
            <h2 id="category-heading">Whats on your mind ?</h2>
            <div id="category-container">
                <div class="catagory-card" data-value="pizza" data-selected="false">
                    <img src="images/categories/Pizza.png" alt="ERROR">
                    <p class="catagory-name">Pizza</p>
                </div>
                <div class="catagory-card" data-value="burger" data-selected="false">
                    <img src="images/categories/Burger.png" alt="ERROR">
                    <p class="catagory-name">Burger</p>
                </div>
                <div class="catagory-card" data-value="biryani" data-selected="false">
                    <img src="images/categories/Biryani.png" alt="ERROR">
                    <p class="catagory-name">Biryani</p>
                </div>
                <div class="catagory-card" data-value="chinese" data-selected="false">
                    <img src="images/categories/Chinese.png" alt="ERROR">
                    <p class="catagory-name">Chinese</p>
                </div>
                <div class="catagory-card" data-value="dosa" data-selected="false">
                    <img src="images/categories/Dosa.png" alt="ERROR">
                    <p class="catagory-name">Dosa</p>
                </div>
                <div class="catagory-card" data-value="rolls" data-selected="false">
                    <img src="images/categories/Rolls.png" alt="ERROR">
                    <p class="catagory-name">Rolls</p>
                </div>
                <div class="catagory-card" data-value="salad" data-selected="false">
                    <img src="images/categories/Salad.png" alt="ERROR">
                    <p class="catagory-name">Salad</p>
                </div>
                <div class="catagory-card" data-value="cakes" data-selected="false">
                    <img src="images/categories/Cakes.png" alt="ERROR">
                    <p class="catagory-name">Cakes</p>
                </div>
                <div class="catagory-card" data-value="ice creams" data-selected="false">
                    <img src="images/categories/Ice_Creams.png" alt="ERROR">
                    <p class="catagory-name">Ice Creams</p>
                </div>
                <div class="catagory-card" data-value="shakes" data-selected="false">
                    <img src="images/categories/Shakes.png" alt="ERROR">
                    <p class="catagory-name">Shakes</p>
                </div>
            </div>
        </section>
        <hr>
        <section id="food-section">
            <h2 id="food-section-heading">Your cravings are here !</h2>
            <br>
            <br>
            <div id="food-container">
				
				<% 
				FoodDao food = new FoodDao();
				List<FoodList> rs = food.displayFood();;

				for (FoodList f:rs){
				%>
				
				<div class="food-card">
                    <img class="food-card-img" src="images/food_images/<%=f.food_id %>.png" alt="ERROR">
                    <div class="food-card-text">
                        <div class="food-card-text-left">
                            <p class="food-card-heading"><%=f.food_name %></p>
                            <p class="food-card-price"> &#8377;<%=f.price %>/- <span>&#8377; <%=f.price+119 %>/-</span></p>
                        </div>
                        <div class="food-card-text-right">
                        	<a href='AddToCartServlet?id=<%=f.food_id %>'>
                            	<button class="food-card-button" data-food_id='<%=f.food_id %>'>ADD</button>
                            </a>
                        </div>
                    </div>
                </div>
				<%
				}
				%>
                
            </div>
        </section>
    </main>
	
	<footer>
        <div id="footer-left">
            <div id="footer-left-heading">
                <img class="logo" src="images/LOGO.png" alt="Error">
                <h1>Hunger</h1>
            </div>
            <p>"Hunger" is a dynamic food ordering website revolutionizing
                the culinary experience. Seamlessly connecting users with a
                myriad of gastronomic delights, it offers a user-friendly interface,
                real-time updates, and diverse culinary options. With its intuitive
                design and efficient service, Hunger promises to satisfy cravings
                and elevate dining experiences with just a few clicks.
            </p>
        </div>
        <div id="footer-center">
            <h2 class="footer-headings">CONTACT</h2>
            <p>About Us</p>
            <p>Service</p>
            <p>Get In Touch</p>
        </div>
        <div id="footer-right">
            <h2 class="footer-headings">FOLLOW US</h2>
            <div id="social-media">
                <i class="ri-facebook-fill"></i>
                <i class="ri-instagram-fill"></i>
                <i class="ri-twitter-fill"></i>
                <i class="ri-linkedin-fill"></i>
            </div>
        </div>
    </footer>
    <%
	} else {
	// Redirect to the login page if the session is not valid
	response.sendRedirect("login.jsp");
	}
	%>
	<script type="text/javascript" src="js/home.js"></script>
	<!-- <script type="text/javascript" src="js/addToCart.js"></script>  -->
</body>
</html>