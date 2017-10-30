package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.vo.PageInfoVo;

public interface IPageInfoDao {

	int insertPageInfo(PageInfo pageInfo);
	
	PageInfo getPageInfo(PageInfoDto dto);
	
	int deletePageInfo(int id);
	
	List<PageInfoVo> getAllPageInfos(PageInfoDto dto);
	int getAllPageInfosCount(PageInfoDto dto);
	
	int updatePageInfo(PageInfo pageInfo);
}