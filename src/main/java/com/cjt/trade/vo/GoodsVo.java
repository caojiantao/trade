package com.cjt.trade.vo;

/**
 * @author wulitaotao
 * @date 2016年12月13日
 * @subscription 商品视图类
 */
public class GoodsVo {
	
	private int id;
	
	private String tradeName;
	
	private String brandName;
	
	private String productName;
	
	private String name;
	
	private String logoUrl;
	
	private String updateTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getTradeName() {
		return tradeName;
	}

	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		// 解决直接读取数据库时间后缀.0
		this.updateTime = updateTime.replace(".0", "");
	}
}
