package com.cjt.trade.vo;

/**
 * @author wulitaotao
 * @date 2016年12月12日
 * @subscription 品牌类型视图类
 */
public class BrandVo {
	
	private int id;

	private String tradeName;
	
	private String name;
	
	private int order;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTradeName() {
		return tradeName;
	}

	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}
}
