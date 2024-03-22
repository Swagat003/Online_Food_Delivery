package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import com.company.model.User;
import com.company.util.DBUtil;

public class UserDaoImp  {

	public User isValidUser(String username, String password) {
		String query = "SELECT * FROM customer WHERE username = ? AND password = ?";
		User user = null;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);

			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				user = new User();
				user.setUsername(resultSet.getString("username"));
				user.setEmail(resultSet.getString("email"));
			}
//			return resultSet.next();
		} catch (SQLException e) {
			e.printStackTrace();
//			return false;
		}
		return user;
	}

	public boolean addUser(User user) {
		String query = "INSERT INTO customer (username, email, password) VALUES ( ? , ? , ? )";
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			
			String username = user.getUsername();
			String email = user.getEmail();
			String password = user.getPassword();
			
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, password);

			int rows = preparedStatement.executeUpdate();

			return rows>0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	

}
