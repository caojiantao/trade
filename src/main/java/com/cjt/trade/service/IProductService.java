package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Product;
import com.cjt.trade.vo.ProductVo;

public interface IProductService {

	public int insertProduct(Product product);
	
	public int deleteProduct(int id);
	
	public List<ProductVo> getAllProducts(BaseDto dto);
	public int getAllProductsCount(BaseDto dto);
	
	/**
	 * 根据“品牌类型”(brandId)获取下属的所有“产品类型”
	 */
	public List<MapModel> getAllProductsOptByBrandId(int brandId);
	
	public Product getProductById(int id);
	
	public int updateProduct(Product product);
}
