package com.cjt.trade.controller.backend.page;

import com.cjt.trade.controller.BaseController;
import com.cjt.trade.model.Advertisement;
import com.cjt.trade.service.IAdvertisementService;
import com.cjt.trade.service.IUploadService;
import com.cjt.trade.util.FileUtil;
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
public class AdvertisementController extends BaseController {

    @Resource
    private IAdvertisementService advertisementService;

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "/advertisementList.action")
    public String advertisementList() {
        return "backend/page/advertisementList";
    }

    @ResponseBody
    @RequestMapping(value = "listAllAds.action")
    public List<Advertisement> listAllAds() {
        return advertisementService.listAllAds();
    }

    @ResponseBody
    @RequestMapping(value = "getAdById.action")
    public Advertisement getAdById(int id) {
        return advertisementService.getAdById(id);
    }

    @ResponseBody
    @RequestMapping(value = "removeAdById.action")
    public int removeAdById(int id) {
        Advertisement ad = advertisementService.getAdById(id);
        FileUtil.deleteFile(ad.getLogoRealUrl());
        return advertisementService.removeAdById(id);
    }

    @ResponseBody
    @RequestMapping(value = "saveAd.action")
    public int saveAd(MultipartFile file, Advertisement advertisement) throws IOException {
        advertisement.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        return advertisementService.saveAd(advertisement);
    }

    @ResponseBody
    @RequestMapping(value = "updateAd.action")
    public int updateAd(MultipartFile file, Advertisement advertisement) throws IOException {
        advertisement.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        return advertisementService.updateAd(advertisement);
    }
}
