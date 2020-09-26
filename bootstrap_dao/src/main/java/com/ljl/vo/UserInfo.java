package com.ljl.vo;

public class UserInfo {
    private int id;
    private String username;
    private String pwd;
    private String uname;
    private int age;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public UserInfo() {
    }

    public UserInfo(int id, String username, String pwd, String uname, int age) {
        this.id = id;
        this.username = username;
        this.pwd = pwd;
        this.uname = uname;
        this.age = age;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", pwd='" + pwd + '\'' +
                ", uname='" + uname + '\'' +
                ", age=" + age +
                '}';
    }
}
