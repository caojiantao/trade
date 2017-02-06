package com.cjt.trade.controller.backend;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.cjt.trade.constant.GlobalConfig;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Admin;
import com.cjt.trade.model.Website;
import com.cjt.trade.service.IAdminServcie;
import com.cjt.trade.service.IWebsiteService;
import com.cjt.trade.util.PathUtil;

/**
 * @author wulitaotao
 * @date 2017年1月3日
 * @subscription 系统控制层，主要是管理分发“管理员信息、网站基本信息”
 */
@Controller
@RequestMapping("/backend/")
public class SystemController extends BaseController {

	@Resource
    private IWebsiteService websiteService;
	
	@Resource
	private IAdminServcie adminServcie;
	
	@RequestMapping(value="/website.action")
	/**
	 * 网站信息页
	 */
	public String website(HttpServletRequest request, Model model){
		model.addAttribute("website", websiteService.getWebsite());
		return "backend/system/website";
	}
	
	/**
	 * 
	 */
	@RequestMapping(value="/updateWebsite.action")
	public String updateWebsite(MultipartFile file, Website website, Model model){
		setLogoUrl(file, website);
		if (website.getId() == null || website.getId() == 0) {
			websiteService.insertWebSite(website);
		} else {
			websiteService.updateWebsite(website);
		}
		model.addAttribute("returnUrl", "website.action");
		return "success";
	}
	
	public void setLogoUrl(MultipartFile file, Website website){
		if (file.getSize() == 0) {
			return;
		}
        String path = PathUtil.getRootPath();
        String fileName = GlobalConfig.LOGO_NAME;
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
        website.setLogoUrl(PathUtil.getLogoUrlPath() + fileName);
	}
	
	@RequestMapping(value="/admin.action")
	public String admin(){
		return "backend/system/admin";
	}
	
	@RequestMapping(value="/getAllAdmins.action")
	@ResponseBody
	public String getAllAdmins(){
		List<Admin> admins = adminServcie.getAllAdmins();
		return JSONArray.toJSONString(admins);
	}
	
	@RequestMapping(value="/addAdmin.action")
	@ResponseBody
	public boolean addAdmin(Admin admin){
		int result = adminServcie.getAdminCountByAccount(admin.getAccount());
		if (result > 0) {
			return false;
		} else {
			adminServcie.addAdmin(admin);
			return true;
		}
	}
	
	@RequestMapping(value="/deleteAdmin.action")
	@ResponseBody
	public boolean deleteAdmin(int id){
		adminServcie.deleteAdmin(id);
		return true;
	}
	
	@RequestMapping(value="/getAdminById.action")
	@ResponseBody
	public Admin getAdminById(int id){
		Admin admin = adminServcie.getAdminById(id);
		return admin;
	}
	
	@RequestMapping(value="/updateAdmin.action")
	public String updateAdmin(Admin admin){
		if (admin != null) {
			adminServcie.updateAdmin(admin);
		}
		return admin();
	}
}
