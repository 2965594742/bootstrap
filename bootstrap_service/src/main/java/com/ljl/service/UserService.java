package com.ljl.service;

import com.ljl.vo.UserInfo;

import java.util.List;

public interface UserService {
    //登录
    public UserInfo login(UserInfo userInfo);

    //查询所有
    public List<UserInfo> selUser(UserInfo userInfo);

    //添加
    public int addUser(UserInfo userInfo);

    //修改
    public int updUser(UserInfo userInfo);

    //删除
    public int delUser(int id);
}
