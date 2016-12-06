package com.cjt.trade.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Trade;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月20日
 * @subcription “商品行业”数据操作dao
 */
@Repository
public interface ITradeDao {
	
	public int insertTrade(Trade trade);
	
	public int deleteTrade(int id);
	
	public List<Trade> getAllTrades(BaseDto dto);
	public List<MapModel> getAllTradesOpt();
	public int getAllTradesCount(BaseDto dto);
	
	public Trade getTradeById(int id);
	
	public int updateTrade(Trade trade);
}