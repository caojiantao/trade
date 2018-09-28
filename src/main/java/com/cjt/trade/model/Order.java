package com.cjt.trade.model;

import com.alibaba.fastjson.JSONObject;

import java.util.Date;
import java.util.List;

public class Order {
	
    private Integer id;

    private String userId;
    
    private String no;

    private String name;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private String nickName;
    
    private String postCode;

    private Integer county;

    private String address;

    private String phoneNumber;
    
    private String email;
    
    private String remark;
    
    private String emsNo;
    
    private Double totalPrice;
    
    private String goodsJson;
    
    private Date createTime;

    private List<JSONObject> goodsList;

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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getCounty() {
		return county;
	}

	public void setCounty(Integer county) {
		this.county = county;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getEmsNo() {
		return emsNo;
	}

	public void setEmsNo(String emsNo) {
		this.emsNo = emsNo;
	}

	public String getGoodsJson() {
		return goodsJson;
	}

	public void setGoodsJson(String goodsJson) {
		this.goodsJson = goodsJson;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public List<JSONObject> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<JSONObject> goodsList) {
		this.goodsList = goodsList;
	}
}