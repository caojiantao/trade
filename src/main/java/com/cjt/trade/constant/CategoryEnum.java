package com.cjt.trade.constant;

/**
 * @author caojiantao
 * @create 2017-11-06 14:28:30
 * @desc 描述
 */
public enum  CategoryEnum {

  TRADE(0, "商品行业"), BRAND(1, "品牌类型"), PRODUCT(2, "产品类型");

  private int type;

  private String desc;

  CategoryEnum(int type, String desc){
    this.type = type;
    this.desc = desc;
  }

  public int getType() {
    return type;
  }
}
