package com.cjt.trade.controller.backend.mall;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.constant.CategoryEnum;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.CategoryDto;
import com.cjt.trade.dto.ResultDTO;
import com.cjt.trade.model.Category;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Product;
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
public class ProductController extends BaseController {

    @Resource
    private ICategoryService categoryService;

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "/productList.action")
    public String productList() {
        return "backend/mall/productList";
    }

    @ResponseBody
    @RequestMapping("/getAllProducts.action")
    public JSONObject getAllProducts(int page, int rows, CategoryDto dto) {
        dto.setType(CategoryEnum.PRODUCT.getType());
        dto.setStart((page - 1) * rows);
        dto.setLimit(rows);
        List<Product> products = categoryService.listProducts(dto);
        int count = categoryService.countCategoriesByDto(dto);
        return JSONUtil.toGridJson(products, count);
    }

    @ResponseBody
    @RequestMapping(value = "/addProduct.action")
    public ResultDTO addproduct(MultipartFile file, Product product) throws IOException {
        if (file != null) {
            product.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        }
        Category category = new Category();
        BeanUtils.copyProperties(product, category);
        category.setParentId(product.getBrandId());
        category.setType(CategoryEnum.PRODUCT.getType());
        categoryService.saveCategory(category);
        return success();
    }

    @ResponseBody
    @RequestMapping(value = "/updateProduct.action")
    public ResultDTO updateProduct(MultipartFile file, Product product) throws IOException {
        if (file != null) {
            product.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        }
        Category category = new Category();
        BeanUtils.copyProperties(product, category);
        category.setParentId(product.getBrandId());
        int lines = categoryService.updateCategory(category);
        return lines > 0 ? success() : failed("更新失败");
    }

    @ResponseBody
    @RequestMapping(value = "/getProductById.action")
    public Product getproductById(int id) {
        return categoryService.getProductById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteProductById.action")
    public ResultDTO deleteProductById(int id) {
        int lines = categoryService.removeCategoryById(id);
        return lines > 0 ? success() : failed("删除失败");
    }

    @ResponseBody
    @RequestMapping("/listProductsOpt.action")
    public List<MapModel> listProductsOpt(int parentId) {
        return categoryService.listProductsOptByParentId(parentId);
    }
}
