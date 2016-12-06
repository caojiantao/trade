package com.cjt.trade.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Trade;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月20日
 * @subcription “商品行业”业务操作service
 */
@Service
public interface ITradeService {

	public int insertTrade(Trade trade);
	
	public int deleteTrade(int id);
	
	public List<Trade> getAllTrade(BaseDto dto);
	public int getAllTradeCount(BaseDto dto);
	
	public Trade getTradeById(int id);
	
	public int updateTrade(Trade trade);
}
