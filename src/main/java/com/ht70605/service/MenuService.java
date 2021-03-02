package com.ht70605.service;

import com.ht70605.entity.Menu;

import java.util.List;

//继承Service接口基类
public interface MenuService extends BaseService<Menu> {


    List<Menu> getTree(String uId);

    List<Menu> getTreeAll();
}
