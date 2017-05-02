package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.vo.GoodsVo;

public interface IGoodsService {

	public int insertGoods(Goods product);
	
	public int deleteGoods(int id);
	
	public List<GoodsVo> getAllGoods(BaseDto dto);
	public int getAllGoodsCount(BaseDto dto);
	
	public Goods getGoodsById(int id);
	
	public int updateGoods(Goods product);
	
	/**
	 * 获取首页滚动商品
	 */
	public List<Goods> getScrollGoods();
	
	/**
	 * 获取首页热卖商品
	 */
	public List<Goods> getHotGoods();

	/**
	 * 获取最新添加的商品
	 */
	public List<Goods> listLatestGoods();
	public List<Goods> listLatestGoods(GoodsDto dto);
	public int countLatestGoods(GoodsDto dto);

	int getLastGoodsIdById(int id);
	int getNextGoodsIdById(int id);
}
