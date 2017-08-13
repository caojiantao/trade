package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.vo.BrandVo;

@Repository
public interface IBrandDao {

  int insertBrand(Brand brand);

  int deleteBrand(int id);

  List<BrandVo> getAllBrands(BaseDto dto);

  int getAllBrandsCount(BaseDto dto);

  List<MapModel> getAllBrandsOptByTradeId(int tradeId);

  Brand getBrandById(int id);

  int updateBrand(Brand brand);

  List<Brand> listShowBrands();
}