package com.cjt.trade.model;

public class Website {
	
    private Integer id;

    private String name;

    private String logoUrl;

    private String manager;

    private String businessHour;

    private String email;

    private String emailPwd;

    private String keyword;

    private String subscription;

    private String topScrollText;

    private String topFixText;
    
    private String goodsDetailBottom;

    private String goodsDetailRight;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getBusinessHour() {
        return businessHour;
    }

    public void setBusinessHour(String businessHour) {
        this.businessHour = businessHour;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailPwd() {
        return emailPwd;
    }

    public void setEmailPwd(String emailPwd) {
        this.emailPwd = emailPwd;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getTopScrollText() {
        return topScrollText;
    }

    public void setTopScrollText(String topScrollText) {
        this.topScrollText = topScrollText;
    }

    public String getTopFixText() {
        return topFixText;
    }

    public void setTopFixText(String topFixText) {
        this.topFixText = topFixText;
    }

    public String getSubscription() {
        return subscription;
    }

    public void setSubscription(String subscription) {
        this.subscription = subscription;
    }

	public String getGoodsDetailBottom() {
		return goodsDetailBottom;
	}

	public void setGoodsDetailBottom(String goodsDetailBottom) {
		this.goodsDetailBottom = goodsDetailBottom;
	}

	public String getGoodsDetailRight() {
		return goodsDetailRight;
	}

	public void setGoodsDetailRight(String goodsDetailRight) {
		this.goodsDetailRight = goodsDetailRight;
	}
}