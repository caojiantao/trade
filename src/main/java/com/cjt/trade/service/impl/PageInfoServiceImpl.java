package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IPageInfoDao;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;

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
	public List<PageInfo> getAllPageInfos() {
		return pageInfoDao.getAllPageInfos();
	}

	@Override
	public int getAllPageInfosCount() {
		return pageInfoDao.getAllPageInfosCount();
	}

	@Override
	public int updatePageInfo(PageInfo pageInfo) {
		return pageInfoDao.updatePageInfo(pageInfo);
	}

	@Override
	public PageInfo getPageInfo(int type) {
		return getPageInfo(type, 0);
	}

	@Override
	public PageInfo getPageInfo(int type, int id) {
		return pageInfoDao.getPageInfo(type, id);
	}

}
