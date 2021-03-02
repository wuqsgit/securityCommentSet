package com.ht70605.service.impl;

import com.ht70605.dao.UserMapperDao;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.entity.User;
import com.ht70605.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("UserService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapperDao userMapperDao;


    public void insert(User test) throws Exception {

    }

    public void update(User entity) throws Exception {

    }

    public void delete(User entity) throws Exception {

    }

    public void deleteList(String[] pks) throws Exception {
        userMapperDao.deleteList(pks);
    }

    public User select(User entity) {
        return userMapperDao.select(entity);
    }

    public Page<User> selectPage(Page<User> page) {

        List<User> list = userMapperDao.selectPageList(page);
        page.setList(list);
        page.setTotalRecord(userMapperDao.selectPageCount(page));

        return page;
    }

    //多条件分页查询
    public Page<User> selectPageUseDyc(Page<User> page) {

        List<User> list = userMapperDao.selectPageListUseDyc(page);
        Integer count = userMapperDao.selectPageCountUseDyc(page);
        page.setList(list);
        page.setTotalRecord(count);
        return page;
    }

public List<User> selectAll() {
        List<User> list = userMapperDao.selectAll();
        return list;
        }
        }
