package com.cjt.trade.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsDto extends BaseDto {

    private int tradeId;
    private int brandId;
    private int productId;

    private double lowestPrice;
    private double highestPrice;

    private String name;
    private String keyword;
}
