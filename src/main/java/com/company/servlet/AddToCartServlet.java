package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.company.dao.Cart;


public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartlist = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("id"));
//			System.out.println(id);
			Cart temp = new Cart();
			temp.food_id=id;
			temp.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if (cart_list == null) {
				cartlist.add(temp);
				session.setAttribute("cart-list", cartlist);
//				out.println("session created and added");
//				out.println(temp.food_id);
//				System.out.println(temp.food_id);
				response.sendRedirect("home.jsp");
			}else {
				cartlist=cart_list;
				boolean exist = false;
				for(Cart c:cartlist) {
					if(c.food_id==id) {
						exist=true;
						out.println("<h3 style='color:red; text-align:center'>Item already exist in cart. <a href='home.jsp'> Go back..</a></h3>");
					}
				}
				if(!exist){
					cartlist.add(temp);
					response.sendRedirect("home.jsp");
//					out.println("product added");
				}
			}
//			for (Cart ct:cart_list) {
//				out.println(ct.food_id);
//				System.out.println(ct.food_id);
//			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
