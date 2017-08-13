package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.vo.GoodsVo;

public interface IGoodsDao {

  int insertGoods(Goods product);

  int deleteGoods(int id);

  List<GoodsVo> getAllGoods(BaseDto dto);

  int getAllGoodsCount(BaseDto dto);

  Goods getGoodsById(int id);

  int updateGoods(Goods product);

  /**
   * 获取首页滚动商品
   */
  List<Goods> getScrollGoods();

  /**
   * 获取首页热卖商品
   */
  List<Goods> getHotGoods();

  /**
   * 获取最新添加的所有商品，或者是某一类行业（trade）
   */
  List<Goods> listLatestGoods(GoodsDto dto);

  int countLatestGoods(GoodsDto dto);

  /**
   * 获取当前商品前后商品id
   */
  int getLastGoodsIdById(int id);

  int getNextGoodsIdById(int id);
}