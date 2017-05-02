package com.cjt.trade.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;

@Controller("pageInfoFrontCtl")
@RequestMapping(value="/")
public class PageInfoController extends BaseFrontController {

	@Resource
	private IPageInfoService pageInfoService;
	
	/**
	 * 信息单页
	 */
	@RequestMapping(value="/pageInfo.action")
	public String pageInfo(PageInfoDto dto, Model model, HttpServletRequest request){
		initFixModule(request, model);
		
		PageInfo pageInfo = pageInfoService.getPageInfo(dto);
		model.addAttribute("pageInfo", pageInfo);
		
		return "front/build/pageInfo";
	}
	
	@RequestMapping(value="/faq.action")
	public String faq(Model model, HttpServletRequest request){
		initFixModule(request, model);
		return "front/build/faq";
	}
}
