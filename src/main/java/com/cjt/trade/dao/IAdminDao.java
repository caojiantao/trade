package com.cjt.trade.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cjt.trade.model.Admin;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月20日
 * @subcription 管理员操作dao层
 */
@Repository
public interface IAdminDao {

	public Admin queryByAdmin(Admin admin);
	public void insertAdmin(Admin admin);
	public void deleteAdmin(int id);
	public List<Admin> selectAllAdmin();
	public void updateAdmin(Admin admin);
	public int getAdminCountByAccount(String account);
	public Admin getAdminById(int id);
}