package com.cjt.trade.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.dao.IDictionaryDao;
import com.cjt.trade.service.IDictionaryService;

@Service
public class DictionaryServiceImpl implements IDictionaryService {

	@Resource
	private IDictionaryDao dictionaryDao;
	
	@Override
	public List<JSONObject> getOptsBySetId(int setId) {
		List<JSONObject> list = new ArrayList<JSONObject>();
		List<Map<String, Object>> maps = dictionaryDao.getOptsBySetId(setId);
		if (maps != null) {
			for (Map<String, Object> map : maps) {
				JSONObject object = new JSONObject();
				object.put("key", Integer.parseInt(map.get("key").toString()));
				object.put("value", map.get("value"));
				list.add(object);
			}
		}
		return list;
	}

}
