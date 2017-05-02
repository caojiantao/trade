package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Order;
import com.cjt.trade.vo.OrderVo;

@Repository
public interface IOrderDao {
	
	public int insertOrder(Order order);

	public List<OrderVo> getAllOrders(BaseDto dto);
	public int getAllOrdersCount();
	
	public Order getOrderById(int id);
	
	public int updateOrder(Order order);
	
	public int deleteOrder(int id);
}