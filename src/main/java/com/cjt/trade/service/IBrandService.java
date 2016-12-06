package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;

public interface IBrandService {
	
	public int insertBrand(Brand brand);
	
	public int deleteBrand(int id);
	
	public List<Brand> getAllBrands(BaseDto dto);
	public int getAllBrandsCount(BaseDto dto);
	
	public Brand getBrandById(int id);
	
	public int updateBrand(Brand brand);
}
