package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.util.DBUtil;

public class CartDao {
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) throws SQLException {
		String query = "SELECT * FROM food WHERE food_id = ?";
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			List<Cart> products = new ArrayList<Cart>();

			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					preparedStatement.setInt(1, item.food_id);
					ResultSet resultSet = preparedStatement.executeQuery();
					while (resultSet.next()) {

						Cart temp = new Cart();
						temp.food_id = resultSet.getInt(1);
						temp.food_name = resultSet.getString(2);
						temp.catagory = resultSet.getString(4);
						temp.price = resultSet.getDouble(3) * item.getQuantity();
						temp.setQuantity(item.getQuantity());

						products.add(temp);
					}
				}
			}

			return products;
		}
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		if (cartList.size() > 0) {
			for (Cart item : cartList) {
				sum += item.price;

			}

		}
		return sum;
	}
}
