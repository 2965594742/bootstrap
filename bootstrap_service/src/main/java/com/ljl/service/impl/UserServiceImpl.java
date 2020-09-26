package com.ljl.service.impl;

import com.ljl.dao.UserDao;
import com.ljl.service.UserService;
import com.ljl.vo.UserInfo;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public UserInfo login(UserInfo userInfo) {
        return userDao.login(userInfo);
    }

    @Override
    public List<UserInfo> selUser(UserInfo userInfo) {
        return userDao.selUser(userInfo);
    }

    @Override
    public int addUser(UserInfo userInfo) {
        return userDao.addUser(userInfo);
    }

    @Override
    public int updUser(UserInfo userInfo) {
        return userDao.updUser(userInfo);
    }

    @Override
    public int delUser(int id) {
        return userDao.delUser(id);
    }
}
