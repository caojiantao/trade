package com.cjt.trade.service;

import java.util.List;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.User;

public interface IUserService {

	int register(User user);
	
	User login(String email, String password);
	
	User getUserByEmail(String email);
	
	int updateUser(User user);
	
	List<User> getAllUsers(BaseDto dto);
	int getAllUsersCount();
	
	int insertUser(User user);
	
	int deleteUserByEmail(String email);
}
