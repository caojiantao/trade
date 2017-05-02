package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.vo.BrandVo;

public interface IBrandService {
	
	int insertBrand(Brand brand);
	
	int deleteBrand(int id);
	
	List<BrandVo> getAllBrands(BaseDto dto);
	int getAllBrandsCount(BaseDto dto);
	
	/**
	 * 根据“商品行业”(tradeId)获取下属的所有“品牌类型”
	 */
	List<MapModel> getAllBrandsOptByTradeId(int tradeId);
	
	Brand getBrandById(int id);
	
	int updateBrand(Brand brand);
	
	/**
	 * 获取首页品牌推荐
	 */
	List<Brand> listShowBrands();
}
