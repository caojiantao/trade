package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.model.PageInfo;

public interface IPageInfoService {

	public int insertPageInfo(PageInfo pageInfo);
	
	public PageInfo getPageInfo(int type);

	public PageInfo getPageInfo(int type, int id);
	
	public int deletePageInfo(int id);
	
	public List<PageInfo> getAllPageInfos();
	public int getAllPageInfosCount();
	
	public int updatePageInfo(PageInfo pageInfo);
}
