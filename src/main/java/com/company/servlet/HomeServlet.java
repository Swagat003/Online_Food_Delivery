package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.dao.FoodDao;
import com.company.dao.FoodList;


public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static FoodDao fooddao = new FoodDao();
       

    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String data = request.getParameter("value");
			String isSelected = request.getParameter("selected");
			System.out.println(isSelected);
			System.out.println(data);
			List<FoodList> foods=new ArrayList<FoodList>();
			if(isSelected.equals("false")) {				
				foods = fooddao.displayFoodByCatagory(data);
			}else if(isSelected.equals("searched")) {				
				foods = fooddao.searchFood(data);
			}else {
				foods = fooddao.displayFood();
			}
			String htmlBlock = new String();
			for(FoodList f:foods) {
				String id = String.valueOf(f.food_id);
				String name = String.valueOf(f.food_name);
				String price = String.valueOf(f.price);
				String catagory = String.valueOf(f.catagory);
				
				String div = "<div class='food-item'>"
						+ "<h2>"+name+"<br> "
						+price+"</h2>"
								+ "<h3>"+catagory+""
										+"<a href='AddToCartServlet?id="+id+"'>"
										+ "<button id='addBtn' data-food_id='"+id+"'>Add to cart</button>"
										+"</a>"
								+ "</h3>"
						+ "</div>";
				htmlBlock += div ;
			}
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println(htmlBlock);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
