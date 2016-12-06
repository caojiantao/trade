package com.cjt.trade.controller.backend.mall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Order;
import com.cjt.trade.service.IOrderService;

@Controller
@RequestMapping(value = "/backend/")
public class EMSController extends BaseController {

	@Resource
	private IOrderService orderService;

	@RequestMapping(value = "/orderList.action")
	public String orderList() {
		return "backend/mall/orderList";
	}

	@RequestMapping(value = "getAllOrders.action")
	@ResponseBody
	public String getAllOrders() {
		List<Order> orders = orderService.getAllOrders();
		return JSONArray.toJSONString(orders);
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

	@RequestMapping(value = "getOrderById.action")
	@ResponseBody
	public String getOrderById(int id) {
		return JSONObject.toJSONString(orderService.getOrderById(id));
	}

	@RequestMapping(value = "deleteOrderById.action")
	@ResponseBody
	public boolean deleteOrderById(int id) {
		int lines = orderService.deleteOrder(id);
		return lines > 0;
	}
}
