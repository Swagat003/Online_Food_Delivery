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
			String catagoryData = request.getParameter("value");
			String selected = request.getParameter("selected");
			List<FoodList> foods=new ArrayList<FoodList>();
			if(selected.equals("0")) {				
				foods = fooddao.displayFoodByCatagory(catagoryData);
			}else {
				foods = fooddao.displayFood();
			}
			String htmlBlock = new String();
			for(FoodList f:foods) {
				String id = String.valueOf(f.food_id);
				String name = String.valueOf(f.food_name);
				String price = String.valueOf(f.price);
				String catagory = String.valueOf(f.catagory);
				
				String div = "<div class='food-item'><h2>"+name+"<br> "+price+"</h2><h3>"+catagory+"</h3><br></div>";
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
