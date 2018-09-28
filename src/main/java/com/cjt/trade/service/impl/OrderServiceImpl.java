package com.cjt.trade.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.dao.IGoodsDao;
import com.cjt.trade.dto.OrderDto;
import com.cjt.trade.model.Goods;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IOrderDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Order;
import com.cjt.trade.service.IOrderService;
import com.cjt.trade.vo.OrderVo;
import org.springframework.util.StringUtils;

@Service
public class OrderServiceImpl implements IOrderService{

	@Resource
	private IOrderDao orderDao;

	@Resource
	private IGoodsDao iGoodsDao;

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
	public List<Order> getMyOrders(OrderDto dto) {
		try{
			List<Order> orders = orderDao.getMyOrders(dto);
			for(Order order : orders){
				if(!StringUtils.isEmpty(order.getGoodsJson())){
					List<JSONObject> list = new ArrayList<JSONObject>();
					String goods = order.getGoodsJson();
					JSONArray goodsArr = JSONArray.parseArray(goods);
					for(int i=0; i<goodsArr.size(); i++){
						JSONObject good = goodsArr.getJSONObject(i);
						Integer count = good.getIntValue("count");
						Goods g = iGoodsDao.getGoodsById(Integer.parseInt(good.getString("goodsId")));
						String buyPrice = good.getString("buyPrice");

						good.put("totalPrice", StringUtils.isEmpty(buyPrice)?g.getPrice():Double.parseDouble(buyPrice));

						good.putAll(BeanUtils.describe(g));
						list.add(good);
					}
					order.setGoodsList(list);
				}
			}
			return orders;
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getMyOrdersCount(OrderDto dto) {
		return orderDao.getMyOrdersCount(dto);
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
