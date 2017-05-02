package com.cjt.trade.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IDictionaryDao;
import com.cjt.trade.service.IDictionaryService;

@Service
public class DictionaryServiceImpl implements IDictionaryService {

	@Resource
	private IDictionaryDao dictionaryDao;
	
	/**
	 * 返回有序map，并且key/value都要转换为String类型，否则freemarker遍历有问题
	 */
	@Override
	public Map<String, String> getOptsBySetId(int setId) {
		Map<String, String> map = new LinkedHashMap<String, String>();
		List<Map<String, Object>> maps = dictionaryDao.getOptsBySetId(setId);
		if (maps != null && !maps.isEmpty()) {
			for (Map<String, Object> m : maps) {
				map.put(m.get("key").toString(), m.get("value").toString());
			}
		}
		return map;
	}

}
