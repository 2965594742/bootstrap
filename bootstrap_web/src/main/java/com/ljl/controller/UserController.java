package com.ljl.controller;

import com.alibaba.fastjson.JSONObject;
import com.ljl.service.UserService;
import com.ljl.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/login.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String login(UserInfo userInfo){
        UserInfo userInfo1 = userService.login(userInfo);
        if(userInfo1==null){
            return "登录失败";
        }
        return "登录成功";
    }

    @RequestMapping(value = "/selUser.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String selUser(@RequestBody UserInfo userInfo){
        System.out.println(userInfo);
        return JSONObject.toJSONString(userService.selUser(userInfo));
    }


    //添加
    @RequestMapping(value = "/addUser.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String addUser(UserInfo userInfo){
        int num = userService.addUser(userInfo);
        if(num==1){
            return "添加成功";
        }
        return "添加失败";
    }

    //修改
    @RequestMapping(value = "/updUser.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String updUser(UserInfo userInfo){
        int num = userService.updUser(userInfo);
        if(num==1){
            return "修改成功";
        }
        return "修改失败";
    }

    //删除
    @RequestMapping(value = "/delUser.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String delUser(int id){
        int num = userService.delUser(id);
        if(num==1){
            return "删除成功";
        }
        return "删除失败";
    }
}
