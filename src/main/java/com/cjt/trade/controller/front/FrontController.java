package com.cjt.trade.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.CartDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.Goods;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Navigation;
import com.cjt.trade.model.Order;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.model.Product;
import com.cjt.trade.model.Trade;
import com.cjt.trade.model.User;
import com.cjt.trade.model.Website;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.service.IDictionaryService;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IOrderService;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.service.IProductService;
import com.cjt.trade.service.ITradeService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.service.IWebsiteService;
import com.cjt.trade.util.CookieUtil;
import com.cjt.trade.vo.front.CategoryVo;
@Controller
@RequestMapping(value="/")
public class FrontController extends BaseController {
	
	/**
	 * 最新商品显示数量
	 */
	private final static int DEFAULT_COUNT = 8;
	
	@Resource
	private IUserService userService;
	
	@Resource
	private IWebsiteService websiteService;
	
	@Resource
	private ICategoryService categoryService;
	
	@Resource
	private IGoodsService goodsService;
	
	@Resource
	private IOrderService orderService;
	
	@Resource
	private IPageInfoService pageInfoService;
	
	@Resource
	private ITradeService tradeService;
	
	@Resource 
	private IBrandService brandService;
	
	@Resource
	private IProductService productService;
	
	@Resource
	private IDictionaryService dictionaryService;
	
	@RequestMapping(value="/index.action")
	public String index(Model model){
		List<CategoryVo> vos = initFixModule(model);

		scrollGoods(model);
		hotGoods(model);
		newCategoryGoods(model, vos);
		
		PageInfoDto dto = new PageInfoDto();
		// 营业时间
		dto.setType(6);
		PageInfo businessInfo = pageInfoService.getPageInfo(dto);
		model.addAttribute("businessInfo", businessInfo);
		// 配送时间
		dto.setType(7);
		PageInfo deliveryInfo = pageInfoService.getPageInfo(dto);
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		return "front/build/index";
	}
	
	/**
	 * 商品详情页
	 */
	@RequestMapping(value="/goods.action")
	public String goodsDetail(int id, Model model){
		initFixModule(model);
		
		Goods goods = goodsService.getGoodsById(id);
		model.addAttribute("goods", goods);
		
		PageInfoDto dto = new PageInfoDto();
		// 注意事项
		dto.setType(4);
		PageInfo attention = pageInfoService.getPageInfo(dto);
		model.addAttribute("attention", attention);
		// 返品返金
		dto.setType(5);
		PageInfo award = pageInfoService.getPageInfo(dto);
		model.addAttribute("award", award);
		// 营业时间
		dto.setType(6);
		PageInfo businessInfo = pageInfoService.getPageInfo(dto);
		model.addAttribute("businessInfo", businessInfo);
		// 配送时间
		dto.setType(7);
		PageInfo deliveryInfo = pageInfoService.getPageInfo(dto);
		model.addAttribute("deliveryInfo", deliveryInfo);
		
		return "front/build/detail";
	}
	
	
	/**
	 * 信息单页
	 */
	@RequestMapping(value="/pageInfo.action")
	public String pageInfo(PageInfoDto dto, Model model){
		initFixModule(model);
		
		PageInfo pageInfo = pageInfoService.getPageInfo(dto);
		model.addAttribute("pageInfo", pageInfo);
		
		return "front/build/pageInfo";
	}
	
	/**
	 * EMS信息页
	 */
	@RequestMapping(value="/ems.action")
	public String ems(int id, Model model){
		initFixModule(model);
		
		Order order = orderService.getOrderById(id);
		model.addAttribute("ems", order);
		return "front/build/ems";
	}
	
	/**
	 * 品牌类型 
	 */
	@RequestMapping(value="/brand.action")
	public String brand(int id, Model model){
		initFixModule(model);
		
		// 品牌信息
		Brand brand = brandService.getBrandById(id);
		model.addAttribute("brand", brand);
		
		// 面包屑导航
		List<Navigation> navs = new ArrayList<Navigation>();
		navs.add(new Navigation(brand.getTradeName(), "/hot.action?id=" + brand.getTradeId()));
		navs.add(new Navigation(brand.getName(), ""));
		model.addAttribute("navs", navs);
		
		// 当前brand“品牌类型”所有product“产品类型”
		List<MapModel> maps = productService.getAllProductsOptByBrandId(id);
		model.addAttribute("maps", maps);
		
		return "front/build/brand";
	}
	
	/**
	 * 产品类型
	 */
	@RequestMapping(value="/product.action")
	public String product(int id, Model model){
		initFixModule(model);
		
		// 产品信息
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);

		List<Navigation> navs = new ArrayList<Navigation>();
		navs.add(new Navigation(product.getTradeName(), "/hot.action?id=" + product.getTradeId()));
		navs.add(new Navigation(product.getBrandName(), "/brand.action?id=" + product.getBrandId()));
		navs.add(new Navigation(product.getName(), ""));
		model.addAttribute("navs", navs);
		
