package com.cjt.trade.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.cjt.trade.model.Navigation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author caojiantao
 */
@Controller("pageInfoFrontCtl")
@RequestMapping(value = "/")
public class PageInfoController extends BaseFrontController {

    @Resource
    private IPageInfoService pageInfoService;

    /**
     * 信息单页
     */
    @RequestMapping(value = "/pageInfo.action")
    public String pageInfo(PageInfoDto dto, Model model, HttpServletRequest request) {
        initFixModule(request, model);
        PageInfo pageInfo = pageInfoService.getPageInfo(dto);
        model.addAttribute("pageInfo", pageInfo);
        // 面包屑导航
        List<Navigation> navs = new ArrayList<Navigation>();
        navs.add(getNav(Integer.parseInt(request.getParameter("type"))));
        model.addAttribute("navs", navs);
        return "front/build/pageInfo";
    }

    private Navigation getNav(int type) {
        Navigation nav = new Navigation();
        String navName = "";
        switch (type) {
            case 0:
                navName = "文章信息";
                break;
            case 1:
                navName = "会社概要";
                break;
            case 2:
                navName = "注文方法";
                break;
            case 3:
                navName = "重要事项";
                break;
            case 4:
                navName = "割引情报";
                break;
            case 5:
                navName = "注意事项";
                break;
            case 6:
                navName = "返品返金";
                break;
            case 7:
                navName = "营业时间";
                break;
            case 8:
                navName = "配送方式";
                break;
            default:
                break;
        }
        nav.setName(navName);
        return nav;
    }
}
