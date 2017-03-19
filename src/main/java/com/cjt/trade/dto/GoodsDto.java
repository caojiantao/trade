package com.cjt.trade.dto;

public class GoodsDto extends BaseDto {

	/**
	 * 类型（0：商品一览；1：行业；2：品牌；3：产品）
	 */
	private int type;
	
	/**
	 * 类型id
	 */
	private int id;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
