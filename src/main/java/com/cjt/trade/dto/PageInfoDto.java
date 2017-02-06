package com.cjt.trade.dto;

public class PageInfoDto extends BaseDto {

	/**
     * 0:会社概要
     * 1:注文方法
     * 2:重要事项
     * 3:割引情报
     * 4:注意事项
     * 5:返品返金
     * 6:营业时间
     * 7:配送方式
     * 
     * 8:文章内容
     */
	private int type;
	
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
