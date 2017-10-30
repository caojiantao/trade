package com.cjt.trade.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Advertisement;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.Goods;
import com.cjt.trade.service.IAdvertisementService;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.vo.front.CategoryVo;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseFrontController {

  @Resource
  private IAdvertisementService advertisementService;
  @Resource
  private IGoodsService goodsService;
  @Resource
  private IBrandService brandService;

  @RequestMapping(value = "/index")
  public String index(HttpServletRequest request, Model model) {
    // 固定化模块
    List<CategoryVo> vos = initFixModule(request, model);
    // 广告banner
    initAdBanner(model);
    // 最新商品
    initLatestGoods(model);
    // 滚动商品
    initScrollGoods(model);
    // 热卖商品
    initHotGoods(model);
    // 各分类下对应的最新商品
    initLastestCategoryGoods(model, vos);
    // 品牌专区
    initShowBrand(model);
    return "front/build/index";
  }

  /**
   * 获取广告轮播图
   */
  public void initAdBanner(Model model) {
    List<Advertisement> ads = advertisementService.listAllAds();
    model.addAttribute("ads", ads);
  }

  /**
   * 获取首页滚动商品
   */
  public void initScrollGoods(Model model) {
    List<Goods> scrollGoods = goodsService.getScrollGoods();
    model.addAttribute("scrollGoods", scrollGoods);
  }

  /**
   * 获取人气商品
   */
  public void initHotGoods(Model model) {
    List<Goods> hotGoods = goodsService.getHotGoods();
    model.addAttribute("hotGoods", hotGoods);
  }

  /**
   * 获取最新指定条目数商品
   */
  public void initLatestGoods(Model model) {
    GoodsDto dto = new GoodsDto();
    dto.setLimit(showCount);
    List<Goods> newGoods = goodsService.listLatestGoods(dto);
    model.addAttribute("latestGoods", newGoods);
  }

  /**
   * 各类指定条目的最新商品
   */
  public void initLastestCategoryGoods(Model model, List<CategoryVo> vos) {
    List<String> tradeNames = new ArrayList<String>();
    List<List<Goods>> goodsList = new ArrayList<List<Goods>>();
    GoodsDto dto = new GoodsDto();
    dto.setLimit(showCount);
    for (CategoryVo vo : vos) {
      tradeNames.add(vo.getTitle());
      dto.setTradeId(vo.getId());
      List<Goods> goods = goodsService.listLatestGoods(dto);
      goodsList.add(goods);
    }
    model.addAttribute("tabNames", tradeNames);
    model.addAttribute("tabGoods", goodsList);
  }

  /**
   * 获取品牌专区推荐
   */
  public void initShowBrand(Model model) {
    List<Brand> brands = brandService.listShowBrands();
    model.addAttribute("brands", brands);
  }
}
