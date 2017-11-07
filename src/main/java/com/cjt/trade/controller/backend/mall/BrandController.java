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
import com.cjt.trade.model.Brand;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.util.PathUtil;

@Controller
@RequestMapping("/backend")
public class BrandController extends BaseController {

  @Resource
  private ICategoryService categoryService;

  @RequestMapping("/brandList.action")
  public String brandList() {
    return "backend/mall/brandList";
  }

  @ResponseBody
  @RequestMapping("/getAllBrands.action")
  public JSONObject getAllBrands(int page, int rows, CategoryDto dto) {
    dto.setType(CategoryEnum.BRAND.getType());
    dto.setStart((page - 1) * rows);
    dto.setLimit(rows);
    List<Brand> brands = categoryService.listBrands(dto);
    int count = categoryService.countCategoriesByDto(dto);
    return JSONUtil.toGridJson(brands, count);
  }

  @ResponseBody
  @RequestMapping("/addBrand.action")
  public ResultDto addbrand(MultipartFile file, Brand brand) {
    setLogoUrl(file, brand);
    Category category = new Category();
    BeanUtils.copyProperties(brand, category);
    category.setParentId(brand.getTradeId());
    category.setType(CategoryEnum.BRAND.getType());
    categoryService.saveCategory(category);
    return success("添加成功", null);
  }

  @ResponseBody
  @RequestMapping("/updateBrand.action")
  public ResultDto updateBrand(MultipartFile file, Brand brand) {
    setLogoUrl(file, brand);
    Category category = new Category();
    BeanUtils.copyProperties(brand, category);
    category.setParentId(brand.getTradeId());
    int lines = categoryService.updateCategory(category);
    return lines > 0 ? success("更新成功", null) : failed("更新失败");
  }

  public void setLogoUrl(MultipartFile file, Brand brand) {
    if (file == null || file.getSize() == 0) {
      return;
    }
    FileUtil.deleteFile(brand.getLogoRealUrl());
    String path = PathUtil.getBrandPath();
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
    brand.setLogoRealUrl(targetFile.getAbsolutePath());
    brand.setLogoUrl(PathUtil.getBrandUrlPath() + fileName);
  }

  @ResponseBody
  @RequestMapping("/getBrandById.action")
  public Brand getBrandById(int id) {
    return categoryService.getBrandById(id);
  }

  @ResponseBody
  @RequestMapping("/deleteBrandById.action")
  public boolean deleteBrandById(int id) {
    Brand brand = getBrandById(id);
    // 删除原本的图片
    FileUtil.deleteFile(brand.getLogoRealUrl());
    int lines = categoryService.removeCategoryById(id);
    return lines > 0;
  }

  @ResponseBody
  @RequestMapping("/listBrandsOpt.action")
  public List<MapModel> listTradesOpt(int parentId){
    return categoryService.listBrandsOptByParentId(parentId);
  }
}
