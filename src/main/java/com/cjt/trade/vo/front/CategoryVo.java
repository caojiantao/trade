package com.cjt.trade.vo.front;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wulitaotao
 * @date 2017年2月5日
 * @subscription 首页分类视图（一级菜单）
 */
public class CategoryVo extends BaseMenuVo {
	
	/**
	 * 二级菜单项
	 */
	private List<Item> items = new ArrayList<Item>();

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}