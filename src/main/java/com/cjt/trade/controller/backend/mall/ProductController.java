package com.cjt.trade.controller.backend.mall;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import com.cjt.trade.constant.CategoryEnum;
import com.cjt.trade.dto.CategoryDto;
import com.cjt.trade.dto.ResultDto;
import com.cjt.trade.model.Category;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.service.ICategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Product;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.util.PathUtil;

@Controller
@RequestMapping("/backend")
public class ProductController extends BaseController {

  @Resource
  private ICategoryService categoryService;

  @RequestMapping("/productList.action")
  public String productList() {
    return "backend/mall/productList";
  }

  @RequestMapping("/getAllProducts.action")
  @ResponseBody
  public JSONObject getAllProducts(int page, int rows, CategoryDto dto) {
    dto.setType(CategoryEnum.PRODUCT.getType());
    dto.setStart((page - 1) * rows);
    dto.setLimit(rows);
    List<Product> products = categoryService.listProducts(dto);
    int count = categoryService.countCategoriesByDto(dto);
    return JSONUtil.toGridJson(products, count);
  }

  @ResponseBody
  @RequestMapping("/addProduct.action")
  public ResultDto addproduct(MultipartFile file, Product product) {
    setLogoUrl(file, product);
    Category category = new Category();
    BeanUtils.copyProperties(product, category);
    category.setParentId(product.getBrandId());
    category.setType(CategoryEnum.PRODUCT.getType());
    categoryService.saveCategory(category);
    return success("添加成功", null);
  }

  @ResponseBody
  @RequestMapping("/updateProduct.action")
  public ResultDto updateProduct(MultipartFile file, Product product) {
    setLogoUrl(file, product);
    Category category = new Category();
    BeanUtils.copyProperties(product, category);
    category.setParentId(product.getBrandId());
    int lines = categoryService.updateCategory(category);
    return lines > 0 ? success("更新成功", null) : failed("更新失败");
  }

  public void setLogoUrl(MultipartFile file, Product product) {
    if (file == null || file.getSize() == 0) {
      return;
    }
    FileUtil.deleteFile(product.getLogoRealUrl());
    String path = PathUtil.getProductPath();
    String fileName = FileUtil.getFileName(file.getOriginalFilename());
    File targetFile = new File(path, fileName);
    if (targetFile.exists()) {
      targetFile.delete();
    }
    targetFile.mkdirs();
    //保存
    try {
      file.transferTo(targetFile);
    } catch (Exception e) {
      e.printStackTrace();
    }
    product.setLogoRealUrl(targetFile.getAbsolutePath());
    product.setLogoUrl(PathUtil.getProductUrlPath() + fileName);
  }

  @ResponseBody
  @RequestMapping("/getProductById.action")
  public Product getproductById(int id) {
    return categoryService.getProductById(id);
  }

  @ResponseBody
  @RequestMapping("/deleteProductById.action")
  public boolean deleteProductById(int id) {
    Product product = getproductById(id);
    FileUtil.deleteFile(product.getLogoRealUrl());
    int lines = categoryService.removeCategoryById(id);
    return lines > 0;
  }

  @ResponseBody
  @RequestMapping("/listProductsOpt.action")
  public List<MapModel> listProductsOpt(int parentId){
    return categoryService.listProductsOptByParentId(parentId);
  }
}
