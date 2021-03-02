package com.ht70605.service;

import com.ht70605.entity.TestExcel;

/**
 * Created by fz on 2017/9/7.
 */
public interface ExcelImportService extends BaseService<TestExcel>{
    public void insert(TestExcel test);
}
