package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.model.Order;

@Repository
public interface IOrderDao {
	
	public int insertOrder(Order order);

	public List<Order> getAllOrders();
	
	public Order getOrderById(int id);
	
	public int updateOrder(Order order);
	
	public int deleteOrder(int id);
}