package com.cjt.trade.controller.backend.mall;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Product;
import com.cjt.trade.service.IProductService;
import com.cjt.trade.service.IUploadService;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private IProductService productService;

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "/productList.action")
    public String productList() {
        return "backend/mall/productList";
    }

    @RequestMapping(value = "/getAllProducts.action")
    @ResponseBody
    public JSONObject getAllProducts(int page, int rows, BaseDto dto) {
        dto.setStart((page - 1) * rows);
        dto.setLimit(rows);
        List<ProductVo> vos = productService.getAllProducts(dto);
        int count = productService.getAllProductsCount(dto);
        return JSONUtil.toGridJson(vos, count);
    }

    @RequestMapping(value = "/addProduct.action")
    public String addproduct(MultipartFile file, Product product, Model model) throws IOException {
        product.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        int lines = productService.insertProduct(product);
        if (lines > 0) {
            model.addAttribute("returnUrl", "productAdd.action");
            return "success";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/updateProduct.action")
    public String updateProduct(MultipartFile file, Product product) throws IOException {
        product.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        int lines = productService.updateProduct(product);
        if (lines > 0) {
            return productList();
        }
        return "ERROR";
    }

    @RequestMapping(value = "/productAdd.action")
    public String productAdd() {
        return "backend/mall/productAdd";
    }

    @RequestMapping(value = "/getProductById.action")
    @ResponseBody
    public Product getproductById(int id) {
        return productService.getProductById(id);
    }

    @RequestMapping(value = "/deleteProductById.action")
    @ResponseBody
    public boolean deleteProductById(int id) {
        Product product = getproductById(id);
        FileUtil.deleteFile(product.getLogoRealUrl());
        int lines = productService.deleteProduct(id);
        return lines > 0;
    }
}
