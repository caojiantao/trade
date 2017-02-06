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
import com.cjt.trade.model.Goods;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.util.PathUtil;
import com.cjt.trade.vo.GoodsVo;

@Controller
@RequestMapping(value="/backend/")
public class GoodsController extends BaseController{

	@Resource
	private IGoodsService goodsService;
	
	@RequestMapping(value = "/goodsList.action")
	public String goodsList() {
		return "backend/mall/goodsList";
	}

	@RequestMapping(value = "getAllGoods.action")
	@ResponseBody
	public JSONObject getAllGoods(int page, int rows, BaseDto dto) {
		dto.setStart((page - 1) * rows);
		dto.setLimit(rows);
		List<GoodsVo> vos = goodsService.getAllGoods(dto);
		int count = goodsService.getAllGoodsCount(dto);
		return JSONUtil.toGridJson(vos, count);
	}
	
	@RequestMapping(value = "addGoods.action")
	public String addgoods(MultipartFile file, Goods goods, Model model) {
		setLogoUrl(file, goods);
		int lines = goodsService.insertGoods(goods);
		if (lines > 0) {
			model.addAttribute("returnUrl", "goodsAdd.action");
			return "success";
		}
		return "ERROR";
	}
	
	@RequestMapping(value = "updateGoods.action")
	public String updateGoods(MultipartFile file, Goods goods, Model model){
		setLogoUrl(file, goods);
		int lines = goodsService.updateGoods(goods);
		if (lines > 0) {
			return goodsList();
		}
		return "ERROR";
	}
	
	public void setLogoUrl(MultipartFile file, Goods goods){
		if (file.getSize() == 0) {
			return;
		}
		FileUtil.deleteFile(goods.getLogoRealUrl());
        String path = PathUtil.getGoodsPath();
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
        goods.setLogoRealUrl(targetFile.getAbsolutePath());
        goods.setLogoUrl(PathUtil.getGoodsUrlPath() + fileName);
	}

	@RequestMapping(value = "goodsAdd.action")
	public String goodsAdd() {
		return "backend/mall/goodsAdd";
	}
	
	@RequestMapping(value = "getGoodsById.action")
	@ResponseBody
	public Goods getgoodsById(int id) {
		return goodsService.getGoodsById(id);
	}

	@RequestMapping(value = "deleteGoodsById.action")
	@ResponseBody
	public boolean deleteGoodsById(int id) {
		Goods goods = getgoodsById(id);
		FileUtil.deleteFile(goods.getLogoRealUrl());
		int lines = goodsService.deleteGoods(id);
		return lines > 0;
	}
}
