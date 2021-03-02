package com.ht70605.service;

import com.ht70605.entity.Application;
import com.ht70605.entity.Dictionary;
import com.ht70605.entity.Sysuser;

import java.util.List;

//继承Service接口基类
public interface DictionaryService extends BaseService<Dictionary> {

    //获取所有数据字典
    List<Dictionary> selectAll();
}
