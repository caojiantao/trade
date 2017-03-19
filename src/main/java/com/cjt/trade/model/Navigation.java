package com.cjt.trade.model;

public class Navigation {

	private String name;
	
	private String url;
	
	public Navigation(String name, String url){
		this.name = name;
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
