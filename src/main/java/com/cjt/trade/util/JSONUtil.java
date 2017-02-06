package com.cjt.trade.util;

import com.alibaba.fastjson.JSONObject;


public class JSONUtil {

	/**
	 * 将数据集转化为json对象，提供easyui datagrid展示
		{
		    "rows": [
		        {
		            "id": 1,
		            "name": "1",
		            "order": 1
		        }
		    ],
		    "total": 1
		}
	 */
	public static JSONObject toGridJson(Object obj, int totalCount) {
		JSONObject result = new JSONObject();
		// 如果数据集对象为null做个特殊处理
		if (obj == null) {
			result.put("total", totalCount);
			result.put("rows", null);
			return result;
		}
		result.put("total", totalCount);
		result.put("rows", obj);
		return result;
	}
}
