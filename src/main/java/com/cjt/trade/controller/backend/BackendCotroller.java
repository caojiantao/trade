package com.cjt.trade.controller.backend;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cjt.trade.dto.ResultDto;
import com.cjt.trade.model.Menu;
import com.cjt.trade.service.IMenuService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjt.trade.constant.GlobalConfig;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Admin;
import com.cjt.trade.service.IAdminServcie;

import java.util.List;

@Controller
@RequestMapping("/backend")
public class BackendCotroller extends BaseController {

  @Resource
  private IAdminServcie adminServcie;

  @Resource
  private IMenuService menuService;

  @Value("${expiry}")
  private int expiry;

  @RequestMapping(value = "/login")
  public String login() {
    return "backend/login";
  }

  /**
   * 发送登录信息，返回登录状态（页面获取的是字符串）
   */
  @RequestMapping(value = "/loginIn")
  @ResponseBody
  public ResultDto loginIn(String account, String password) {
    HttpSession session = request.getSession();
    if (adminServcie.isValid(account, password)) {
      // 设置服务器保持登录状态时间为15天
      session.setMaxInactiveInterval(expiry);
      session.setAttribute(GlobalConfig.ACCOUNT_SESSION, account);
      // 同时设置本地保存登录状态同为15天
      Cookie cookie = new Cookie(GlobalConfig.SESSION_ID, session.getId());
      cookie.setPath("/backend/");
      cookie.setMaxAge(expiry);
      response.addCookie(cookie);
      return success();
    }
    return failed("登录失败！");
  }

  /**
   * 进入后台首页
   */
  @RequestMapping(value = "/backend")
  public String backend(Model model) {
    List<Menu> menus = menuService.listMenus();
    model.addAttribute("menus", menus);
    return "backend/index2";
  }
}