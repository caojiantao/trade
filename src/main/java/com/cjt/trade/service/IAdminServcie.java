package com.cjt.trade.service;


import java.util.List;

import com.cjt.trade.model.Admin;

/**
 * @author wulitaotao
 * @date 修改日期：2016年11月20日
 * @subcription 管理员信息操作servcie
 */
public interface IAdminServcie {

	/**
	 * 根据账号密码得到管理员信息
	 */
	public Admin login(Admin admin);
	
	/**
	 * 获取所有管理员信息
	 */
	public List<Admin> getAllAdmins();
	
	/**
	 * 添加管理员信息
	 */
	public void addAdmin(Admin admin);
	
	/**
	 * 删除管理员信息
	 */
	public void deleteAdmin(int id);
	
	/**
	 * 修改管理员信息
	 */
	public void updateAdmin(Admin admin);
	
	/**
	 * 获取该账号的数量
	 */
	public int getAdminCountByAccount(String account);
	
	/**
	 * 根据id获取管理员信息
	 */
	public Admin getAdminById(int id);
}
