package com.cjt.trade.service;

import com.cjt.trade.model.User;

public interface IUserService {

	int register(User user);
	
	User login(String email, String password);
	
	User getUserByEmail(String email);
	
	int updateUser(User user);
}
