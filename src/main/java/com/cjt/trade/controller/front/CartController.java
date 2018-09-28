package com.cjt.trade.controller.front;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.dto.CartDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.model.User;
import com.cjt.trade.service.IDictionaryService;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.util.CookieUtil;

@Controller
@RequestMapping(value = "/")
public class CartController extends BaseFrontController {

    @Resource
    private IGoodsService goodsService;
    @Resource
    private IUserService userService;
    @Resource
    private IDictionaryService dictionaryService;

    /**
     * 购物车页面
     */
    @RequestMapping(value = "/cart.action")
    public String shopcart(HttpServletRequest request, Model model) {
        initWebSite(model);

        Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
        JSONArray goodsArray = new JSONArray();
        if (cookie != null) {
            // cookie不是null遍历
            JSONArray array = JSONArray.parseArray(cookie.getValue());
            for (Object object : array) {
                CartDto dto = JSONObject.toJavaObject((JSONObject) object, CartDto.class);
                Goods goods = goodsService.getGoodsById(dto.getGoodsId());
                JSONObject obj = new JSONObject();
                obj.put("goods", goods);
                obj.put("count", dto.getCount());
                obj.put("buyPrice", goods.getPrice());
                goodsArray.add(obj);
            }
        }
        model.addAttribute("data", goodsArray);

        // 获取当前用户信息
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        if (id != null && id != 0) {
            User user = userService.getUserById(id);
            model.addAttribute("user", user);
        }

        // 县郡
        Map<String, String> countiesMap = dictionaryService.getOptsBySetId(1);
        model.addAttribute("countiesMap", countiesMap);
        return "/front/build/cart";
    }
}
