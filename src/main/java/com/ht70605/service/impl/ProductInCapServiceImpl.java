package com.ht70605.service.impl;

/**
 * Created by Administrator on 2017/7/13.
 */

import com.ht70605.dao.ProductincapMapper;
import com.ht70605.entity.Page;
import com.ht70605.entity.Productincap;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.ProductInCapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("ProductInCapService")
public class ProductInCapServiceImpl implements ProductInCapService {

    @Autowired
    private ProductincapMapper productincapMapper;

    @Override
    public void insert(Productincap test) throws Exception {
        productincapMapper.insert(test);
    }

    @Override
    public void update(Productincap entity) throws Exception {

    }

    @Override
    public void delete(Productincap entity) throws Exception {
        productincapMapper.delete(entity);
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public Productincap select(Productincap entity) {
        return null;
    }

    @Override
    public Page<Productincap> selectPage(Page<Productincap> page) {
        return null;
    }

    @Override
    public Page<Productincap> selectPageUseDyc(Page<Productincap> page) {
        return null;
    }
}