		// 当前brand“品牌类型”所有product“产品类型”
		List<MapModel> maps = productService.getAllProductsOptByBrandId(product.getBrandId());
		model.addAttribute("maps", maps);
		return "front/build/product";
	}
	
	/**
	 * 热卖页面
	 */
	@RequestMapping(value="/list.action")
	public String list(GoodsDto dto, Model model){
		initFixModule(model);
		
		List<Navigation> navs = new ArrayList<Navigation>();
		if (dto.getId() != 0) {
			// 商品行业热卖 trade
			Trade trade = tradeService.getTradeById(dto.getId());
			navs.add(new Navigation(trade.getName(), ""));
		} else{
			navs.add(new Navigation("商品一览", ""));
		}
		model.addAttribute("navs", navs);
		model.addAttribute("tradeId", dto.getId());

		return "/front/build/list";
	}
	
	/**
	 * 购物车页面
	 */
	@RequestMapping(value="/cart.action")
	public String shopcart(HttpServletRequest request, Model model){
		website(model);
		
		Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
		JSONArray goodsArray = new JSONArray();
		if (cookie != null) {
			// cookie不是null遍历
			JSONArray array = JSONArray.parseArray(cookie.getValue());
			for (Object object : array) {
				CartDto dto = JSONObject.toJavaObject((JSONObject)object, CartDto.class);
				Goods goods = goodsService.getGoodsById(dto.getGoodsId());
				JSONObject obj = new JSONObject();
				obj.put("goods", goods);
				obj.put("count", dto.getCount());
				goodsArray.add(obj);
			}
		}
		model.addAttribute("data", goodsArray) ;
		
		// 获取当前用户信息
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		if (email != null && !"".equals(email)) {
			User user = userService.getUserByEmail(email);
			model.addAttribute("user", user);
		}
		
		// 县郡
		List<JSONObject> maps = dictionaryService.getOptsBySetId(1);
		model.addAttribute("counties", maps);
		return "/front/build/cart";
	}
	
	@RequestMapping(value="/register.action")
	public String register(Model model){
		initFixModule(model);
		return "/front/build/register";
	}
	
	@RequestMapping(value="/user.action")
	public String user(HttpSession session, Model model){
		initFixModule(model);
		
		String email = (String) session.getAttribute("email");
		if (email != null && !"".equals(email)) {
			User user = userService.getUserByEmail(email);
			model.addAttribute("user", user);
		}
		// 县郡
		List<JSONObject> maps = dictionaryService.getOptsBySetId(1);
		model.addAttribute("counties", maps);
		return "/front/build/user";
	}
	
	/**
	 * 网站基本信息
	 */
	public void website(Model model){
		Website website = websiteService.getWebsite();
		model.addAttribute("website", website);
	}
	
	/**
	 * 左侧商品分类菜单
	 */
	public List<CategoryVo> category(Model model){
		List<CategoryVo> vos = categoryService.getCategoryVos();
		model.addAttribute("categorys", vos);
		return vos;
	}
	
	/**
	 * 订单信息
	 */
	public void order(Model model){
		List<Order> orders = orderService.getAllOrders();
		model.addAttribute("orders", orders);
	}
	
	/**
	 * 商品滚动
	 */
	public void scrollGoods(Model model){
		List<Goods> scrollGoods = goodsService.getScrollGoods();
		model.addAttribute("scrollGoods", scrollGoods);
	}
	
	/**
	 * 人气商品
	 */
	public void hotGoods(Model model){
		List<Goods> hotGoods = goodsService.getHotGoods();
		model.addAttribute("hotGoods", hotGoods);
	}
	
	/**
	 * 数据库中的最新商品
	 */
	public void newGoods(Model model){
		GoodsDto dto = new GoodsDto();
		dto.setLimit(DEFAULT_COUNT);
		List<Goods> newGoods = goodsService.getNewGoods(dto);
		model.addAttribute("newGoods", newGoods);
	}
	
	/**
	 * 各类指定条目的最新商品
	 */
	public void newCategoryGoods(Model model, List<CategoryVo> vos){
		List<String> tradeNames = new ArrayList<String>();
		List<List<Goods>> goodsList = new ArrayList<List<Goods>>();
		GoodsDto dto = new GoodsDto();
		dto.setType(1);
		dto.setLimit(DEFAULT_COUNT);
		for (CategoryVo vo : vos) {
			tradeNames.add(vo.getTitle());
			dto.setId(vo.getId());
			List<Goods> goods = goodsService.getNewGoods(dto);
			goodsList.add(goods);
		}
		model.addAttribute("tradeNameTabs", tradeNames);
		model.addAttribute("newGoodsList", goodsList);
	}
	
	/**
	 * header、left、footer三个固定的模块页面传值，返回左侧导航分类信息
	 */
	public List<CategoryVo> initFixModule(Model model){
		website(model);
		List<CategoryVo> vos = category(model);
		order(model);
		newGoods(model);
		return vos;
	}
	
}
