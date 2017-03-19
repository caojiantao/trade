package com.cjt.trade.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.dto.CartDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.model.User;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.util.CookieUtil;

@Controller
@RequestMapping(value="/api")
public class APIController {

	@Resource
	private IGoodsService goodsService;
	
	@Resource
	private IUserService userService;
	
	@RequestMapping(value="/getNewGoods.action")
	@ResponseBody
	public JSONObject getNewGoods(GoodsDto dto){
		JSONObject obj = new JSONObject();
		List<Goods> goods = goodsService.getNewGoods(dto);
		int goodsCount = goodsService.getNewGoodsCount(dto);
		obj.put("rows", goods);
		obj.put("total", goodsCount);
		return obj;
	}
	
	@RequestMapping(value="/saveCart.action")
	@ResponseBody
	public void saveCart(HttpServletRequest request, HttpServletResponse response, CartDto dto){
		// 获取cookies中购物车
		Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
		if (cookie == null) {
			// 初始化购物车本地cookie
			cookie = new Cookie(CookieUtil.CART, "");
		}
		// JSON化购物车cookie的value，方便修改
		JSONArray array = JSONArray.parseArray(cookie.getValue());
		if (array == null) {
			array = new JSONArray();
		}
		boolean exist = false;
		for (Object obj : array) {
			if (((JSONObject)obj).getIntValue(CookieUtil.GOODS_ID) == (dto.getGoodsId())) {
				// 直接修改obj，这样便间接修改了array
				((JSONObject)obj).put(CookieUtil.COUNT, ((JSONObject)obj).getIntValue(CookieUtil.COUNT) + dto.getCount());
				exist = true;
				break;
			}
		}
		if (!exist) {
			// 购物车中不存在添加的商品时添加
			array.add(dto);
		}
		cookie.setValue(array.toJSONString());
		// cookie值了maxAge和path后，代码是取不到值得，但是实质上存在。所以必须每次添加覆盖，必须修改他的maxAge/path，这样才能覆盖，并且改变生存周期
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		// 添加或者覆盖cookie保存至客户端
		response.addCookie(cookie);
	}
	
	@RequestMapping(value="/getCart.action")
	@ResponseBody
	public JSONArray getCart(HttpServletRequest request){
		Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
		if (cookie == null) {
			return null;
		}
		JSONArray array = JSONArray.parseArray(cookie.getValue());
		JSONArray goodsArray = new JSONArray();
		for (Object object : array) {
			CartDto dto = (CartDto)object;
			Goods goods = goodsService.getGoodsById(dto.getGoodsId());
			JSONObject obj = new JSONObject();
			obj.put("goods", goods);
			obj.put("count", dto.getCount());
			goodsArray.add(obj);
		}
		return goodsArray;
	}
	
	@RequestMapping(value="/updateCart.action")
	@ResponseBody
	public void updateCart(HttpServletRequest request, HttpServletResponse response, CartDto dto){
		// 获取cookies中购物车
		Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
		// JSON化购物车cookie的value，方便修改
		JSONArray array = JSONArray.parseArray(cookie.getValue());
		for (Object obj : array) {
			if (((JSONObject)obj).getIntValue(CookieUtil.GOODS_ID) == (dto.getGoodsId())) {
				// 直接修改obj，这样便间接修改了array
				((JSONObject)obj).put(CookieUtil.COUNT, dto.getCount());
				break;
			}
		}
		if (dto.getCount() == 0) {
			// 删除商品
			array.remove(JSONObject.toJSON(dto));
		}
		cookie.setValue(array.toJSONString());
		// cookie值了maxAge和path后，代码是取不到值得，但是实质上存在。所以必须每次添加覆盖，必须修改他的maxAge/path，这样才能覆盖，并且改变生存周期
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		// 添加或者覆盖cookie保存至客户端
		response.addCookie(cookie);
	}
	
	@RequestMapping(value="/register.action")
	@ResponseBody
	public int register(String email, String password){
		User user = userService.getUserByEmail(email);
		if (user != null) {
			return -1;
		}
		user = new User();
		user.setEmail(email);
		user.setPassword(password);
		return userService.register(user);
	}
	
	@RequestMapping(value="/login.action")
	@ResponseBody
	public User login(HttpSession session, HttpServletResponse response, String email, String password){
		User user = userService.login(email, password);
		if (user != null) {
			String name = "email";
			int second = 1000 * 60 * 60 * 24;
			/*Cookie cookie = new Cookie(GlobalConfig.SESSION_ID, session.getId());
    		cookie.setPath("/");
    		cookie.setMaxAge(second);
    		response.addCookie(cookie);*/
			
			session.setAttribute(name, user.getEmail());
			session.setMaxInactiveInterval(second);
		}
		return user;
	}
	
	@RequestMapping(value="/updateUser.action")
	@ResponseBody
	public int updateUser(User user){
		int status = userService.updateUser(user);
		return status;
	}
}
