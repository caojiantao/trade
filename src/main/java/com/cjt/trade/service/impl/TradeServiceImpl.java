package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.ITradeDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Trade;
import com.cjt.trade.service.ITradeService;

@Service
public class TradeServiceImpl implements ITradeService {

	@Resource
	private ITradeDao tradeDao;

	@Override
	public int insertTrade(Trade trade) {
		return tradeDao.insertTrade(trade);
	}

	@Override
	public int deleteTrade(int id) {
		return tradeDao.deleteTrade(id);
	}

	@Override
	public List<Trade> getAllTrade(BaseDto dto) {
		return tradeDao.getAllTrade(dto);
	}
	@Override
	public int getAllTradeCount(BaseDto dto) {
		return tradeDao.getAllTradeCount(dto);
	}

	@Override
	public Trade getTradeById(int id) {
		return tradeDao.getTradeById(id);
	}

	@Override
	public int updateTrade(Trade trade) {
		return tradeDao.updateTrade(trade);
	}
}
