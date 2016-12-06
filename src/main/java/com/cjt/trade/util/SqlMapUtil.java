package com.cjt.trade.util;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class SqlMapUtil {

	public Map<String, String> getMap(List<Map<String, String>> maps){
		Map<String, String> map = new LinkedHashMap<String, String>();
		for (Map<String, String> m : maps) {
			map.put(m.get("key"), m.get("value"));
		}
		return map;
	}
}
