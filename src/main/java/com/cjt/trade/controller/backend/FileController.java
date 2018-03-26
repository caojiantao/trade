package com.cjt.trade.controller.backend;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.controller.BaseController;
import com.cjt.trade.service.IUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author caojiantao
 */
@Controller
@RequestMapping("/files")
public class FileController extends BaseController {

    @Autowired
    private IUploadService uploadService;

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject uploadFile(MultipartFile imgFile) throws IOException {
        JSONObject object = new JSONObject();
        object.put("error", 0);
        object.put("url", uploadService.uploadFile(imgFile.getInputStream(), imgFile.getOriginalFilename()));
        return object;
    }
}
