package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.model.Advertisement;

public interface IAdvertisementDao {

  int saveAd(Advertisement advertisement);

  int removeAdById(int id);

  Advertisement getAdById(int id);

  List<Advertisement> listAllAds();

  int updateAd(Advertisement advertisement);
}
