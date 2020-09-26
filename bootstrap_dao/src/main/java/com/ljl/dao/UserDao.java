package com.ljl.dao;

import com.ljl.vo.UserInfo;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

public interface UserDao {
    //登录
    public UserInfo login(UserInfo userInfo);

    //查询所有用户
    public List<UserInfo> selUser(UserInfo userInfo);

    //添加
    public int addUser(UserInfo userInfo);

    //修改
    public int updUser(UserInfo userInfo);

    //删除
    public int delUser(int id);
}
