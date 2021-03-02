package com.ht70605.dao;

import com.ht70605.entity.User;

import java.util.List;

public interface UserMapperDao extends BaseMapper<User> {

    List<User> selectAll();
}




