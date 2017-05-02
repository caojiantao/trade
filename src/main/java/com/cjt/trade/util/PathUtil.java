package com.cjt.trade.util;

import java.io.File;

import com.cjt.trade.constant.GlobalConfig;

/**
 * 文件路径和url地址的工具类
 */
public class PathUtil implements GlobalConfig{

	/**
	 * 获取文件上传的根路径(例D:\\upload)
	 */
	public static String getRootPath() {
		File file = new File(File.separator);
		return file.getAbsolutePath() + File.separatorChar + UPLOAD_ROOT;
	}

	/**
	 * 获取“品牌类型”文件上传的根路径(例D:\\upload\\brand)
	 */
	public static String getBrandPath() {
		return getRootPath() + File.separatorChar + UPLOAD_BRAND;
	}
	
	/**
	 * 获取“产品类型”文件上传的根路径(例D:\\upload\\product)
	 */
	public static String getProductPath() {
		return getRootPath() + File.separatorChar + UPLOAD_PRODUCT;
	}
	
	/**
	 * 获取“商品”文件上传的根路径(例D:\\upload\\goods)
	 */
	public static String getGoodsPath() {
		return getRootPath() + File.separatorChar + UPLOAD_GOODS;
	}
	
	public static String getAdsPath() {
		return getRootPath() + File.separatorChar + UPLOAD_ADS;
	}
	
	/**
	 * 获取“网站logo”的url地址(例/upload/)
	 */
	public static String getLogoUrlPath(){
		return "/" + UPLOAD_ROOT + "/";
	}
	
	/**
	 * 获取“商品品牌logo”的url地址(例/upload/brand/)
	 */
	public static String getBrandUrlPath(){
		return getLogoUrlPath() + UPLOAD_BRAND + "/";
	}
	
	/**
	 * 获取“产品类型logo”的url地址(例/upload/product/)
	 */
	public static String getProductUrlPath(){
		return getLogoUrlPath() + UPLOAD_PRODUCT + "/";
	}
	
	/**
	 * 获取“商品logo”的url地址(例/upload/goods/)
	 */
	public static String getGoodsUrlPath(){
		return getLogoUrlPath() + UPLOAD_GOODS + "/";
	}

	public static String getAdsUrlPath(){
		return getLogoUrlPath() + UPLOAD_ADS + "/";
	}
}
