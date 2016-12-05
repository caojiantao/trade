package com.cjt.trade.model;

public class Trade {
	
    private Integer id;

    private String name;

    private Integer order;

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

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

	@Override
	public String toString() {
		return "Trade [id=" + id + ", name=" + name + ", order=" + order + "]";
	}
}