package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IPageInfoDao;
import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.vo.PageInfoVo;

@Service
public class PageInfoServiceImpl implements IPageInfoService {

	@Resource
	private IPageInfoDao pageInfoDao;
	
	@Override
	public int insertPageInfo(PageInfo pageInfo) {
		return pageInfoDao.insertPageInfo(pageInfo);
	}

	@Override
	public int deletePageInfo(int id) {
		return pageInfoDao.deletePageInfo(id);
	}

	@Override
	public List<PageInfoVo> getAllPageInfos(PageInfoDto dto) {
		return pageInfoDao.getAllPageInfos(dto);
	}

	@Override
	public int getAllPageInfosCount(PageInfoDto dto) {
		return pageInfoDao.getAllPageInfosCount(dto);
	}

	@Override
	public int updatePageInfo(PageInfo pageInfo) {
		return pageInfoDao.updatePageInfo(pageInfo);
	}

	@Override
	public PageInfo getPageInfo(PageInfoDto dto) {
		return pageInfoDao.getPageInfo(dto);
	}
}
