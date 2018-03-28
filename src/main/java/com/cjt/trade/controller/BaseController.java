package com.cjt.trade.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cjt.trade.dto.ResultDto;
import com.cjt.trade.util.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

/**
 * @author caojiantao
 */
public class BaseController {

    private final static Logger logger = Logger.getLogger(BaseController.class);

    public HttpServletRequest request;

    public HttpServletResponse response;

    public HttpSession session;

    /**
     * 该注释表示每个该类及子类的请求调用之前都回执行该方法
     */
    @ModelAttribute
    public void initReqResSession(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.session = request.getSession();
    }

    /**
     * 采用注解方式统一处理异常
     */
    @ExceptionHandler
    public void handleException(Exception ex) {
        logger.error(ExceptionUtils.toDetailStr(ex));
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }

    public ResultDto success() {
        return new ResultDto(true, "", null);
    }

    public ResultDto success(Object data) {
        return new ResultDto(true, "", data);
    }

    public ResultDto success(String msg, Object data) {
        return new ResultDto(true, msg, data);
    }

    public ResultDto failed(String message) {
        return new ResultDto(false, message, null);
    }
}

