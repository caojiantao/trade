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
import com.cjt.trade.model.Brand;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.util.PathUtil;
import com.cjt.trade.vo.BrandVo;

@Controller
@RequestMapping(value="/backend/")
public class BrandController extends BaseController {
	
	@Resource
	private IBrandService brandService;
	
	@RequestMapping(value = "/brandList.action")
	public String brandList() {
		return "backend/mall/brandList";
	}

	@RequestMapping(value = "getAllBrands.action")
	@ResponseBody
	public JSONObject getAllBrands(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<BrandVo> vos = brandService.getAllBrands(dto);
		int count = brandService.getAllBrandsCount(dto);
		return JSONUtil.toGridJson(vos, count);
	}
	
	@RequestMapping(value = "getAllBrandsOptByTradeId.action")
	@ResponseBody
	public List<MapModel> getAllBrandsOptByTradeId(int tradeId){
		return brandService.getAllBrandsOptByTradeId(tradeId);
	}
	
	@RequestMapping(value = "addBrand.action")
	public String addbrand(MultipartFile file, Brand brand, Model model) {
		setLogoUrl(file, brand);
		int lines = brandService.insertBrand(brand);
		if (lines > 0) {
			model.addAttribute("returnUrl", "brandAdd.action");
			return "success";
		}
		return "ERROR";
	}
	
	@RequestMapping(value = "updateBrand.action")
	public String updateBrand(MultipartFile file, Brand brand, Model model){
		setLogoUrl(file, brand);
		int lines = brandService.updateBrand(brand);
		if (lines > 0) {
			return brandList();
		}
		return "ERROR";
	}
	
	public void setLogoUrl(MultipartFile file, Brand brand){
		if (file.getSize() == 0) {
			return;
		}
		FileUtil.deleteFile(brand.getLogoRealUrl());
        String path = PathUtil.getBrandPath();
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
        brand.setLogoRealUrl(targetFile.getAbsolutePath());
        brand.setLogoUrl(PathUtil.getBrandUrlPath() + fileName);
	}

	@RequestMapping(value = "brandAdd.action")
	public String brandAdd() {
		return "backend/mall/brandAdd";
	}
	
	@RequestMapping(value = "getBrandById.action")
	@ResponseBody
	public Brand getbrandById(int id) {
		return brandService.getBrandById(id);
	}

	@RequestMapping(value = "deleteBrandById.action")
	@ResponseBody
	public boolean deleteBrandById(int id) {
		Brand brand = getbrandById(id);
		// 删除原本的图片 
		FileUtil.deleteFile(brand.getLogoRealUrl());
		int lines = brandService.deleteBrand(id);
		return lines > 0;
	}
}
