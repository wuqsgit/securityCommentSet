package com.ht70605.service.impl;

import com.ht70605.dao.ProductuserecordMapper;
import com.ht70605.entity.Page;
import com.ht70605.entity.ProductUseRecordView;
import com.ht70605.entity.Productuserecord;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.ProductUseRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/13.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("ProductUseRecordService")
public class ProductUseRecordServiceImpl implements ProductUseRecordService {

    @Autowired
    private ProductuserecordMapper productuserecordMapper;

    @Override
    public void insert(Productuserecord test) throws Exception {
        productuserecordMapper.insert(test);
    }

    @Override
    public void update(Productuserecord entity) throws Exception {

    }

    @Override
    public void delete(Productuserecord entity) throws Exception {

    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public Productuserecord select(Productuserecord entity) {
        return null;
    }

    @Override
    public Page<Productuserecord> selectPage(Page<Productuserecord> page) {
        return null;
    }

    @Override
    public Page<Productuserecord> selectPageUseDyc(Page<Productuserecord> page) {
        return null;
    }


    //显示使用记录明细
    @Override
    public List<ProductUseRecordView> selectProductUseRecord(Productuserecord productuserecord) {
        return null; //王昱华修改的代码否则报错
    }
}
