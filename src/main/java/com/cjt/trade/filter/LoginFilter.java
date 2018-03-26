package com.cjt.trade.filter;

import com.cjt.trade.constant.GlobalConfig;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月20日
 */
@WebFilter
public class LoginFilter implements Filter {

  public LoginFilter() {
  }

  @Override
  public void destroy() {
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
          throws IOException, ServletException {
    // 判断是否是http请求
    if (!(request instanceof HttpServletRequest) || !(response instanceof HttpServletResponse)) {
      throw new ServletException("OncePerRequestFilter just supports HTTP requests");
    }
    // 获得在下面代码中要用的request,response,session对象
    HttpServletRequest httpRequest = (HttpServletRequest) request;
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    HttpSession session = httpRequest.getSession(true);
    // 路径中包含这些字符串的,可以不用登录直接访问
    String[] strs = {"login", "front"};
    StringBuffer url = httpRequest.getRequestURL();
    // 将访问路径转换为小写比较
    String lowerUrl = new String(url).toLowerCase();
    for (String str : strs) {
      if (lowerUrl.contains(str)) {
        chain.doFilter(request, response);
        return;
      }
    }
    // 从session中获取用户信息
    String account = (String) session.getAttribute(GlobalConfig.ACCOUNT_SESSION);
    if (null == account || "".equals(account)) {
      // 用户不存在,踢回登录页面
      String returnUrl = "login.action";
      httpRequest.setCharacterEncoding("UTF-8");
      httpResponse.setContentType("text/html; charset=UTF-8");
      httpResponse.getWriter().println(
              "<script language=\"javascript\">"
                      + "alert(\"您还没有登录，请先登录!\");"
                      + "if(window.opener==null){"
                      + "window.top.location.href=\"" + returnUrl + "\";"
                      + "} else{"
                      + "window.opener.top.location.href=\"" + returnUrl + "\";"
                      + "window.close();"
                      + "}"
                      + "</script>");
    } else {
      chain.doFilter(request, response);
    }
  }

  @Override
  public void init(FilterConfig fConfig) {
  }
}
