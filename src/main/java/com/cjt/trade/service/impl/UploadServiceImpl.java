package com.cjt.trade.service.impl;

import com.cjt.trade.service.IUploadService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StreamUtils;

import java.io.*;

/**
 * @author caojiantao
 */
@Service
public class UploadServiceImpl implements IUploadService {

    @Value("${upload_path}")
    private String uploadPath;

    @Override
    public String uploadFile(InputStream is, String fileName) {
        File directory = new File(uploadPath);
        File targetFile = new File(directory, getTargetFileName(fileName));
        String url = "";
        try {
            OutputStream os = new FileOutputStream(targetFile);
            StreamUtils.copy(is, os);
            url = "/upload/" + targetFile.getName();
            is.close();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return url;
    }

    private String getTargetFileName(String originFileName) {
        String[] tempArr = originFileName.split("\\.");
        return tempArr[0] + "_" + System.currentTimeMillis() + "." + (tempArr.length > 1 ? tempArr[1] : "");
    }
}
