package com.cjt.trade.constant;

/**
 * @author caojiantao
 */
public enum PageEnum {

  wzxx(0, "文章信息"),hsgy(1, "会社概要"),zwff(2, "注文方法"),zysx1(3, "重要事项"),gyqb(4, "割引情报"),
  zysx2(5, "注意事项"),fpfj(6, "返品返金"),yysj(7, "营业时间"),psfs(8, "配送方式");

  private Integer type;

  private String desc;

  PageEnum(Integer type, String desc){
    this.type = type;
    this.desc = desc;
  }

  public Integer getType() {
    return type;
  }

  public void setType(Integer type) {
    this.type = type;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }
}
