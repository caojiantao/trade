package com.cjt.trade.service;


import java.util.List;

import com.cjt.trade.model.Admin;

/**
 * @author wulitaotao
 */
public interface IAdminServcie {

  boolean isValid(String account, String password);

  /**
   * 获取所有管理员信息
   */
  List<Admin> getAllAdmins();

  /**
   * 添加管理员信息
   */
  void addAdmin(Admin admin);

  /**
   * 删除管理员信息
   */
  void deleteAdmin(int id);

  /**
   * 修改管理员信息
   */
  void updateAdmin(Admin admin);

  /**
   * 获取该账号的数量
   */
  int getAdminCountByAccount(String account);

  /**
   * 根据id获取管理员信息
   */
  Admin getAdminById(int id);
}
