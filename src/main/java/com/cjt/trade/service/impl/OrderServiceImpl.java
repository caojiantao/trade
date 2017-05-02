package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IOrderDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Order;
import com.cjt.trade.service.IOrderService;
import com.cjt.trade.vo.OrderVo;

@Service
public class OrderServiceImpl implements IOrderService{

	@Resource
	private IOrderDao orderDao;
	
	@Override
	public int addOrder(Order order) {
		return orderDao.insertOrder(order);
	}

	@Override
	public Order getOrderById(int id) {
		return orderDao.getOrderById(id);
	}

	@Override
	public int updateOrder(Order order) {
		return orderDao.updateOrder(order);
	}

	@Override
	public int deleteOrder(int id) {
		return orderDao.deleteOrder(id);
	}

	@Override
	public List<OrderVo> getAllOrders(BaseDto dto) {
		return orderDao.getAllOrders(dto);
	}

	@Override
	public int getAllOrdersCount() {
		return orderDao.getAllOrdersCount();
	}
}
