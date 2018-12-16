package com.cjt.trade.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @author caojiantao
 */
@Data
@AllArgsConstructor
public class ResultDTO<T> {

    private Integer code;
    private String message;
    private T data;
    private Map<String, Object> attr;

    public static ResultDTO success(){
        return new ResultDTO(200, "", null, null);
    }

    public static ResultDTO failure(){
        return new ResultDTO(500, "", null, null);
    }

    public ResultDTO setCode(int code){
        this.code = code;
        return this;
    }

    public ResultDTO setMessage(String message){
        this.message = message;
        return this;
    }

    public ResultDTO<T> setData(T data){
        this.data = data;
        return this;
    }

    public ResultDTO<T> put(String key, Object value){
        if(this.attr == null){
            this.attr = new HashMap<String, Object>();
        }
        this.attr.put(key, value);
        return this;
    }
}
