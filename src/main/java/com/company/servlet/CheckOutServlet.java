package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.company.dao.Cart;
import com.company.dao.Orders;
import com.company.dao.OrdersDao;
import com.company.dao.User;


public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date(System.currentTimeMillis());
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			double amount = Double.parseDouble(request.getParameter("amount")) ;
			System.out.println(amount);
			if(cart_list != null && auth!=null) {
				int orderID = 0;
				int qty = cart_list.size();
				Orders order = new Orders();
				order.setUid(auth.getUsername());
				order.setQunatity(qty);
				order.setAmount(amount);
				order.setDate(formatter.format(date));
				
				OrdersDao oDao = new OrdersDao();
				orderID = oDao.insertOrderandGetID(order);
				if(orderID>0) {
					System.out.println(orderID);
				}
				cart_list.clear();
				response.sendRedirect("checkout.jsp?order-id="+orderID+"&amount="+amount);
			}else {
				if(auth==null) {
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("cart.jsp");
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
