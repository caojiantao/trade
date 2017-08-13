package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Ems;

public interface IEmsDao {

  int insertEms(Ems ems);

  List<Ems> getAllEms(BaseDto dto);

  int getAllEmsCount();

  Ems getEmsById(int id);

  int updateEms(Ems ems);

  int deleteEmsById(int id);
}
