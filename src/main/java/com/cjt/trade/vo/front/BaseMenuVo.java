package com.cjt.trade.vo.front;

/**
 * @author wulitaotao
 * @date 2017年2月5日
 * @subscription 菜单项基类
 */
public class BaseMenuVo{
	
	/**
	 * 菜单id
	 */
	private int id;
	
	/**
	 * 菜单名称
	 */
	private String title;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
