package com.cjt.trade.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cjt.trade.model.PageInfo;

@Repository
public interface IPageInfoDao {

	public int insertPageInfo(PageInfo pageInfo);

	public PageInfo getPageInfo(@Param("type")int type,@Param("id")int id);
	
	public int deletePageInfo(int id);
	
	public List<PageInfo> getAllPageInfos();
	public int getAllPageInfosCount();
	
	public int updatePageInfo(PageInfo pageInfo);
}