package com.cjt.trade.dao;


import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.MapModel;
import com.cjt.trade.model.Trade;
import com.cjt.trade.vo.TradeVo;

/**
 * @author wulitaotao
 */
public interface ITradeDao {

  int insertTrade(Trade trade);

  int deleteTrade(int id);

  List<TradeVo> getAllTrades(BaseDto dto);

  List<MapModel> getAllTradesOpt();

  int getAllTradesCount(BaseDto dto);

  Trade getTradeById(int id);

  int updateTrade(Trade trade);
}