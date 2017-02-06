package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.vo.PageInfoVo;

public interface IPageInfoService {

	public int insertPageInfo(PageInfo pageInfo);
	
	/**
	 * 获取信息单页，或者是文章内容(根据type和id判断)
	 */
	public PageInfo getPageInfo(PageInfoDto dto);

	public int deletePageInfo(int id);
	
	public List<PageInfoVo> getAllPageInfos(PageInfoDto dto);
	public int getAllPageInfosCount(PageInfoDto dto);
	
	public int updatePageInfo(PageInfo pageInfo);
}
