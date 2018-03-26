package com.cjt.trade.controller.backend.mall;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Brand;
import com.cjt.trade.service.IBrandService;
import com.cjt.trade.service.IUploadService;
import com.cjt.trade.util.FileUtil;
import com.cjt.trade.util.JSONUtil;
import com.cjt.trade.vo.BrandVo;
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
public class BrandController extends BaseController {

    @Resource
    private IBrandService brandService;

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "/brandList.action")
    public String brandList() {
        return "backend/mall/brandList";
    }

    @RequestMapping(value = "/getAllBrands.action")
    @ResponseBody
    public JSONObject getAllBrands(int page, int rows, BaseDto dto) {
        dto.setStart((page - 1) * rows);
        dto.setLimit(rows);
        List<BrandVo> vos = brandService.getAllBrands(dto);
        int count = brandService.getAllBrandsCount(dto);
        return JSONUtil.toGridJson(vos, count);
    }

    @RequestMapping(value = "/addBrand.action")
    public String addbrand(MultipartFile file, Brand brand, Model model) throws IOException {
        brand.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        int lines = brandService.insertBrand(brand);
        if (lines > 0) {
            model.addAttribute("returnUrl", "brandAdd.action");
            return "success";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/updateBrand.action")
    public String updateBrand(MultipartFile file, Brand brand) throws IOException {
        brand.setLogoUrl(uploadService.uploadFile(file.getInputStream(), file.getOriginalFilename()));
        int lines = brandService.updateBrand(brand);
        if (lines > 0) {
            return brandList();
        }
        return "ERROR";
    }

    @RequestMapping(value = "/brandAdd.action")
    public String brandAdd() {
        return "backend/mall/brandAdd";
    }

    @RequestMapping(value = "/getBrandById.action")
    @ResponseBody
    public Brand getbrandById(int id) {
        return brandService.getBrandById(id);
    }

    @RequestMapping(value = "/deleteBrandById.action")
    @ResponseBody
    public boolean deleteBrandById(int id) {
        Brand brand = getbrandById(id);
        // 删除原本的图片
        FileUtil.deleteFile(brand.getLogoRealUrl());
        int lines = brandService.deleteBrand(id);
        return lines > 0;
    }
}
