package com.ht70605.dao;

import com.ht70605.entity.Menu;

import java.util.List;

public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> getTree(String uId);
    List<Menu> getTreeAll();

}