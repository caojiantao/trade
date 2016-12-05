package com.cjt.trade.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.model.Trade;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月20日
 * @subcription “商品行业”数据操作dao
 */
@Repository
public interface ITradeDao {
	
	public void insert(Trade trade);
	
	public void deleteById(int id);
	
	public void deleteByIds(List<Integer> ids);
	
	public Trade queryTradeById(int id);
	
	public List<Trade> queryTradesByIdList(List<Integer> ids);
	
	public void updateTrade(Trade trade);
}