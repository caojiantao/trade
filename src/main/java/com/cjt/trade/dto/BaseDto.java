package com.cjt.trade.dto;

import lombok.Data;

@Data
public class BaseDto {

    private Integer page;
    private Integer rows;

    private Integer start;
    private Integer limit;

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
}
