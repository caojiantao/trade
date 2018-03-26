package com.cjt.trade.service;

import java.io.InputStream;

/**
 * @author caojiantao
 */
public interface IUploadService {

    String uploadFile(InputStream inputStream, String fileName);
}
