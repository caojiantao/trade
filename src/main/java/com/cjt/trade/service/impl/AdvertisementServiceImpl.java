package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IAdvertisementDao;
import com.cjt.trade.model.Advertisement;
import com.cjt.trade.service.IAdvertisementService;

@Service
public class AdvertisementServiceImpl implements IAdvertisementService {

	@Resource
	private IAdvertisementDao advertisementDao;
	
	@Override
	public int saveAd(Advertisement advertisement) {
		return advertisementDao.saveAd(advertisement);
	}

	@Override
	public int removeAdById(int id) {
		return advertisementDao.removeAdById(id);
	}

	@Override
	public Advertisement getAdById(int id) {
		return advertisementDao.getAdById(id);
	}

	@Override
	public List<Advertisement> listAllAds() {
		return advertisementDao.listAllAds();
	}

	@Override
	public int updateAd(Advertisement advertisement) {
		return advertisementDao.updateAd(advertisement);
	}
}
