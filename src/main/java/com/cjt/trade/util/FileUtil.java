package com.cjt.trade.util;

import java.io.File;
import java.util.Date;

import org.springframework.util.StringUtils;

/**
 * @author wulitaotao
 * @subscription 文件工具类
 */
public class FileUtil {

	/**
	 * 删掉指定路径的文件
	 */
	public static void deleteFile(String path){
		if (StringUtils.isEmpty(path)) {
			return;
		}
		File file = new File(path);
		if (file.exists()) {
			file.delete();
		}
	}
	
	/**
	 * 给文件加一个文件后缀防止重复
	 */
	public static String getFileName(String originName){
		StringBuilder builder = new StringBuilder();
		String[] str = originName.split("\\.");
		builder.append(str[0]);
		builder.append("_");
		builder.append(DateUtil.parseDate(new Date(), "yyyyMMddHHmmss"));
		builder.append(".");
		builder.append(str[1]);
		return builder.toString();
	}
	
	public static void main(String[] args) {
		System.out.print(getFileName("test.jpg"));
	}
}
