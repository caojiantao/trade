package com.cjt.trade.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cjt.trade.model.User;

/**
 * 用户数据持久层
 * @author wulitao
 * @date 2017年3月1日
 * @subscription
 */
@Repository
public interface IUserDao {
	
	User getUserByName(String name);
	
	int insertUser(User user);
	
	int updateUser(User user);
	
	User getUserByNameAndPwd(@Param(value="email")String email, @Param(value="password")String password);
	
	User getUserByEmail(String email);
}