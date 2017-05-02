package com.cjt.trade.constant;


public interface GlobalConfig {
	
	/**
	 * 存储在session中的用户信息name
	 */
	public static final String ACCOUNT_SESSION = "account";
	
	/**
	 * web容器(tomcat)保持的sessionId名称
	 */
	public static final String SESSION_ID = "JSESSIONID";
	
	/**
	 * 网站logo图片名称(保存在服务器)
	 */
	public static final String LOGO_NAME = "logo.png";
	
	public static final String UPLOAD_ROOT	= "upload";
	public static final String UPLOAD_BRAND = "brand";
	public static final String UPLOAD_PRODUCT = "product";
	public static final String UPLOAD_GOODS = "goods";
	public static final String UPLOAD_ADS = "advertisement";
}
