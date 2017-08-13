package com.cjt.trade.dao;

import com.cjt.trade.model.Website;

/**
 * @author wulitaotao
 */
public interface IWebsiteDao {

  Website getWebsite();

  int insertWebSite(Website website);

  void updateWebsite(Website website);
}