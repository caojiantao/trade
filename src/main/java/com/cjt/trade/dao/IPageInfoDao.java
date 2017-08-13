package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.vo.PageInfoVo;

public interface IPageInfoDao {

	int insertPageInfo(PageInfo pageInfo);
	
	/**
	 * 特别注意，dao层绑定多个参数，应用注解区分开来，要不然会报错
	 */
	// public PageInfo getPageInfo(@Param("id")int id,@Param("type")int type);
	
	PageInfo getPageInfo(PageInfoDto dto);
	
	int deletePageInfo(int id);
	
	List<PageInfoVo> getAllPageInfos(PageInfoDto dto);
	int getAllPageInfosCount(PageInfoDto dto);
	
	int updatePageInfo(PageInfo pageInfo);
}