package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IProductDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Product;
import com.cjt.trade.service.IProductService;
import com.cjt.trade.vo.ProductVo;

@Service
public class ProductServiceImpl implements IProductService {

	@Resource
	private IProductDao productDao;
	
	@Override
	public int insertProduct(Product product) {
		return productDao.insertProduct(product);
	}

	@Override
	public int deleteProduct(int id) {
		return productDao.deleteProduct(id);
	}

	@Override
	public List<ProductVo> getAllProducts(BaseDto dto) {
		return productDao.getAllProducts(dto);
	}

	@Override
	public int getAllProductsCount(BaseDto dto) {
		return productDao.getAllProductsCount(dto);
	}

	@Override
	public Product getProductById(int id) {
		return productDao.getProductById(id);
	}

	@Override
	public int updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

}
