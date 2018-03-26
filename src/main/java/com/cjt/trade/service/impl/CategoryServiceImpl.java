package com.cjt.trade.service.impl;

import com.cjt.trade.dao.ICategoryDao;
import com.cjt.trade.dto.CategoryDto;
import com.cjt.trade.model.*;
import com.cjt.trade.service.ICategoryService;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService {

	@Resource
	private ICategoryDao categoryDao;

	@Override
	public List<Category> listCategories() {
		// 获取DB原始数据
		List<Category> categories = categoryDao.listCategories();
		// 采用spring自带工具类，实质就是实现Map<V, List<V>>，得到以parentId为分组的map
		MultiValueMap<Integer, Category> map = new LinkedMultiValueMap<Integer, Category>();
		for(Category category : categories) {
			map.add(category.getParentId(), category);
		}
		return setSubItem(map, 0);
	}

	@Override
	public int countCategoriesByDto(CategoryDto dto) {
		return categoryDao.countCategoriesByDto(dto);
	}

	@Override
	public List<Trade> listTrades(CategoryDto dto) {
		return categoryDao.listTrades(dto);
	}

	@Override
	public List<Brand> listBrands(CategoryDto dto) {
		return categoryDao.listBrands(dto);
	}

	@Override
	public List<Product> listProducts(CategoryDto dto) {
		return categoryDao.listProducts(dto);
	}

  @Override
  public Trade getTradeById(int id) {
    return categoryDao.getTradeById(id);
  }

  @Override
  public Brand getBrandById(int id) {
    return categoryDao.getBrandById(id);
  }

  @Override
  public Product getProductById(int id) {
    return categoryDao.getProductById(id);
  }

  @Override
  public int updateCategory(Category category) {
    return categoryDao.updateCategory(category);
  }

  @Override
  public void saveCategory(Category category) {
    categoryDao.saveCategory(category);
  }

  @Override
  public int removeCategoryById(int id) {
    return categoryDao.removeCategoryById(id);
  }

  @Override
  public List<MapModel> listTradesOpt() {
    return categoryDao.listTradesOpt();
  }

  @Override
  public List<MapModel> listBrandsOptByParentId(int parentId) {
    return categoryDao.listBrandsOptByParentId(parentId);
  }

  @Override
  public List<MapModel> listProductsOptByParentId(int parentId) {
    return categoryDao.listProductsOptByParentId(parentId);
  }

  private List<Category> setSubItem(MultiValueMap<Integer, Category> map, int parentId){
    List<Category> result = new ArrayList<Category>();
    if (map.containsKey(parentId)){
      List<Category> categories = map.get(parentId);
      for (Category category : categories){
        // 递归设置子项
        category.setChildren(setSubItem(map, category.getId()));
        // 注意添加到当前同级兄弟list中
        result.add(category);
      }
    }
    // 递归跳出条件：
    return result;
  }
}
