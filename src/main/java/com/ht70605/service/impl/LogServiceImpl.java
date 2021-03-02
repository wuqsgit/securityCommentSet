package com.ht70605.service.impl;

import com.ht70605.dao.LogMapper;
import com.ht70605.entity.Log;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/8/22.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("LogService")
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public void insert(Log test) throws Exception {
        logMapper.insert(test);
    }

    @Override
    public void update(Log entity) throws Exception {
        //return null;
       // logMapper.update(entity);
    }

    @Override
    public void delete(Log entity) throws Exception {
       // logMapper.delete(entity);
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public Log select(Log entity) {
        return null;
    }

    @Override
    public Page<Log> selectPage(Page<Log> page) {
        return null;
    }

    @Override
    public Page<Log> selectPageUseDyc(Page<Log> page) {
        List<Log>logPage=  logMapper.selectPageListUseDyc(page);
        Integer integer = logMapper.selectPageCountUseDyc(page);
        page.setList(logPage);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }
}
