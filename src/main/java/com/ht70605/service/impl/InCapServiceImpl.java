package com.ht70605.service.impl;

import com.ht70605.dao.InCapMapper;
import com.ht70605.dao.ProductMapper;
import com.ht70605.entity.InCap;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.InCapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * Created by 706 on 2017/7/6.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("InCapService")
public class InCapServiceImpl implements InCapService {
    @Autowired
    private InCapMapper inCapMapper;

    @Autowired
    private ProductMapper productMapper;

    public void insert(InCap entity) throws Exception {

    }

    public void update(InCap entity) throws Exception {

    }

    public void delete(InCap entity) throws Exception {
    }

    public void deleteList(String[] pks) throws Exception {
    }

    public InCap select(InCap entity) {
        return null;
    }

    public Page<InCap> selectPage(Page<InCap> page) {
        return null;
    }



    @Override
    public Page<InCap> selectPageUseDyc(Page<InCap> page) {
        List<InCap> accesscontrolSelects = inCapMapper.selectPageListUseDyc(page);
        Integer integer = inCapMapper.selectPageCountUseDyc(page);
        page.setList(accesscontrolSelects);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }
}
