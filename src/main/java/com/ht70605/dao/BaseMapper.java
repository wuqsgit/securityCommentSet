package com.ht70605.dao;

import com.ht70605.entity.Page;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
//接口基类
public interface BaseMapper<T> {

    //Mybatis Generator 自动生成的方法
    int deleteByPrimaryKey(String id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    //自定义的方法

    //修改单个对象
    public void update(T entity);

    //删除单个对象
    public void delete(T entity);

    //通过主键批量删除记录
    public void deleteList(String[] pks);

    //查询单个对象
    public T select(T entity);

    //无条件查询表中所有数据
    public List<T> selectAll();

    //通过关键字分页查询数据列表
    public List<T> selectPageList(Page<T> page);

    //通过关键字分页查询，返回总记录数
    public Integer selectPageCount(Page<T> page);

    //通过多条件分页查询数据列表
    public List<T> selectPageListUseDyc(Page<T> page);

    //通过多条件分页查询，返回总记录数
    public Integer selectPageCountUseDyc(Page<T> page);


}
