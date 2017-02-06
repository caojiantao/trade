package com.cjt.trade.vo.front;

import java.util.ArrayList;
import java.util.List;

public class Item extends BaseMenuVo {
	
	/**
	 * 三级菜单项
	 */
	private List<BaseMenuVo> subItems = new ArrayList<BaseMenuVo>();

	public List<BaseMenuVo> getSubItems() {
		return subItems;
	}

	public void setSubItems(List<BaseMenuVo> subItems) {
		this.subItems = subItems;
	}
}
