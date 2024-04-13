<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/checkout.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <title>Hunger</title>
</head>
<body>
<%
HttpSession session1 = request.getSession(false);

// Check if the session is not null and the username attribute is set
if (session1 != null && session1.getAttribute("username") != null) {
	// Get the username from the session
	String username = (String) session1.getAttribute("username");
	String orderID = request.getParameter("order-id");
	String amount = request.getParameter("amount");
	//double amount =  Double.parseDouble(request.getAttribute("total"));
%>

	<div id="header">
        <header>
            <div id="logo-menu">
                <img class="logo" src="images/LOGO.png" alt="Logo">
            </div>
            <nav>
                <h1 id="Home"><a href='home.jsp'><i class="ri-home-3-line"></i>Home</a></h1>
                <h1 id="About"> <i class="ri-information-line"></i>About</h1>
                <h1 id="Account">
                    <i class="ri-account-circle-line"></i><%=username%><i id="arrow-down" class="ri-arrow-down-s-fill"></i>
                    <div id="logout"><a href="LogoutServlet">LOGOUT</a></div>
                </h1>
            </nav>
        </header>
    </div>
    
    
    <div id="Order_confirm">
    	<img src="images/conformation_image.png" alt="Error" width="200px" height="200px">
    	<h1 id="text">ORDER CONFIRMED</h1>
        <br>
        <h1 id="O">Order id:</h1> <h1 style="font-size: 25px; font-family: 'Courier New', Courier, monospace;"><%=orderID %></h1>
        <h1 id="Or">Order ammout: </h1><h1 style="font-size: 25px; font-family: 'Courier New', Courier, monospace;">&#8377;<%=amount %></h1>
        <br>
        <h1 id="T">Thank you visit again :)</h1>
    </div>
    
    
	 <%
	} else {
	// Redirect to the login page if the session is not valid
	response.sendRedirect("login.jsp");
	}
	%>
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
    <script src="js/checkout.js"></script>
</body>
</html>