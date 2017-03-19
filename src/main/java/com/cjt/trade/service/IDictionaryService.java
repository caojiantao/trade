package com.cjt.trade.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IDictionaryService {

	/**
	 * 根据setid获取字典集map(valueId, valueName)
	 * @return
	 */
	List<JSONObject> getOptsBySetId(int setId);
}
