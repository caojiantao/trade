package com.cjt.trade.dao;

import com.cjt.trade.dto.CategoryDto;
import com.cjt.trade.model.*;

import java.util.List;

public interface ICategoryDao {

  List<Category> listCategories();

  int countCategoriesByDto(CategoryDto dto);

  List<Trade> listTrades(CategoryDto dto);
  List<Brand> listBrands(CategoryDto dto);
  List<Product> listProducts(CategoryDto dto);

  Trade getTradeById(int id);
  Brand getBrandById(int id);
  Product getProductById(int id);

  int updateCategory(Category category);

  void saveCategory(Category category);

  int removeCategoryById(int id);

  List<MapModel> listTradesOpt();
  List<MapModel> listBrandsOptByParentId(int parentId);
  List<MapModel> listProductsOptByParentId(int parentId);
}
