package com.cjt.trade.controller.backend.mall;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.constant.CategoryEnum;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.CategoryDto;
import com.cjt.trade.dto.ResultDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.Category;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.service.ICategoryService;
import com.cjt.trade.service.IUploadService;
import com.cjt.trade.util.JSONUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping(value = "/backend")
public class BrandController extends BaseController {

    @Resource
    private ICategoryService categoryService;

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "/brandList.action")
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
    @RequestMapping(value = "/addBrand.action")
    public ResultDto addbrand(MultipartFile file, Brand brand) throws IOException {
        if (file != null) {
            brand.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        }
        Category category = new Category();
        BeanUtils.copyProperties(brand, category);
        category.setParentId(brand.getTradeId());
        category.setType(CategoryEnum.BRAND.getType());
        categoryService.saveCategory(category);
        return success("添加成功", null);
    }

    @ResponseBody
    @RequestMapping(value = "/updateBrand.action")
    public ResultDto updateBrand(MultipartFile file, Brand brand) throws IOException {
        if (file != null) {
            brand.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        }
        Category category = new Category();
        BeanUtils.copyProperties(brand, category);
        category.setParentId(brand.getTradeId());
        int lines = categoryService.updateCategory(category);
        return lines > 0 ? success("更新成功", null) : failed("更新失败");
    }

    @ResponseBody
    @RequestMapping(value = "/getBrandById.action")
    public Brand getBrandById(int id) {
        return categoryService.getBrandById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteBrandById.action")
    public boolean deleteBrandById(int id) {
        int lines = categoryService.removeCategoryById(id);
        return lines > 0;
    }

    @ResponseBody
    @RequestMapping("/listBrandsOpt.action")
    public List<MapModel> listTradesOpt(int parentId) {
        return categoryService.listBrandsOptByParentId(parentId);
    }
}
