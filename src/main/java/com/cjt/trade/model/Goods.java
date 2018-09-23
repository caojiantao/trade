package com.cjt.trade.model;

import lombok.Data;

import java.util.Date;

@Data
public class Goods {

    private Integer id;
    private Integer tradeId;
    private String tradeName;
    private Integer brandId;
    private String brandName;
    private Integer productId;
    private String productName;
    private String number;
    private String name;
    private Double price;
    private Boolean scroll;
    private Boolean hot;
    private String title;
    private String keyword;
    private String description;
    private String logoUrl;
    private String logoRealUrl;
    private String content;
    private Date updateTime;
    private Integer browseTimes;
}