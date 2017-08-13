package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Order;
import com.cjt.trade.vo.OrderVo;

public interface IOrderDao {

  int insertOrder(Order order);

  List<OrderVo> getAllOrders(BaseDto dto);

  int getAllOrdersCount();

  Order getOrderById(int id);

  int updateOrder(Order order);

  int deleteOrder(int id);
}