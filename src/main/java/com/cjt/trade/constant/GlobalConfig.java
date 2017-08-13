package com.cjt.trade.constant;


public interface GlobalConfig {

  /**
   * 存储在session中的用户信息name
   */
  String ACCOUNT_SESSION = "account";

  /**
   * web容器(tomcat)保持的sessionId名称
   */
  String SESSION_ID = "JSESSIONID";

  /**
   * 网站logo图片名称(保存在服务器)
   */
  String LOGO_NAME = "logo.png";

  String UPLOAD_ROOT = "upload";
  String UPLOAD_BRAND = "brand";
  String UPLOAD_PRODUCT = "product";
  String UPLOAD_GOODS = "goods";
  String UPLOAD_ADS = "advertisement";
}
