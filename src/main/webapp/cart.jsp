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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Cart</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
</head>
<body>

	<div class="container my-3">
		<%
			if (cart_list != null && cart_list.size()>0) {
		%>
		<div class="d-flex py-3">
			<h3>Item Price: &#8377; ${totalItem} </h3>
		</div>
		<div class="d-flex py-3">
			<h3>Platform Fees: &#8377; ${platformFess} </h3>
		</div>
		<div class="d-flex py-3">
			<h3>Gst: &#8377; ${gst} </h3>
		</div>
		<div class="d-flex py-3">
			<h3>Total Price: &#8377; ${total} </h3> 
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.food_name %></td>
					<td><%=c.catagory%></td>
					<td><%= dcf.format(c.price)%></td>
					<td>
						<input type="hidden" name="id" value="<%= c.food_id%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="QuantityIncDecServlet?action=inc&id=<%=c.food_id%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="QuantityIncDecServlet?action=dec&id=<%=c.food_id%>"><i class="fas fa-minus-square"></i></a>
							</div>
					</td>
					<td><a href="RemoveFromCartServlet?id=<%=c.food_id %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}%>
			</tbody>
		</table>
		<%
		}else{%>
			<h1>Cart is Empty!</h1>
		<%	
		}%>
	</div>
	 <%
	} else {
	// Redirect to the login page if the session is not valid
	response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>