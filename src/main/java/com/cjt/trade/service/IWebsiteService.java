package com.cjt.trade.service;

import com.cjt.trade.model.Website;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月23日
 * @subcription “网站信息”业务操作service
 */
public interface IWebsiteService {
	
	/**
	 * 获取网页信息
	 */
	public Website getWebsite();
	
	/**
	 * 插入网页信息
	 */
	public int insertWebSite(Website website);
	
	/**
	 * 修改网页信息
	 */
	public void updateWebsite(Website website);
}
