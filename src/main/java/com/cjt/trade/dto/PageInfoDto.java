package com.cjt.trade.dto;

public class PageInfoDto extends BaseDto {

	/**
	 * 信息单页类型，8 >> 文章信息
	 */
	private int type;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
