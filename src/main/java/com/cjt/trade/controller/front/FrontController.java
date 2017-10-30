package com.cjt.trade.controller.front;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Navigation;
import com.cjt.trade.model.Product;
import com.cjt.trade.model.Trade;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.service.IDictionaryService;
import com.cjt.trade.service.IEmsService;
import com.cjt.trade.service.IPageInfoService;
import com.cjt.trade.service.IProductService;
import com.cjt.trade.service.ITradeService;

@Controller
@RequestMapping("")
public class FrontController extends BaseFrontController {

  @Resource
  private IPageInfoService pageInfoService;
  @Resource
  private ITradeService tradeService;
  @Resource
  private IBrandService brandService;
  @Resource
  private IProductService productService;
  @Resource
  private IDictionaryService dictionaryService;
  @Resource
  private IEmsService emsService;

  /**
   * 品牌类型
   */
  @RequestMapping(value = "/brand")
  public String brand(int id, Model model, HttpServletRequest request) {
    initFixModule(request, model);

    // 品牌信息
    Brand brand = brandService.getBrandById(id);
    model.addAttribute("brand", brand);

    // 面包屑导航
    List<Navigation> navs = new ArrayList<Navigation>();
    navs.add(new Navigation(brand.getTradeName(), "/list?tradeId=" + brand.getTradeId()));
    navs.add(new Navigation(brand.getName(), ""));
    model.addAttribute("navs", navs);

    // 当前brand“品牌类型”所有product“产品类型”
    List<MapModel> maps = productService.getAllProductsOptByBrandId(id);
    model.addAttribute("maps", maps);

    return "front/build/brand";
  }

  /**
   * 产品类型
   */
  @RequestMapping(value = "/product")
  public String product(int id, Model model, HttpServletRequest request) {
    initFixModule(request, model);

    // 产品信息
    Product product = productService.getProductById(id);
    model.addAttribute("product", product);

    List<Navigation> navs = new ArrayList<Navigation>();
    navs.add(new Navigation(product.getTradeName(), "/list?tradeId=" + product.getTradeId()));
    navs.add(new Navigation(product.getBrandName(), "/brand?id=" + product.getBrandId()));
    navs.add(new Navigation(product.getName(), ""));
    model.addAttribute("navs", navs);

    // 当前brand“品牌类型”所有product“产品类型”
    List<MapModel> maps = productService.getAllProductsOptByBrandId(product.getBrandId());
    model.addAttribute("maps", maps);
    return "front/build/product";
  }

  /**
   * 商品列表
   */
  @RequestMapping(value = "/list")
  public String list(GoodsDto dto, Model model, HttpServletRequest request) {
    initFixModule(request, model);

    List<Navigation> navs = new ArrayList<Navigation>();
    if (dto.getTradeId() == 0) {
      navs.add(new Navigation("商品一览", ""));
    } else if (dto.getKeyword() != null && !dto.getKeyword().equals("")) {
      navs.add(new Navigation("检索", ""));
    } else {
      // 商品行业热卖 trade
      Trade trade = tradeService.getTradeById(dto.getTradeId());
      navs.add(new Navigation(trade.getName(), ""));
    }
    model.addAttribute("navs", navs);
    model.addAttribute("dto", dto);

    return "/front/build/list";
  }

  @RequestMapping(value = "/register")
  public String register(HttpServletRequest request, Model model) {
    initFixModule(request, model);
    return "/front/build/register";
  }

  @RequestMapping(value = "/user")
  public String user(HttpServletRequest request, Model model) {
    initFixModule(request, model);
    // 县郡
    Map<String, String> countiesMap = dictionaryService.getOptsBySetId(1);
    model.addAttribute("countiesMap", countiesMap);
    return "/front/build/user";
  }
}
