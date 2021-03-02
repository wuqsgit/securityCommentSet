package com.ht70605.service.impl;

import com.ht70605.action.ExcelTest;
import com.ht70605.dao.TestExcel;
import com.ht70605.entity.Page;
import com.ht70605.service.ExcelImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fz on 2017/9/7.
 */
@Service("ExcelImportService")
public class ExcelImportServiceImpl implements ExcelImportService{
    @Autowired
    TestExcel testExcel;
    @Override
    public void insert(com.ht70605.entity.TestExcel test) {
        testExcel.insert(test);
    }

    @Override
    public void update(com.ht70605.entity.TestExcel entity) throws Exception {

    }

    @Override
    public void delete(com.ht70605.entity.TestExcel entity) throws Exception {

    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public com.ht70605.entity.TestExcel select(com.ht70605.entity.TestExcel entity) {
        return null;
    }

    @Override
    public Page<com.ht70605.entity.TestExcel> selectPage(Page<com.ht70605.entity.TestExcel> page) {
        return null;
    }

    @Override
    public Page<com.ht70605.entity.TestExcel> selectPageUseDyc(Page<com.ht70605.entity.TestExcel> page) {
        return null;
    }

}
