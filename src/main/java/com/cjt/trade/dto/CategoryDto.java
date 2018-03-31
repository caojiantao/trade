package com.cjt.trade.dto;

/**
 * @author caojiantao
 */
public class CategoryDto extends BaseDto {

    private int type;

    private boolean show;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public boolean isShow() {
        return show;
    }

    public void setShow(boolean show) {
        this.show = show;
    }
}
