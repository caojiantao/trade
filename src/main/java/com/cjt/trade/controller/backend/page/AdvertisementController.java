package com.cjt.trade.controller.backend.page;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import com.cjt.trade.dto.ResultDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Advertisement;
import com.cjt.trade.service.IAdvertisementService;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.PathUtil;

@Controller
@RequestMapping(value="/backend")
public class AdvertisementController extends BaseController {

	@Resource
	private IAdvertisementService advertisementService;
	
	@RequestMapping(value="/advertisementList.action")
	public String advertisementList(){
		return "backend/page/advertisementList";
	}
	
	@ResponseBody
	@RequestMapping(value="/listAllAds.action")
	public List<Advertisement> listAllAds(){
		return advertisementService.listAllAds();
	}
	
	@ResponseBody
	@RequestMapping(value="/getAdById.action")
	public Advertisement getAdById(int id){
		return advertisementService.getAdById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/removeAdById.action")
	public int removeAdById(int id){
		Advertisement ad = advertisementService.getAdById(id);
		FileUtil.deleteFile(ad.getLogoRealUrl());
		return advertisementService.removeAdById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/saveAd.action")
	public ResultDto saveAd(MultipartFile file, Advertisement advertisement){
		setLogoUrl(file, advertisement);
		int lines = advertisementService.saveAd(advertisement);
		return lines > 0 ? success("添加成功", null) : failed("添加失败");
	}
	
	@ResponseBody
	@RequestMapping(value="/updateAd.action")
	public ResultDto updateAd(MultipartFile file, Advertisement advertisement){
		setLogoUrl(file, advertisement);
		int lines = advertisementService.updateAd(advertisement);
		return lines > 0 ? success("更新成功", null) : failed("更新失败");
	}
	
	public void setLogoUrl(MultipartFile file, Advertisement advertisement){
		if (file == null || file.getSize() == 0) {
			return;
		}
		FileUtil.deleteFile(advertisement.getLogoRealUrl());
        String path = PathUtil.getAdsPath();
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
        advertisement.setLogoRealUrl(targetFile.getAbsolutePath());
        advertisement.setLogoUrl(PathUtil.getAdsUrlPath() + fileName);
	}
}
