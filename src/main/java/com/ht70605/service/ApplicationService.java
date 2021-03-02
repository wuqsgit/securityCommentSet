package com.ht70605.service;

import com.ht70605.entity.Application;
import com.ht70605.entity.Dictionary;

import java.util.List;

//继承Service接口基类
public interface ApplicationService extends BaseService<Application> {
   //获取所有的系统信息
   List<Application> selectAll();

}
