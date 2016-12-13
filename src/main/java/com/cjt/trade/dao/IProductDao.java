package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Product;
import com.cjt.trade.vo.ProductVo;

/**
 * @author wulitaotao
 * @date 2016年12月12日
 * @subscription 产品类型dao层
 */
@Repository
public interface IProductDao {
	
	public int insertProduct(Product product);
	
	public int deleteProduct(int id);
	
	public List<ProductVo> getAllProducts(BaseDto dto);
	public int getAllProductsCount(BaseDto dto);
	
	public List<MapModel> getAllProductsOptByBrandId(int brandId);
	
	public Product getProductById(int id);
	
	public int updateProduct(Product product);
}