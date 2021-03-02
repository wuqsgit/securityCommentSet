package com.ht70605.service;

import com.ht70605.entity.Page;

/**
 * Created by Administrator on 2017/5/10.
 */
//Service接口基类
public interface BaseService<T> {

    //添加
    public void insert(T entity) throws Exception;

    //修改单个对象
    public void update(T entity) throws Exception;

    //删除单个对象
    public void delete(T entity) throws Exception;

    //通过主键批量删除记录
    public void deleteList(String[] pks) throws Exception;

    //查询单个对象
    public T select(T entity);

    //通过关键字分页查询
    public Page<T> selectPage(Page<T> page);

    //通过多条件分页查询
    public Page<T> selectPageUseDyc(Page<T> page);

}
