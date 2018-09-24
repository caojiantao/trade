package com.cjt.trade.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cjt.trade.dao.IUserDao;
import com.cjt.trade.dto.BaseDto;
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
        return userDao.getUserByEmailAndPwd(email, password);
    }

    @Override
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public List<User> getAllUsers(BaseDto dto) {
        return userDao.getAllUsers(dto);
    }

    @Override
    public int getAllUsersCount() {
        return userDao.getAllUsersCount();
    }

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int deleteUserById(int id) {
        return userDao.deleteUserById(id);
    }

    @Override
    public int countUserByEmail(String email) {
        return userDao.countUserByEmail(email);
    }
}
