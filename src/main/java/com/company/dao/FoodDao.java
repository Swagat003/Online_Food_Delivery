package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.util.DBUtil;

public class FoodDao {
	
	public List<FoodList> displayFood() throws SQLException {
		String query = "SELECT * FROM food";
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			ResultSet resultSet = preparedStatement.executeQuery();
						
			List<FoodList> foodList = new ArrayList<FoodList>();
			
			while(resultSet.next()) {
				FoodList temp = new FoodList();
				temp.food_id= resultSet.getInt(1);
				temp.food_name= resultSet.getString(2);
				temp.price= resultSet.getDouble(3);
				temp.catagory= resultSet.getString(4);
				
				foodList.add(temp);
			}
			
			return foodList;
		}
	}
	
	public List<FoodList> displayFoodByCatagory(String catagory) throws SQLException{
		String query = "SELECT * FROM food WHERE catagory = ?";
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			
			preparedStatement.setString(1, catagory);

			ResultSet resultSet = preparedStatement.executeQuery();
						
			List<FoodList> foodList = new ArrayList<FoodList>();
			
			while(resultSet.next()) {
				FoodList temp = new FoodList();
				temp.food_id= resultSet.getInt(1);
				temp.food_name= resultSet.getString(2);
				temp.price= resultSet.getDouble(3);
				temp.catagory= resultSet.getString(4);
				
				foodList.add(temp);
			}
			
			return foodList;
		}
	}

	public List<FoodList> searchFood(String searchedValue) throws SQLException {
		String query = "SELECT * FROM food WHERE food_name = ? OR catagory = ? OR LOWER(food_name) LIKE LOWER(?) OR price = ?";
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			
			preparedStatement.setString(1, searchedValue);
			preparedStatement.setString(2, searchedValue);
			preparedStatement.setString(3, "%"+searchedValue+"%");
			preparedStatement.setString(4, searchedValue);

			ResultSet resultSet = preparedStatement.executeQuery();
						
			List<FoodList> foodList = new ArrayList<FoodList>();
			
			while(resultSet.next()) {
				FoodList temp = new FoodList();
				temp.food_id= resultSet.getInt(1);
				temp.food_name= resultSet.getString(2);
				temp.price= resultSet.getDouble(3);
				temp.catagory= resultSet.getString(4);
				
				foodList.add(temp);
			}
			
			return foodList;
		}
	}
	
}
