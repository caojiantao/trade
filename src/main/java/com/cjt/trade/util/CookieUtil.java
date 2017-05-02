package com.cjt.trade.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {

	/**
	 * 购物车cookie name
	 */
	public static final String CART = "cart";
	
	/**
	 * 商品id
	 */
	public static final String GOODS_ID = "goodsId";
	
	/**
	 * 商品数量
	 */
	public static final String COUNT = "count";
	
	/**
	 * 通过cookie的name获取cookie
	 * @param name
	 * @param request
	 * @return
	 */
	public static Cookie getCookieByName(String name, HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return null;
		}
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name)) {
				return cookie;
			}
		}
		return null;
	}
}
