package com.cjt.trade.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IWebsiteDao;
import com.cjt.trade.model.Website;
import com.cjt.trade.service.IWebsiteService;

@Service
public class WebsiteServiceImpl implements IWebsiteService {
	
	@Resource
	private IWebsiteDao websiteDao;

	@Override
	public void updateWebsite(Website website) {
		websiteDao.updateWebsite(website);
	}

	@Override
	public Website getWebsite() {
		return websiteDao.getWebsite();
	}
}
