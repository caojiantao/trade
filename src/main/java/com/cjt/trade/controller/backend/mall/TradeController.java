package com.cjt.trade.controller.backend.mall;

import java.util.List;

import javax.annotation.Resource;

import com.cjt.trade.constant.CategoryEnum;
import com.cjt.trade.dto.CategoryDto;
import com.cjt.trade.dto.ResultDTO;
import com.cjt.trade.model.Category;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Trade;
import com.cjt.trade.util.JSONUtil;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/backend")
public class TradeController extends BaseController {

    @Resource
    private ICategoryService categoryService;

    @RequestMapping(value = "/tradeList.action")
    public String tradeList() {
        return "backend/mall/tradeList";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllTrades.action")
    public JSONObject getAllTrades(int page, int rows, CategoryDto dto) {
        dto.setType(CategoryEnum.TRADE.getType());
        dto.setStart((page - 1) * rows);
        dto.setLimit(rows);
        List<Trade> trades = categoryService.listTrades(dto);
        int count = categoryService.countCategoriesByDto(dto);
        return JSONUtil.toGridJson(trades, count);
    }

    @ResponseBody
    @RequestMapping(value = "/addTrade.action")
    public ResultDTO addTrade(Category trade) {
        trade.setType(CategoryEnum.TRADE.getType());
        categoryService.saveCategory(trade);
        return success();
    }

    @ResponseBody
    @RequestMapping(value = "/updateTrade.action")
    public ResultDTO updateTrade(Category trade) {
        int lines = categoryService.updateCategory(trade);
        return lines > 0 ? success() : failed("更新失败");
    }

    @ResponseBody
    @RequestMapping(value = "/getTradeById.action")
    public Trade getTradeById(int id) {
        return categoryService.getTradeById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteTradeById.action")
    public ResultDTO deleteTradeById(int id) {
        int lines = categoryService.removeCategoryById(id);
        return lines > 0 ? success() : failed("删除失败");
    }

    @ResponseBody
    @RequestMapping("/listTradesOpt.action")
    public List<MapModel> listTradesOpt() {
        return categoryService.listTradesOpt();
    }
}
