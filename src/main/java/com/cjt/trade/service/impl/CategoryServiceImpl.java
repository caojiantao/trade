package com.cjt.trade.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IProductDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.vo.ProductVo;
import com.cjt.trade.vo.front.BaseMenuVo;
import com.cjt.trade.vo.front.CategoryVo;
import com.cjt.trade.vo.front.Item;

@Service
public class CategoryServiceImpl implements ICategoryService {
	
	@Resource
	private IProductDao productDao;
	
	@Override
	public List<CategoryVo> getCategoryVos() {
		List<CategoryVo> vos = new ArrayList<CategoryVo>();
		// 获取所有product
		List<ProductVo> productVos = productDao.getAllProducts(new BaseDto());
		for (ProductVo productVo : productVos) {
			// 第一步检测一级菜单是否已经添加
			CategoryVo categoryVo = null;
			for (CategoryVo vo : vos) {
				if (vo.getId() == productVo.getTradeId()) {
					categoryVo = vo;
					// 找到一级菜单
					break;
				}
			}
			// 初始化三级菜单（product）
			BaseMenuVo subItem = new BaseMenuVo();
			subItem.setId(productVo.getId());
			subItem.setTitle(productVo.getName());
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
				// 然后new一个二级菜单（brand）
				Item item = new Item();
				item.setId(productVo.getBrandId());
				item.setTitle(productVo.getBrandName());
				item.getSubItems().add(subItem);
				
				// 若没有添加，则new一个一级菜单（trade）
				CategoryVo vo = new CategoryVo();
				vo.setId(productVo.getTradeId());
				vo.setTitle(productVo.getTradeName());
				vo.getItems().add(item);
				
				vos.add(vo);
			}
		}
		return vos;
	}

}
