package com.cjt.trade.controller.front;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.constant.PageEnum;
import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.model.Navigation;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.PageInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author caojiantao
 * @since 2018-03-31 20:32:30
 */
@RequestMapping("/newest")
@Controller
public class NewestController extends BaseFrontController {

    @Autowired
    private IPageInfoService pageInfoService;

    @RequestMapping("/index.action")
    public String newest(Model model, HttpServletRequest request) {
        initFixModule(request, model);
        // 面包屑
        List<Navigation> navs = new ArrayList<Navigation>();
        navs.add(new Navigation("最新情报", ""));
        model.addAttribute("navs", navs);
        return "front/build/newest";
    }

    @ResponseBody
    @RequestMapping("/listNewest.action")
    public JSONObject listNewest(PageInfoDto dto) {
        dto.setType(PageEnum.wzxx.getType());
        List<PageInfoVo> infos = pageInfoService.getAllPageInfos(dto);
        int count = pageInfoService.getAllPageInfosCount(dto);
        return JSONUtil.toGridJson(infos, count);
    }
}
