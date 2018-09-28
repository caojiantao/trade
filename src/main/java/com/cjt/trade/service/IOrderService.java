package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.dto.OrderDto;
import com.cjt.trade.model.Order;
import com.cjt.trade.vo.OrderVo;

public interface IOrderService {

	public int addOrder(Order order);
	
	public List<OrderVo> getAllOrders(BaseDto dto);
	public int getAllOrdersCount();
	
	public Order getOrderById(int id);
	
	public int updateOrder(Order order);
	
	public int deleteOrder(int id);

	public List<Order> getMyOrders(OrderDto dto);

	int getMyOrdersCount(OrderDto dto);
}
