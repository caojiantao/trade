package com.cjt.trade.controller.front;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.constant.GlobalConfig;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.CartDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.dto.ResultDTO;
import com.cjt.trade.model.Goods;
import com.cjt.trade.model.Order;
import com.cjt.trade.model.User;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.service.IOrderService;
import com.cjt.trade.service.IUserService;
import com.cjt.trade.util.CookieUtil;
import com.cjt.trade.util.DateUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.util.SCaptcha;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/api")
public class APIController extends BaseController {

    @Resource
    private IGoodsService goodsService;
    @Resource
    private IUserService userService;
    @Resource
    private IOrderService orderService;

    @RequestMapping(value = "/listLatestGoods.action")
    @ResponseBody
    public JSONObject listLatestGoods(GoodsDto dto) {
        List<Goods> goods = goodsService.listLatestGoods(dto);
        int goodsCount = goodsService.countLatestGoods(dto);
        return JSONUtil.toGridJson(goods, goodsCount);
    }

    @RequestMapping(value = "/saveCart.action")
    @ResponseBody
    public void saveCart(HttpServletRequest request, HttpServletResponse response, CartDto dto) {
        Goods goods = goodsService.getGoodsById(dto.getGoodsId());
        if(goods == null){
            return;
        }

        // 获取cookies中购物车
        Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
        if (cookie == null) {
            // 初始化购物车本地cookie
            cookie = new Cookie(CookieUtil.CART, "");
        }
        // JSON化购物车cookie的value，方便修改
        JSONArray array = JSONArray.parseArray(cookie.getValue());
        if (array == null) {
            array = new JSONArray();
        }
        boolean exist = false;
        for (Object obj : array) {
            if (((JSONObject) obj).getIntValue(CookieUtil.GOODS_ID) == (dto.getGoodsId())) {
                // 直接修改obj，这样便间接修改了array
                ((JSONObject) obj).put(CookieUtil.COUNT, ((JSONObject) obj).getIntValue(CookieUtil.COUNT) + dto.getCount());
                exist = true;
                break;
            }
        }
        if (!exist) {
            dto.setBuyPrice(goods.getPrice());
            // 购物车中不存在添加的商品时添加
            array.add(dto);
        }
        cookie.setValue(array.toJSONString());
        // cookie值了maxAge和path后，代码是取不到值得，但是实质上存在。所以必须每次添加覆盖，必须修改他的maxAge/path，这样才能覆盖，并且改变生存周期
        cookie.setMaxAge(60 * 60 * 24);
        cookie.setPath("/");
        // 添加或者覆盖cookie保存至客户端
        response.addCookie(cookie);
    }

    @RequestMapping(value = "/updateCart.action")
    @ResponseBody
    public void updateCart(HttpServletRequest request, HttpServletResponse response, CartDto dto) {
        // 获取cookies中购物车
        Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
        if (cookie != null) {
            // JSON化购物车cookie的value，方便修改
            JSONArray array = JSONArray.parseArray(cookie.getValue());
            JSONObject curDto = null;
            for (Object obj : array) {
                if (((JSONObject) obj).getIntValue(CookieUtil.GOODS_ID) == (dto.getGoodsId())) {
                    curDto = (JSONObject)obj;
                    // 直接修改obj，这样便间接修改了array
                    curDto.put(CookieUtil.COUNT, dto.getCount());
                    break;
                }
            }
            if (dto.getCount() == 0 && curDto != null) {
                // 删除商品
                array.remove(curDto);
            }
            cookie.setValue(array.toJSONString());
            // cookie值了maxAge和path后，代码是取不到值得，但是实质上存在。所以必须每次添加覆盖，必须修改他的maxAge/path，这样才能覆盖，并且改变生存周期
            cookie.setMaxAge(60 * 60 * 24);
            cookie.setPath("/");
            // 添加或者覆盖cookie保存至客户端
            response.addCookie(cookie);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/register.action")
    public ResultDTO register(String email, String password) {
        if (userService.countUserByEmail(email) > 0) {
            return failed("该邮箱已经注册");
        }
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        userService.register(user);
        return success();
    }

    @RequestMapping(value = "/login.action")
    @ResponseBody
    public User login(String email, String password, HttpSession session, HttpServletResponse response) {
        User user = userService.login(email, password);
        if (user != null) {
            String name = "id";
            int second = 1000 * 60 * 60 * 24;
            // session跟踪
            Cookie cookie = new Cookie(GlobalConfig.SESSION_ID, session.getId());
            cookie.setPath("/");
            cookie.setMaxAge(second);
            response.addCookie(cookie);

            session.setAttribute(name, user.getId());
            session.setMaxInactiveInterval(second);
        }
        return user;
    }

    @RequestMapping(value = "/updateUser.action")
    @ResponseBody
    public ResultDTO updateUser(User user) {
        return userService.updateUser(user) > 0 ? success() : failed("更新失败");
    }

    @RequestMapping(value = "/logout.action")
    @ResponseBody
    public void logout(HttpSession session) {
        session.invalidate();
    }

    @RequestMapping(value = "/pay.action")
    @ResponseBody
    public boolean pay(HttpServletRequest request, HttpServletResponse response, Order order, HttpSession session) {
        Cookie cookie = CookieUtil.getCookieByName(CookieUtil.CART, request);
        if (cookie != null) {
            // 存储订单信息至后台
            JSONArray array = JSONArray.parseArray(cookie.getValue());
            order.setNo(DateUtil.parseDate(new Date(), "yyyyMMddHHmmss"));
            order.setGoodsJson(array.toJSONString());
            Integer userId = (Integer) session.getAttribute("id");
            if(userId!=null){
                order.setUserId(userId.toString());
            }
            orderService.addOrder(order);

            // 清空购物车
            cookie.setPath("/");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            return true;
        }
        return false;
    }

    /**
     * @description 生成图片验证码
     */
    @RequestMapping(value = "/verification", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public void verification(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        //实例生成验证码对象
        SCaptcha instance = new SCaptcha();
        //将验证码存入session
        session.setAttribute("verification", instance.getCode());
        //向页面输出验证码图片
        instance.write(response.getOutputStream());
    }
}
