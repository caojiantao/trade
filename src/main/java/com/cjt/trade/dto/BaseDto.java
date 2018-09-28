package com.cjt.trade.dto;

import lombok.Data;

@Data
public class BaseDto {

    private Integer page;
    private Integer rows;

    private Integer start;
    private Integer limit;
    //总页数
    private Integer count;
    //总记录数
    private Integer total;

    public Integer getStart() {
        if (start != null) {
            return start;
        }

        if (page != null && rows != null) {
            return (page - 1) * rows;
        }
        return null;
    }

    public Integer getLimit() {
        if (limit != null) {
            return limit;
        }
        return rows;
    }

    public Integer getCount(){
        if(total != null && rows != null){
            return total/rows + (total%rows==0?0:1);
        }
        return null;
    }
}
