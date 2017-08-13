package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Product;
import com.cjt.trade.vo.ProductVo;

/**
 * @author wulitaotao
 */
public interface IProductDao {

  int insertProduct(Product product);

  int deleteProduct(int id);

  List<ProductVo> getAllProducts(BaseDto dto);

  int getAllProductsCount(BaseDto dto);

  List<MapModel> getAllProductsOptByBrandId(int brandId);

  Product getProductById(int id);

  int updateProduct(Product product);
}