package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IBrandDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.vo.BrandVo;

@Service
public class BrandServiceImpl implements IBrandService {

	@Resource
	private IBrandDao brandDao;
	
	@Override
	public int insertBrand(Brand brand) {
		return brandDao.insertBrand(brand);
	}

	@Override
	public int deleteBrand(int id) {
		return brandDao.deleteBrand(id);
	}

	@Override
	public List<BrandVo> getAllBrands(BaseDto dto) {
		return brandDao.getAllBrands(dto);
	}

	@Override
	public int getAllBrandsCount(BaseDto dto) {
		return brandDao.getAllBrandsCount(dto);
	}

	@Override
	public Brand getBrandById(int id) {
		return brandDao.getBrandById(id);
	}

	@Override
	public int updateBrand(Brand brand) {
		return brandDao.updateBrand(brand);
	}

	@Override
	public List<MapModel> getAllBrandsOptByTradeId(int tradeId) {
		return brandDao.getAllBrandsOptByTradeId(tradeId);
	}

}
