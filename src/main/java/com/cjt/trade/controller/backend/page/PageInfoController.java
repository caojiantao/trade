package com.cjt.trade.controller.backend.page;

import javax.annotation.Resource;

import com.cjt.trade.dto.ResultDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/backend")
public class PageInfoController extends BaseController {

  @Resource
  private IPageInfoService pageInfoService;

  @RequestMapping("/pageInfo.action")
  public String pageInfo(PageInfoDto dto, Model model) {
    PageInfo pageInfo = pageInfoService.getPageInfo(dto);
    if (pageInfo == null) {
      pageInfo = new PageInfo();
      pageInfo.setType(dto.getType());
    }
    model.addAttribute("pageInfo", pageInfo);
    return "backend/page/pageInfo";
  }

  @ResponseBody
  @RequestMapping("/savePageInfo.action")
  public ResultDto savePageInfo(PageInfo pageInfo) {
    int count = pageInfoService.insertPageInfo(pageInfo);
    return count > 0 ? success("保存成功", pageInfo) : failed("保存失败");
  }

  @ResponseBody
  @RequestMapping("/updatePageInfo.action")
  public ResultDto updatePageInfo(PageInfo pageInfo) {
    int count = pageInfoService.updatePageInfo(pageInfo);
    return count > 0 ? success("更新成功", pageInfo) : failed("更新失败");
  }
}
