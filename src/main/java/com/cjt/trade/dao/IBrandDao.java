package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.vo.BrandVo;

@Repository
public interface IBrandDao {
	
	public int insertBrand(Brand brand);
	
	public int deleteBrand(int id);
	
	public List<BrandVo> getAllBrands(BaseDto dto);
	public int getAllBrandsCount(BaseDto dto);
	
	public List<MapModel> getAllBrandsOptByTradeId(int tradeId);
	
	public Brand getBrandById(int id);
	
	public int updateBrand(Brand brand);
}