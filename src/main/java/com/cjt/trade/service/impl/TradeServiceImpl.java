package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.ITradeDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Trade;
import com.cjt.trade.service.ITradeService;
import com.cjt.trade.vo.TradeVo;

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
	public List<TradeVo> getAllTrades(BaseDto dto) {
		return tradeDao.getAllTrades(dto);
	}
	@Override
	public int getAllTradesCount(BaseDto dto) {
		return tradeDao.getAllTradesCount(dto);
	}

	@Override
	public Trade getTradeById(int id) {
		return tradeDao.getTradeById(id);
	}

	@Override
	public int updateTrade(Trade trade) {
		return tradeDao.updateTrade(trade);
	}

	@Override
	public List<MapModel> getAllTradesOpt() {
		return tradeDao.getAllTradesOpt();
	}
}
