package com.cjt.trade.controller;

import com.cjt.trade.dto.ResultDTO;
import com.cjt.trade.util.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author caojiantao
 */
public class BaseController {

    private final static Logger logger = Logger.getLogger(BaseController.class);

    /**
     * 采用注解方式统一处理异常
     */
    @ExceptionHandler
    public void handleException(Exception ex) {
        logger.error(ExceptionUtils.toDetailStr(ex));
    }

    public ResultDTO<Object> success(){
        return new ResultDTO<Object>(200, "", null, null);
    }

    public ResultDTO<Object> failed(String msg){
        return new ResultDTO<Object>(500, msg, null,null);
    }
}

