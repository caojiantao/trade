package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.vo.PageInfoVo;

public interface IPageInfoService {

	public int insertPageInfo(PageInfo pageInfo);
	
	public PageInfo getPageInfo(int type);
	public PageInfo getPageInfo(int id, int type);

	public int deletePageInfo(int id);
	
	public List<PageInfoVo> getAllPageInfos(PageInfoDto dto);
	public int getAllPageInfosCount(PageInfoDto dto);
	
	public int updatePageInfo(PageInfo pageInfo);
}
