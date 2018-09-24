package com.cjt.trade.controller.front;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Category;
import com.cjt.trade.model.Ems;
import com.cjt.trade.model.User;
import com.cjt.trade.model.Website;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.service.IEmsService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.service.IWebsiteService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BaseFrontController extends BaseController {

    @Value("${show_count}")
    public int showCount;

    @Resource
    private IWebsiteService websiteService;
    @Resource
    private IUserService userService;
    @Resource
    private IEmsService emsService;
    @Resource
    private ICategoryService categoryService;

    /**
     * 网站基本信息
     */
    void initWebSite(Model model) {
        Website website = websiteService.getWebsite();
        model.addAttribute("website", website);
    }

    /**
     * 左侧商品分类菜单
     */
    private void initCategory(Model model) {
        List<Category> categories = categoryService.listCategories();
        model.addAttribute("categories", categories);
    }

    /**
     * 获取最新指定条目数EMS信息
     */
    private void initEms(Model model) {
        BaseDto dto = new BaseDto();
        dto.setStart(0);
        dto.setLimit(showCount);
        List<Ems> emsList = emsService.getAllEms(dto);
        model.addAttribute("emsList", emsList);
    }

    /**
     * 初始化登录用户
     */
    private void initUser(Model model, HttpSession session) {
        Integer id = (Integer) session.getAttribute("id");
        if (id != null && id != 0) {
            User user = userService.getUserById(id);
            model.addAttribute("user", user);
        }
    }

    /**
     * header、left、footer三个固定的模块页面传值，返回左侧导航分类信息
     */
    void initFixModule(HttpServletRequest request, Model model) {
        initWebSite(model);
        initUser(model, request.getSession());
        initCategory(model);
        initEms(model);
    }
}
