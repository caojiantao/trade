package com.cjt.trade.controller.backend.mall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Trade;
import com.cjt.trade.service.ITradeService;
import com.cjt.trade.util.JSONUtil;

@Controller
@RequestMapping(value = "/backend/")
public class CategoryController extends BaseController {

	@Resource
	private ITradeService tradeService;
	
	@RequestMapping(value = "/tradeList.action")
	public String tradeList() {
		return "backend/mall/tradeList";
	}

	@RequestMapping(value = "getAllTrades.action")
	@ResponseBody
	public JSONObject getAllTrades(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<Trade> orders = tradeService.getAllTrades(dto);
		int count = tradeService.getAllTradesCount(dto);
		return JSONUtil.toGridJson(orders, count);
	}
	
	@RequestMapping(value = "getAllTradesOpt.action")
	@ResponseBody
	public String getAllTradesOpt(){
		return JSONObject.toJSONString(tradeService.getAllTradesOpt());
	}
	
	@RequestMapping(value = "addTrade.action")
	public String addTrade(Trade trade, Model model) {
		int lines = tradeService.insertTrade(trade);
		if (lines > 0) {
			model.addAttribute("returnUrl", "tradeAdd.action");
			return "success";
		}
		return "ERROR";
	}
	
	@RequestMapping(value = "updateTrade.action")
	public String updateTrade(Trade trade, Model model){
		int lines = tradeService.updateTrade(trade);
		if (lines > 0) {
			return tradeList();
		}
		return "ERROR";
	}

	@RequestMapping(value = "tradeAdd.action")
	public String tradeAdd() {
		return "backend/mall/tradeAdd";
	}

	@RequestMapping(value = "getTradeById.action")
	@ResponseBody
	public String getTradeById(int id) {
		return JSONObject.toJSONString(tradeService.getTradeById(id));
	}

	@RequestMapping(value = "deleteTradeById.action")
	@ResponseBody
	public boolean deleteTradeById(int id) {
		int lines = tradeService.deleteTrade(id);
		return lines > 0;
	}
}
