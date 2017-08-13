package com.cjt.trade.controller.backend;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import com.cjt.trade.dto.ResultDto;
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
 */
@Controller
@RequestMapping("/backend")
public class SystemController extends BaseController {

  @Resource
  private IWebsiteService websiteService;

  @Resource
  private IAdminServcie adminServcie;

  /**
   * 网站信息页
   */
  @RequestMapping(value = "/website.action")
  public String website(Model model) {
    model.addAttribute("website", websiteService.getWebsite());
    return "backend/system/website";
  }

  @ResponseBody
  @RequestMapping(value = "/updateWebsite.action")
  public ResultDto updateWebsite(MultipartFile file, Website website) {
    if (!setLogoUrl(file, website)) {
      return failed("上传图片出现异常，请检查文件操作权限。");
    }
    if (website.getId() == null) {
      websiteService.insertWebSite(website);
    } else {
      websiteService.updateWebsite(website);
    }
    return success();
  }

  public boolean setLogoUrl(MultipartFile file, Website website) {
    if (file == null) {
      return true;
    }
    String path = PathUtil.getRootPath();
    String fileName = GlobalConfig.LOGO_NAME;
    File targetFile = new File(path, fileName);
    if (targetFile.exists()) {
      if (!targetFile.delete()) {
        // 删除文件失败
        return false;
      }
    }
    if (!targetFile.mkdirs()) {
      // 创建文件失败
      return false;
    }
    //保存
    try {
      file.transferTo(targetFile);
    } catch (Exception e) {
      e.printStackTrace();
    }
    website.setLogoUrl(PathUtil.getLogoUrlPath() + fileName);
    return true;
  }

  @RequestMapping(value = "/admin.action")
  public String admin() {
    return "backend/system/admin";
  }

  @RequestMapping(value = "/getAllAdmins.action")
  @ResponseBody
  public String getAllAdmins() {
    List<Admin> admins = adminServcie.getAllAdmins();
    return JSONArray.toJSONString(admins);
  }

  @RequestMapping(value = "/addAdmin.action")
  @ResponseBody
  public boolean addAdmin(Admin admin) {
    int result = adminServcie.getAdminCountByAccount(admin.getAccount());
    if (result > 0) {
      return false;
    } else {
      adminServcie.addAdmin(admin);
      return true;
    }
  }

  @RequestMapping(value = "/deleteAdmin.action")
  @ResponseBody
  public boolean deleteAdmin(int id) {
    adminServcie.deleteAdmin(id);
    return true;
  }

  @RequestMapping(value = "/getAdminById.action")
  @ResponseBody
  public Admin getAdminById(int id) {
    return adminServcie.getAdminById(id);
  }

  @RequestMapping(value = "/updateAdmin.action")
  public String updateAdmin(Admin admin) {
    if (admin != null) {
      adminServcie.updateAdmin(admin);
    }
    return admin();
  }
}
