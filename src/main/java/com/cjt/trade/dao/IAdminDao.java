package com.cjt.trade.dao;

import java.util.List;

import com.cjt.trade.model.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * @author wulitaotao
 */
public interface IAdminDao {

  Admin queryByAdmin(@Param("account") String account, @Param("pwd") String pwd);

  void insertAdmin(Admin admin);

  void deleteAdmin(int id);

  List<Admin> selectAllAdmin();

  void updateAdmin(Admin admin);

  int getAdminCountByAccount(String account);

  Admin getAdminById(int id);
}