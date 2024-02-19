package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.dao.*;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static UserDao userdao = new UserDaoImp();
	
    public LoginServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (userdao.isValidUser(username,password)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("index.jsp");
		}
		else {
			response.sendRedirect("login.jsp?error=1");
		}
		
//		System.out.println("Username : "+username);
//		System.out.println("Password : "+password);
	}

}
