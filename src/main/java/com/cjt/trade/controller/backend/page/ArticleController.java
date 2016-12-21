package com.cjt.trade.controller.backend.page;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.PageInfoVo;

@Controller
@RequestMapping(value="/backend")
public class ArticleController extends BaseController {

	@Resource
	private IPageInfoService pageInfoService;
	
	/**
	 * 文章列表
	 */
	@RequestMapping(value = "/articleList.action")
	public String articleList() {
		return "backend/page/articleList";
	}

	/**
	 * 文章添加
	 */
	@RequestMapping(value = "articleAdd.action")
	public String articleAdd() {
		return "backend/page/articleAdd";
	}

	@RequestMapping(value = "getAllArticles.action")
	@ResponseBody
	public JSONObject getAllArticles(int page, int rows, PageInfoDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		// 手动设置type为8
		dto.setType(8);
		List<PageInfoVo> vos = pageInfoService.getAllPageInfos(dto);
		int count = pageInfoService.getAllPageInfosCount(dto);
		return JSONUtil.toGridJson(vos, count);
	}
	
	@RequestMapping(value = "addArticle.action")
	public String addArticle(PageInfo pageInfo, Model model) {
		// 手动设置type，表示类型为文章
		pageInfo.setType(8);
		int lines = pageInfoService.insertPageInfo(pageInfo);
		if (lines > 0) {
			model.addAttribute("returnUrl", "articleAdd.action");
			return "success";
		}
		return "ERROR";
	}
	
	@RequestMapping(value = "updateArticle.action")
	public String updateArticle(PageInfo pageInfo, Model model){
		int lines = pageInfoService.updatePageInfo(pageInfo);
		if (lines > 0) {
			return articleList();
		}
		return "ERROR";
	}

	@RequestMapping(value = "getArticle.action")
	@ResponseBody
	public PageInfo getArticle(int id) {
		return pageInfoService.getPageInfo(id, 8);
	}
	
	@RequestMapping(value = "deleteArticle.action")
	@ResponseBody
	public boolean deleteArticle(int id){
		int lines = pageInfoService.deletePageInfo(id);
		return lines > 0;
	}
}
