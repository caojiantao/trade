package com.cjt.trade.model;

import lombok.Data;

@Data
public class Website {

    private Integer id;
    private String name;
    private String logoUrl;
    private String manager;
    private String businessHour;
    private String email;
    private String emailPwd;
    private String keyword;
    private String description;
    private String topScrollText;
    private String topFixText;
    private String goodsDetailBottom;
    private String goodsDetailRight;
    private String introduction;
    private String bottomFixText;
}