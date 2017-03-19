package com.cjt.trade.controller.backend;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjt.trade.constant.GlobalConfig;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Admin;
import com.cjt.trade.service.IAdminServcie;

@Controller
@RequestMapping("/backend")
public class BackendCotroller extends BaseController {
    
    @Resource
    private IAdminServcie adminServcie;
    
    @RequestMapping(value="/login.action")
    /**
     * 进入后台登录页面
     */
    public String login(HttpServletRequest request, Admin admin){
    	return "backend/login";
    }
    
    @RequestMapping(value="/loginIn.action")
    @ResponseBody
    /**
     * 发送登录信息，返回登录状态（页面获取的是字符串）
     */
    public boolean loginIn(HttpServletRequest request, HttpServletResponse response, Admin admin){
    	HttpSession session = request.getSession();
    	boolean status = false;
    	Admin adminDb = adminServcie.login(admin);
    	if (adminDb != null) {
        	// 设置服务器保持登录状态时间为15天
        	session.setMaxInactiveInterval(60 * 60 * 24 * 15);
    		session.setAttribute(GlobalConfig.ACCOUNT_SESSION, adminDb.getName());
    		// 同时设置本地保存登录状态同为15天
    		Cookie cookie = new Cookie(GlobalConfig.SESSION_ID, session.getId());
    		cookie.setPath("/");
    		cookie.setMaxAge(60 * 60 * 24 * 15);
    		response.addCookie(cookie);
    		status = true;
		}
    	return status;
    }
    
	@RequestMapping(value="/backend.action")
	/**
	 * 进入后台首页
	 */
	public String backend(){
        return "backend/index";
    }
}