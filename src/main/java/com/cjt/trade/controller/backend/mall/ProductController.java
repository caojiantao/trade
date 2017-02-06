package com.cjt.trade.controller.backend.mall;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Product;
import com.cjt.trade.service.IProductService;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.util.PathUtil;
import com.cjt.trade.vo.ProductVo;

@Controller
@RequestMapping(value="/backend/")
public class ProductController extends BaseController {

	@Resource
	private IProductService productService;
	
	@RequestMapping(value = "/productList.action")
	public String productList() {
		return "backend/mall/productList";
	}

	@RequestMapping(value = "getAllProducts.action")
	@ResponseBody
	public JSONObject getAllProducts(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<ProductVo> vos = productService.getAllProducts(dto);
		int count = productService.getAllProductsCount(dto);
		return JSONUtil.toGridJson(vos, count);
	}
	
	@RequestMapping(value = "getAllProductsOptByBrandId.action")
	@ResponseBody
	public List<MapModel> getAllBrandsOptByTradeId(int brandId){
		return productService.getAllProductsOptByBrandId(brandId);
	}
	
	@RequestMapping(value = "addProduct.action")
	public String addproduct(MultipartFile file, Product product, Model model) {
		setLogoUrl(file, product);
		int lines = productService.insertProduct(product);
		if (lines > 0) {
			model.addAttribute("returnUrl", "productAdd.action");
			return "success";
		}
		return "ERROR";
	}
	
	@RequestMapping(value = "updateProduct.action")
	public String updateProduct(MultipartFile file, Product product, Model model){
		setLogoUrl(file, product);
		int lines = productService.updateProduct(product);
		if (lines > 0) {
			return productList();
		}
		return "ERROR";
	}
	
	public void setLogoUrl(MultipartFile file, Product product){
		if (file.getSize() == 0) {
			return;
		}
		FileUtil.deleteFile(product.getLogoRealUrl());
        String path = PathUtil.getProductPath();
        String fileName = FileUtil.getFileName(file.getOriginalFilename());
        File targetFile = new File(path, fileName);
        if(targetFile.exists()){
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

	@RequestMapping(value = "productAdd.action")
	public String productAdd() {
		return "backend/mall/productAdd";
	}
	
	@RequestMapping(value = "getProductById.action")
	@ResponseBody
	public Product getproductById(int id) {
		return productService.getProductById(id);
	}

	@RequestMapping(value = "deleteProductById.action")
	@ResponseBody
	public boolean deleteProductById(int id) {
		Product product = getproductById(id);
		FileUtil.deleteFile(product.getLogoRealUrl());
		int lines = productService.deleteProduct(id);
		return lines > 0;
	}
}
