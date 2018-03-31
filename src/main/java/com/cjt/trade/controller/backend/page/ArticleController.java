package com.cjt.trade.controller.backend.page;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.constant.PageEnum;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.PageInfoDto;
import com.cjt.trade.dto.ResultDto;
import com.cjt.trade.model.PageInfo;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.PageInfoVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/backend")
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

    @ResponseBody
    @RequestMapping(value = "/getAllArticles.action")
    public JSONObject getAllArticles(int page, int rows, PageInfoDto dto) {
        dto.setStart((page - 1) * rows);
        dto.setLimit(rows);
        dto.setType(PageEnum.wzxx.getType());
        List<PageInfoVo> vos = pageInfoService.getAllPageInfos(dto);
        int count = pageInfoService.getAllPageInfosCount(dto);
        return JSONUtil.toGridJson(vos, count);
    }

    @ResponseBody
    @RequestMapping(value = "/addArticle.action")
    public ResultDto addArticle(PageInfo pageInfo) {
        // 手动设置type，表示类型为文章
        pageInfo.setType(PageEnum.wzxx.getType());
        int lines = pageInfoService.insertPageInfo(pageInfo);
        return lines > 0 ? success("添加成功", null) : failed("添加失败");
    }

    @ResponseBody
    @RequestMapping(value = "/updateArticle.action")
    public ResultDto updateArticle(PageInfo pageInfo) {
        int lines = pageInfoService.updatePageInfo(pageInfo);
        return lines > 0 ? success("更新成功", null) : failed("更新失败");
    }

    @ResponseBody
    @RequestMapping(value = "/getArticle.action")
    public PageInfo getArticle(int id) {
        PageInfoDto dto = new PageInfoDto();
        // 手动设置type为8
        dto.setType(PageEnum.wzxx.getType());
        dto.setId(id);
        return pageInfoService.getPageInfo(dto);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteArticle.action")
    public boolean deleteArticle(int id) {
        int lines = pageInfoService.deletePageInfo(id);
        return lines > 0;
    }
}
