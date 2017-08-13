package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IAdminDao;
import com.cjt.trade.model.Admin;
import com.cjt.trade.service.IAdminServcie;

@Service
public class AdminServiceImpl implements IAdminServcie {

  @Resource
  private IAdminDao adminDao;

  public boolean isValid(String account, String password) {
    return adminDao.queryByAdmin(account, password) != null;
  }

  @Override
  public List<Admin> getAllAdmins() {
    return adminDao.selectAllAdmin();
  }

  @Override
  public void addAdmin(Admin admin) {
    adminDao.insertAdmin(admin);
  }

  @Override
  public void deleteAdmin(int id) {
    adminDao.deleteAdmin(id);
  }

  @Override
  public void updateAdmin(Admin admin) {
    adminDao.updateAdmin(admin);
  }

  @Override
  public int getAdminCountByAccount(String account) {
    return adminDao.getAdminCountByAccount(account);
  }

  @Override
  public Admin getAdminById(int id) {
    return adminDao.getAdminById(id);
  }
}
