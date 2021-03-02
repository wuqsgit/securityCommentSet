package com.ht70605.dao;

import com.ht70605.entity.Application;

import java.util.List;

public interface ApplicationMapper extends BaseMapper<Application> {
    List<Application> selectAll();
}