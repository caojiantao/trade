package com.cjt.trade.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface IDictionaryDao {

	List<Map<String, Object>> getOptsBySetId(int setId);
}
