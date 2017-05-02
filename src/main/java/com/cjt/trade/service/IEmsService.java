package com.cjt.trade.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Ems;

@Service
public interface IEmsService {

	public int insertEms(Ems ems);

	public List<Ems> getAllEms(BaseDto dto);
	public int getAllEmsCount();
	
	public Ems getEmsById(int id);
	
	public int updateEms(Ems ems);
	
	public int deleteEmsById(int id);
}
