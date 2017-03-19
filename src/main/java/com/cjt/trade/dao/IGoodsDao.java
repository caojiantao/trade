package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.vo.GoodsVo;

@Repository
public interface IGoodsDao {

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
	 * 获取最新添加的所有商品，或者是某一类行业（trade）
	 */
	public List<Goods> getNewGoods(GoodsDto dto);
	public int getNewGoodsCount(GoodsDto dto);
}