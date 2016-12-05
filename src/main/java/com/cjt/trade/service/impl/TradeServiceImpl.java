package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.ITradeDao;
import com.cjt.trade.model.Trade;
import com.cjt.trade.service.ITradeService;

@Service
public class TradeServiceImpl implements ITradeService {

	@Resource
	private ITradeDao tradeDao;
	
	public void insert(Trade trade) {
		tradeDao.insert(trade);
	}

	@Override
	public void deleteById(int id) {
		tradeDao.deleteById(id);
	}

	@Override
	public void deleteByIds(List<Integer> ids) {
		tradeDao.deleteByIds(ids);
	}

	@Override
	public Trade queryTradeById(int id) {
		return tradeDao.queryTradeById(id);
	}

	@Override
	public List<Trade> queryTradesByIdList(List<Integer> ids) {
		return tradeDao.queryTradesByIdList(ids);
	}

	@Override
	public void updateTrade(Trade trade) {
		tradeDao.updateTrade(trade);
	}
}
