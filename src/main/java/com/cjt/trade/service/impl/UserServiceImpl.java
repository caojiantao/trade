package com.cjt.trade.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IUserDao;
import com.cjt.trade.model.User;
import com.cjt.trade.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	
	@Resource
	private IUserDao userDao;
	
	@Override
	public int register(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public User login(String email, String password) {
		User user = userDao.getUserByNameAndPwd(email, password);
		return user;
	}

	@Override
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}
}
