package com.cjt.trade.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Goods;
import com.cjt.trade.model.Order;
import com.cjt.trade.model.Website;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IOrderService;
import com.cjt.trade.service.IWebsiteService;
import com.cjt.trade.vo.front.CategoryVo;

@Controller
@RequestMapping(value="/front/build")
public class FrontController extends BaseController {

	@Resource
	private IWebsiteService websiteService;
	
	@Resource
	private ICategoryService categoryService;
	
	@Resource
	private IGoodsService goodsService;
	
	@Resource
	private IOrderService orderService;
	
	@RequestMapping(value="/index.action")
	public String index(Model model){
		Website website = websiteService.getWebsite();
		model.addAttribute("website", website);
		
		List<CategoryVo> vos = categoryService.getCategoryVos();
		model.addAttribute("categorys", vos);
		
		List<Order> orders = orderService.getAllOrders();
		model.addAttribute("orders", orders);
		
		List<Goods> scrollGoods = goodsService.getScrollGoods();
		List<Goods> hotGoods = goodsService.getHotGoods();
		model.addAttribute("scrollGoods", scrollGoods);
		model.addAttribute("hotGoods", hotGoods);
		
		return "front/build/index";
	}
}
