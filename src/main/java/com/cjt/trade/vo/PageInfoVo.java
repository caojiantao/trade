package com.cjt.trade.vo;

public class PageInfoVo {

	private String title;
	
	private String updateTime;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		// 解决直接读取数据库时间后缀.0
		this.updateTime = updateTime.replace(".0", "");
	}
}
