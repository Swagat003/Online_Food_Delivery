<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.company.dao.*"%>
<%@page import="com.company.util.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	CartDao pDao = new CartDao();
	cartProduct = pDao.getCartProducts(cart_list);
	double sum = 0;
	if (cartProduct.size() > 0) {
		for (Cart item : cartProduct) {
			sum += item.price;
		}
	}	
	//double total = pDao.getTotalCartPrice(cart_list);
	double totalItem = Double.parseDouble(dcf.format(sum));
	double platformFess = 19.0;
	double gst = Double.parseDouble(dcf.format((totalItem + platformFess)*0.18));
	double total = Double.parseDouble(dcf.format(totalItem + platformFess + gst));
	request.setAttribute("totalItem",totalItem );
	request.setAttribute("platformFess",platformFess );
	request.setAttribute("gst",gst );
	request.setAttribute("total",total );
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<link rel="stylesheet" href="css/Cart.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
    <title>HUNGER</title>
</head>
<body>
<%
HttpSession session1 = request.getSession(false);

// Check if the session is not null and the username attribute is set
if (session1 != null && session1.getAttribute("username") != null) {
	// Get the username from the session
	String username = (String) session1.getAttribute("username");

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
    <%
		}if (cart_list != null && cart_list.size()>0) {
	%>
    <div id="cart">
        <div id="food_items">
            <table>
            	<%
					for (Cart c : cartProduct) {
				%>
                <tr class="cart-list">
                    <td class="cart-list-remove"><a href="RemoveFromCartServlet?id=<%=c.food_id %>" class=""><i class="ri-close-circle-line"></i></a></td>
                    <td class="cart-list-name"><%=c.food_name %></td>
                    <td>
                        <input type="hidden" name="id" value="<%= c.food_id%>" class="form-input">
                        <div class="cart-list-qty">
                            <a class="cart-list-inc" href="QuantityIncDecServlet?action=inc&id=<%=c.food_id%>"><i class="ri-add-line"></i></a>
                            <input type="text" name="quantity" class="form-control" value="<%=c.getQuantity()%>" readonly>
                            <a class="cart-list-dec" href="QuantityIncDecServlet?action=dec&id=<%=c.food_id%>"><i class="ri-subtract-line"></i></a>
                        </div>
                    </td>
                    <td class="cart-list-price">&#8377;<%= dcf.format(c.price)%>/-</td>
                </tr>
                <%
				}
				%>
            </table>
        </div>
        <div id="pricing">
            <div id="pricing-text">
                <h1>Item Total</h1>
                <h1>&#8377;${totalItem}/-</h1>
                <h1>Plartform Fee</h1>
                <h1>&#8377;${platformFess}/-</h1>
                <h1>GST and Resturant Charges</h1>
                <h1>&#8377;${gst}/-</h1>
                <h1 class="toPay">To pay</h1>
                <h1 class="toPay">&#8377;${total}/-</h1>
            </div>
            <div id="pricing-btn">
            <a href="CheckOutServlet?amount=${total}">
                <button id="checkout">
                    PLACE ORDER
                </button>
            </a>
            </div>
        </div>
    </div>
    <%
	}else{
	%>
		<div id="cart_img">
        <img src="images/Cart_image.png" alt="Error">
        <div id="text">
            <h1 id="ECh1">Your cart is empty</h1>
            <br>
            <h1 id="ECh2">Looks like you havenot added anything to your cart</h1>
            <h1 id="ECh3">go and explore top catagories.</h1>
        </div>
    	</div>
	<%	
	}%>
	
	
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
    <script src="js/cart.js"></script>
</body>
</html>