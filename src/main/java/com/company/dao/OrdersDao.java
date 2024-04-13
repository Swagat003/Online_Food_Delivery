package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.company.util.DBUtil;

public class OrdersDao {
	public int insertOrderandGetID(Orders model) {
		String query = "INSERT INTO orders (o_date, u_id, qty, amount) VALUES ( ? , ? , ? , ? )";
		int lastOrderId = 0;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			
			String date = model.getDate();
			String uId = model.getUid();
			int qty = model.getQunatity();
			double amount = model.getAmount();
			
			preparedStatement.setString(1, date);
			preparedStatement.setString(2, uId);
			preparedStatement.setInt(3, qty);
			preparedStatement.setDouble(4, amount);

			int rows = preparedStatement.executeUpdate();
			
			query = "SELECT LAST_INSERT_ID() as last_id";
			PreparedStatement pst = connection.prepareStatement(query);
			ResultSet resultSet = pst.executeQuery();
	        
	        if (resultSet.next()) {
	            lastOrderId = resultSet.getInt("last_id");
	            System.out.println("Last inserted order ID: " + lastOrderId);
	        } else {
	            System.out.println("No last inserted order ID found.");
	        }

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lastOrderId;
	}

}
