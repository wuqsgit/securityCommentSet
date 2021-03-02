package com.ht70605.service.impl;

import com.ht70605.dao.CapuserecordMapper;
import com.ht70605.entity.Capuserecord;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.CapuserecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/13.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("CapuserecordService")
public class CapuserecordServiceImpl implements CapuserecordService {

    @Autowired
    private CapuserecordMapper capuserecordMapper;
    @Override
    public void insert(Capuserecord entity) throws Exception {
        capuserecordMapper.insert(entity);
    }

    @Override
    public void update(Capuserecord entity) throws Exception {

    }

    @Override
    public void delete(Capuserecord entity) throws Exception {

    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public Capuserecord select(Capuserecord entity) {
        return null;
    }

    @Override
    public Page<Capuserecord> selectPage(Page<Capuserecord> page) {
        return null;
    }

    @Override
    public Page<Capuserecord> selectPageUseDyc(Page<Capuserecord> page) {
        return null;
    }
}
