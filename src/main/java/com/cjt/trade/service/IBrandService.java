package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.vo.BrandVo;

public interface IBrandService {
	
	public int insertBrand(Brand brand);
	
	public int deleteBrand(int id);
	
	public List<BrandVo> getAllBrands(BaseDto dto);
	public int getAllBrandsCount(BaseDto dto);
	
	/**
	 * 根据“商品行业”(tradeId)获取下属的所有“品牌类型”
	 */
	public List<MapModel> getAllBrandsOptByTradeId(int tradeId);
	
	public Brand getBrandById(int id);
	
	public int updateBrand(Brand brand);
}
