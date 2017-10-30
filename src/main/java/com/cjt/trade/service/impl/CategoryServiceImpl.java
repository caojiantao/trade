package com.cjt.trade.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import com.cjt.trade.dao.ICategoryDao;
import com.cjt.trade.model.Category;
import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IProductDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.vo.ProductVo;
import com.cjt.trade.vo.front.BaseMenuVo;
import com.cjt.trade.vo.front.CategoryVo;
import com.cjt.trade.vo.front.Item;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Service
public class CategoryServiceImpl implements ICategoryService {

	@Resource
	private IProductDao productDao;

	@Resource
	private ICategoryDao categoryDao;

	@Override
	public List<CategoryVo> getCategoryVos() {
		List<CategoryVo> vos = new ArrayList<CategoryVo>();
		// 获取所有product
		List<ProductVo> productVos = productDao.getAllProducts(new BaseDto());
		for (ProductVo productVo : productVos) {
			// 初始化三级菜单，不可再分（product）
			BaseMenuVo subItem = new BaseMenuVo();
			subItem.setId(productVo.getId());
			subItem.setTitle(productVo.getName());

			// 第一步检测一级菜单是否已经添加
			CategoryVo categoryVo = null;
			for (CategoryVo vo : vos) {
				if (vo.getId() == productVo.getTradeId()) {
					categoryVo = vo;
					// 找到一级菜单
					break;
				}
			}
			if (categoryVo != null) {
				// 第二步检测二级菜单是否已经添加
				List<Item> items = categoryVo.getItems();
				Item item = null;
				for (Item i : items) {
					if (i.getId() == productVo.getBrandId()) {
						item = i;
						break;
					}
				}
				if (item != null) {
					item.getSubItems().add(subItem);
				} else {
					// 然后new一个二级菜单（brand）
					item = new Item();
					item.setId(productVo.getBrandId());
					item.setTitle(productVo.getBrandName());
					item.getSubItems().add(subItem);

					categoryVo.getItems().add(item);
				}
			} else {
				// 若没有添加，则new一个一级菜单（trade）
				CategoryVo vo = new CategoryVo();
				vo.setId(productVo.getTradeId());
				vo.setTitle(productVo.getTradeName());

				// 然后new一个二级菜单（brand）
				Item item = new Item();
				item.setId(productVo.getBrandId());
				item.setTitle(productVo.getBrandName());

				// 逐级添加
				item.getSubItems().add(subItem);
				vo.getItems().add(item);
				vos.add(vo);
			}
		}
		listCategories();
		return vos;
	}

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
