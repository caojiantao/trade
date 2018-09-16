package com.cjt.trade.service;

import com.cjt.trade.dto.GoodsDto;
import com.cjt.trade.model.Goods;
import com.cjt.trade.vo.GoodsVo;

import java.util.List;

public interface IGoodsService {

    int insertGoods(Goods product);

    int deleteGoods(int id);

    List<GoodsVo> getAllGoods(GoodsDto dto);

    int getAllGoodsCount(GoodsDto dto);

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
     * 获取最新添加的商品
     */
    List<Goods> listLatestGoods();

    List<Goods> listLatestGoods(GoodsDto dto);

    int countLatestGoods(GoodsDto dto);

    int getLastGoodsIdById(int id);

    int getNextGoodsIdById(int id);
}
