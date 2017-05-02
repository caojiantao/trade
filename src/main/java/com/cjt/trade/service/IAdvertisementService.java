package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.model.Advertisement;

public interface IAdvertisementService {

	int saveAd(Advertisement advertisement);
	
	int removeAdById(int id);
	
	Advertisement getAdById(int id);
	List<Advertisement> listAllAds();
	
	int updateAd(Advertisement advertisement);
}
