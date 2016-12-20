package com.cjt.trade.controller.backend.page;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;

@Controller
@RequestMapping(value="/backend")
public class PageInfoController extends BaseController{
	
	private static final Log log = LogFactory.getLog(BaseController.class);
	
	@Resource
	private IPageInfoService pageInfoService;
	
	@RequestMapping("/pageInfo.action")
	public String pageInfo(Integer type, String method, Model model){
		log.warn("type:" + type + "; method:" + method);
		PageInfo pageInfo = pageInfoService.getPageInfo(type);
		if (pageInfo == null) {
			pageInfo = new PageInfo();
			pageInfo.setType(type);
		}
		model.addAttribute("pageInfo", pageInfo);
		if (type != 8) {
			// 信息单页
		} else {
			// 文章信息
			model.addAttribute("method", method);
		}
		return "backend/page/pageInfo";
	}
	
	@RequestMapping("/updatePageInfo.action")
	public String updatePageInfo(PageInfo pageInfo, Model model){
		int count;
		// 通过页面请求参数id判断insert还是update
		if (pageInfo.getId() == null || pageInfo.getId() == 0) {
			count = pageInfoService.insertPageInfo(pageInfo);
		} else {
			count = pageInfoService.updatePageInfo(pageInfo);
		}
		model.addAttribute("returnUrl", "pageInfo.action?type=" + pageInfo.getType());
		return count > 0 ? "success" : "error";
	}
}
