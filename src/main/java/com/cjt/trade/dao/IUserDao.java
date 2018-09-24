package com.cjt.trade.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjt.trade.dto.BaseDto;
import com.cjt.trade.model.User;

/**
 * 用户数据持久层
 *
 * @author wulitao
 */
public interface IUserDao {

    User getUserByName(String name);

    int insertUser(User user);

    int updateUser(User user);

    User getUserByEmailAndPwd(@Param(value = "email") String email, @Param(value = "password") String password);

    User getUserById(int id);

    List<User> getAllUsers(BaseDto dto);

    int getAllUsersCount();

    int deleteUserById(int id);

    int countUserByEmail(String email);
}