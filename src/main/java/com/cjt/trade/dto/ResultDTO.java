package com.cjt.trade.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author caojiantao
 */
@Data
@AllArgsConstructor
public class ResultDTO<T> {

    private Integer code;
    private String message;
    private T data;
}
