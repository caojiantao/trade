package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Ems;

@Repository
public interface IEmsDao {

	public int insertEms(Ems ems);

	public List<Ems> getAllEms(BaseDto dto);
	public int getAllEmsCount();
	
	public Ems getEmsById(int id);
	
	public int updateEms(Ems ems);
	
	public int deleteEmsById(int id);
}
