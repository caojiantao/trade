package com.cjt.trade.util;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cjt.trade.model.Trade;


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
	@SuppressWarnings("rawtypes")
	public static JSONObject toGridJson(List vos, int totalCount) {
		JSONObject reult = new JSONObject();
		// 如果数据集对象为null做个特殊处理
		if (vos == null) {
			reult.put("total", totalCount);
			reult.put("rows", new JSONArray());
			return reult;
		}
		JSONArray jsonArray = JSONArray.parseArray(JSONObject.toJSONString(vos));
		reult.put("total", totalCount);
		reult.put("rows", jsonArray);
		return reult;
	}
	
	public static void main(String[] args) {
		List<Trade> trades = new ArrayList<Trade>();
		Trade one = new Trade();
		one.setId(1);
		one.setName("1");
		one.setOrder(1);
		trades.add(one);
		JSONObject object = toGridJson(trades, 2);
		System.out.println(object.toString());
	}
}
