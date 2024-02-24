package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.dao.User;
import com.company.dao.UserDaoImp;


public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDaoImp userdao = new UserDaoImp();
       
   
    public SignupServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		
		if (userdao.addUser(user)) {
			response.sendRedirect("login.jsp?registration=success");
		}
		else {
			response.sendRedirect("signup.jsp?error=1");
		}
	}

}
