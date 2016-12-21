package com.cjt.trade.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.vo.PageInfoVo;

@Repository
public interface IPageInfoDao {

	public int insertPageInfo(PageInfo pageInfo);
	
	public PageInfo getPageInfo(int type);
	
	/**
	 * 特别注意，dao层绑定多个参数，应用注解区分开来，要不然会报错
	 */
	public PageInfo getPageInfo(@Param("id")int id,@Param("type")int type);
	
	public int deletePageInfo(int id);
	
	public List<PageInfoVo> getAllPageInfos(PageInfoDto dto);
	public int getAllPageInfosCount(PageInfoDto dto);
	
	public int updatePageInfo(PageInfo pageInfo);
}