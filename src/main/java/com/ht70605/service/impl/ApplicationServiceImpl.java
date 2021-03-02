package com.ht70605.service.impl;

import com.ht70605.dao.ApplicationMapper;
import com.ht70605.entity.Application;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("ApplicationService")
public class ApplicationServiceImpl implements ApplicationService {


    @Autowired
    private ApplicationMapper applicationMapper;

    public void insert(Application entity) throws Exception {
        applicationMapper.insertSelective(entity);
    }

    public void update(Application entity) throws Exception {
        applicationMapper.updateByPrimaryKeySelective(entity);
    }

    public void delete(Application entity) throws Exception {
    }

    public void deleteList(String[] pks) throws Exception {
        applicationMapper.deleteList(pks);
    }

    public Application select(Application entity) {
        return applicationMapper.select(entity);
    }

    public Page<Application> selectPage(Page<Application> page) {
        return null;
    }

    @Override
    public Page<Application> selectPageUseDyc(Page<Application> page) {
        List<Application> applications = applicationMapper.selectPageListUseDyc(page);
        Integer integer = applicationMapper.selectPageCountUseDyc(page);
        page.setList(applications);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public List<Application> selectAll() {
      List<Application> applicationList=   applicationMapper.selectAll();
      return  applicationList;
    }
}
