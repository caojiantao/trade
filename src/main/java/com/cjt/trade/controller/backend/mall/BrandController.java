package com.cjt.trade.controller.backend.mall;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.util.JSONUtil;

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
		List<Brand> brands = brandService.getAllBrands(dto);
		int count = brandService.getAllBrandsCount(dto);
		return JSONUtil.toGridJson(brands, count);
	}
	
	@RequestMapping(value = "addbrand.action")
	public String addbrand(Brand brand, Model model) {
		int lines = brandService.insertBrand(brand);
		if (lines > 0) {
			model.addAttribute("returnUrl", "brandAdd.action");
			return "success";
		}
		return "ERROR";
	}
	
	@RequestMapping(value = "updatebrand.action")
	public String updatebrand(Brand brand, Model model){
		int lines = brandService.updateBrand(brand);
		if (lines > 0) {
			return brandList();
		}
		return "ERROR";
	}

	@RequestMapping(value = "brandAdd.action")
	public String brandAdd() {
		return "backend/mall/brandAdd";
	}

	@RequestMapping(value = "getBrandById.action")
	@ResponseBody
	public String getbrandById(int id) {
		return JSONObject.toJSONString(brandService.getBrandById(id));
	}

	@RequestMapping(value = "deletebrandById.action")
	@ResponseBody
	public boolean deletebrandById(int id) {
		int lines = brandService.deleteBrand(id);
		return lines > 0;
	}
}
