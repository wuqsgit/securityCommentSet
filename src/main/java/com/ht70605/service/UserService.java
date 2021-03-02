package com.ht70605.service;

import com.ht70605.entity.User;

import java.util.List;

//继承Service接口基类
public interface UserService extends BaseService<User> {


    List<User> selectAll();
}
