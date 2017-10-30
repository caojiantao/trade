package com.cjt.trade.dao;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.Category;
import com.cjt.trade.model.Ems;

import java.util.List;

public interface ICategoryDao {

  List<Category> listCategories();
}
