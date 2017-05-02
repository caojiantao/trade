package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IEmsDao;
import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Ems;
import com.cjt.trade.service.IEmsService;

@Service
public class EmsServiceImpl implements IEmsService{

	@Resource
	private IEmsDao emsDao;
	
	@Override
	public int insertEms(Ems ems) {
		return emsDao.insertEms(ems);
	}

	@Override
	public List<Ems> getAllEms(BaseDto dto) {
		return emsDao.getAllEms(dto);
	}

	@Override
	public int getAllEmsCount() {
		return emsDao.getAllEmsCount();
	}

	@Override
	public Ems getEmsById(int id) {
		return emsDao.getEmsById(id);
	}

	@Override
	public int updateEms(Ems ems) {
		return emsDao.updateEms(ems);
	}

	@Override
	public int deleteEmsById(int id) {
		return emsDao.deleteEmsById(id);
	}
}
