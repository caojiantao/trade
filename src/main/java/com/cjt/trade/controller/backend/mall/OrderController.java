package com.cjt.trade.controller.backend.mall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.cjt.trade.dto.ResultDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.model.Order;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IOrderService;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.OrderVo;

@Controller
@RequestMapping(value = "/backend/")
public class OrderController extends BaseController {

	@Resource
	private IOrderService orderService;
	
	@Resource
	private IGoodsService goodsService;

	@RequestMapping(value = "/orderList.action")
	public String orderList() {
		return "backend/mall/orderList";
	}

	@RequestMapping(value = "getAllOrders.action")
	@ResponseBody
	public JSONObject getAllOrders(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<OrderVo> orders = orderService.getAllOrders(dto);
		int count = orderService.getAllOrdersCount();
		return JSONUtil.toGridJson(orders, count);
	}

	@RequestMapping(value = "addOrder.action")
	public String addOrder(Order order, Model model) {
		Integer id = order.getId();
		int lines = 0;
		if (id == null || id == 0) {
			// 新增
			lines = orderService.addOrder(order);
			if (lines > 0) {
				model.addAttribute("returnUrl", "orderAdd.action");
				return "success";
			}
		} else {
			// 更新
			lines = orderService.updateOrder(order);
			if (lines > 0) {
				return orderList();
			}
		}
		return "ERROR";
	}

	@RequestMapping(value = "orderAdd.action")
	public String orderAdd() {
		return "backend/mall/orderAdd";
	}

	@RequestMapping(value = "getOrderDetailById.action")
	@ResponseBody
	public Order getOrderDetailById(int id) {
		Order order = orderService.getOrderById(id);
		JSONArray orderDetail = JSONArray.parseArray(order.getGoodsJson());
		List<Object> goodsJson = new ArrayList<Object>();
		for (int i = 0; i < orderDetail.size(); i++) {
			Map<String, Object> goodsMap = new HashMap<String, Object>();
			JSONObject obj =  orderDetail.getJSONObject(i);
			String count = obj.getString("count");
			String goodsid = obj.getString("goodsId");
			
			goodsMap.put("count", count);
			Goods goods = goodsService.getGoodsById(Integer.parseInt(goodsid));
			goodsMap.put("logoUrl",goods.getLogoUrl());
			goodsMap.put("price", goods.getPrice());
			goodsMap.put("productName", goods.getProductName());
			goodsMap.put("id", goods.getId());
			goodsJson.add(goodsMap);
		}
		order.setGoodsJson(JSONArray.toJSONString(goodsJson));
		return order;

	}

	@RequestMapping(value = "deleteOrderById.action")
	@ResponseBody
	public ResultDTO deleteOrderById(int id) {
		int lines = orderService.deleteOrder(id);
		return lines > 0 ? success() : failed("删除失败");
	}
}
