package com.cjt.trade.model;

public class Advertisement {

	private Integer id;
	
	private Integer order;
	
	private String url;
	
	private String logoUrl;
	
	private String logoRealUrl;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getLogoRealUrl() {
		return logoRealUrl;
	}

	public void setLogoRealUrl(String logoRealUrl) {
		this.logoRealUrl = logoRealUrl;
	}
}
