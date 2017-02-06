package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.vo.front.CategoryVo;

public interface ICategoryService {

	/**
	 * 获取所有分类信息，用于首页展示
	 */
	public List<CategoryVo> getCategoryVos();
}
