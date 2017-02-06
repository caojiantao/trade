package com.cjt.trade.dao;

import com.cjt.trade.model.Website;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月23日
 * @subcription “网页信息”dao层
 */
public interface IWebsiteDao {
	
	public Website getWebsite();
	
	public int insertWebSite(Website website);
	
	public void updateWebsite(Website website);
}