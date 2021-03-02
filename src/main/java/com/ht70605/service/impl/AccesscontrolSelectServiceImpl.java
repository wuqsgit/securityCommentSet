package com.ht70605.service.impl;

import com.ht70605.dao.AccesscontrolselectMapper;
import com.ht70605.entity.AccesscontrolSelect;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.AccesscontrolSelectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * Created by 706 on 2017/7/5.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("AccesscontrolSelectService")
public class AccesscontrolSelectServiceImpl implements AccesscontrolSelectService{

    @Autowired
    private AccesscontrolselectMapper accesscontrolselectMapper;

    public void insert(AccesscontrolSelect entity) throws Exception {

    }

    public void update(AccesscontrolSelect entity) throws Exception {

    }

    public void delete(AccesscontrolSelect entity) throws Exception {
    }

    public void deleteList(String[] pks) throws Exception {
    }

    public AccesscontrolSelect select(AccesscontrolSelect entity) {
        return null;
    }

    public Page<AccesscontrolSelect> selectPage(Page<AccesscontrolSelect> page) {
        return null;
    }



    @Override
    public List<AccesscontrolSelect> selectAll() {
        List<AccesscontrolSelect> accesscontrolSelectList=   accesscontrolselectMapper.selectAll();
        return  accesscontrolSelectList;
    }
    @Override
    public Page<AccesscontrolSelect> selectPageUseDyc(Page<AccesscontrolSelect> page) {
        List<AccesscontrolSelect> accesscontrolSelects = accesscontrolselectMapper.selectPageListUseDyc(page);
        Integer integer = accesscontrolselectMapper.selectPageCountUseDyc(page);
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
