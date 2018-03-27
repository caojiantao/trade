package com.cjt.trade.dto;

/**
 * @author caojiantao
 */
public class PageInfoDto extends BaseDto {

    private int type;

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
