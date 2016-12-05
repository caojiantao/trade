package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.model.Order;

public interface IOrderService {

	public int addOrder(Order order);
	
	public List<Order> getAllOrders();
	
	public Order getOrderById(int id);
	
	public int updateOrder(Order order);
	
	public int deleteOrder(int id);
}
