package com.cjt.trade.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Ems;
import com.cjt.trade.model.User;
import com.cjt.trade.model.Website;
import com.cjt.trade.service.IAdvertisementService;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.service.IEmsService;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.service.IProductService;
import com.cjt.trade.service.ITradeService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.service.IWebsiteService;
import com.cjt.trade.vo.front.CategoryVo;

@Controller
public class BaseFrontController extends BaseController {
	
	public final static int DEFAULT_COUNT = 10;

	@Resource
	private IWebsiteService websiteService;
	@Resource
	private IAdvertisementService advertisementService;
	@Resource
	private IUserService userService;
	@Resource
	private IEmsService emsService;
	@Resource
	private ICategoryService categoryService;
	@Resource
	private IGoodsService goodsService;
	@Resource
	private IPageInfoService pageInfoService;
	@Resource
	private ITradeService tradeService;
	@Resource 
	private IBrandService brandService;
	@Resource
	private IProductService productService;

	/**
	 * 网站基本信息
	 */
	public void initWebSite(Model model){
		Website website = websiteService.getWebsite();
		model.addAttribute("website", website);
	}
	
	/**
	 * 左侧商品分类菜单
	 */
	public List<CategoryVo> initCategory(Model model){
		List<CategoryVo> vos = categoryService.getCategoryVos();
		model.addAttribute("categorys", vos);
		return vos;
	}
	
	/**
	 * 获取最新指定条目数EMS信息
	 */
	public void initEms(Model model){
		BaseDto dto = new BaseDto();
		dto.setStart(0);
		dto.setLimit(DEFAULT_COUNT);
		List<Ems> emsList = emsService.getAllEms(dto);
		model.addAttribute("emsList", emsList);
	}
	
	/**
	 * 初始化登录用户
	 */
	public void initUser(Model model, HttpSession session){
		String email = (String) session.getAttribute("email");
		if (email != null && !"".equals(email)) {
			User user = userService.getUserByEmail(email);
			model.addAttribute("user", user);
		}
	}
	
	/**
	 * header、left、footer三个固定的模块页面传值，返回左侧导航分类信息
	 */
	public List<CategoryVo> initFixModule(HttpServletRequest request, Model model){
		initWebSite(model);
		initUser(model, request.getSession());
		List<CategoryVo> vos = initCategory(model);
		initEms(model);
		return vos;
	}
}
