package com.ht70605.service.impl;

import com.ht70605.dao.DictionaryMapper;
import com.ht70605.entity.Dictionary;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("DictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryMapper dictionaryMapper;


    @Override
    public void insert(Dictionary entity) throws Exception {

    }

    @Override
    public void update(Dictionary entity) throws Exception {

    }

    @Override
    public void delete(Dictionary entity) throws Exception {

    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public Dictionary select(Dictionary entity) {
        return null;
    }

    @Override
    public Page<Dictionary> selectPage(Page<Dictionary> page) {
        return null;
    }

    @Override
    public Page<Dictionary> selectPageUseDyc(Page<Dictionary> page) {
        return null;
    }

    //获取所有的数据字典信息
    @Override
    public List<Dictionary> selectAll() {
       List<Dictionary> dictionaryList= dictionaryMapper.selectAll();
       return dictionaryList;
    }
}
