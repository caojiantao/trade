package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IGoodsDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.service.IGoodsService;
import com.cjt.trade.vo.GoodsVo;

@Service
public class GoodsServiceImpl implements IGoodsService {

	@Resource
	private IGoodsDao goodsDao;
	
	@Override
	public int insertGoods(Goods goods) {
		return goodsDao.insertGoods(goods);
	}

	@Override
	public int deleteGoods(int id) {
		return goodsDao.deleteGoods(id);
	}

	@Override
	public List<GoodsVo> getAllGoods(BaseDto dto) {
		return goodsDao.getAllGoods(dto);
	}

	@Override
	public int getAllGoodsCount(BaseDto dto) {
		return goodsDao.getAllGoodsCount(dto);
	}

	@Override
	public Goods getGoodsById(int id) {
		return goodsDao.getGoodsById(id);
	}

	@Override
	public int updateGoods(Goods goods) {
		return goodsDao.updateGoods(goods);
	}

	@Override
	public List<Goods> getScrollGoods() {
		return goodsDao.getScrollGoods();
	}

	@Override
	public List<Goods> getHotGoods() {
		return goodsDao.getHotGoods();
	}

	@Override
	public List<Goods> listLatestGoods() {
		return listLatestGoods(null);
	}

	@Override
	public List<Goods> listLatestGoods(GoodsDto dto) {
		return goodsDao.listLatestGoods(dto);
	}

	@Override
	public int countLatestGoods(GoodsDto dto) {
		return goodsDao.countLatestGoods(dto);
	}

	@Override
	public int getLastGoodsIdById(int id) {
		return goodsDao.getLastGoodsIdById(id);
	}

	@Override
	public int getNextGoodsIdById(int id) {
		return goodsDao.getNextGoodsIdById(id);
	}
}
