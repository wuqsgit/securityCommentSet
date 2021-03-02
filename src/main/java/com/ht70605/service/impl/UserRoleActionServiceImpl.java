package com.ht70605.service.impl;

import com.ht70605.dao.UserRoleActionMapper;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.entity.UserRoleAction;
import com.ht70605.service.UserRoleActionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/8/31.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("UserRoleActionService")
public class UserRoleActionServiceImpl implements UserRoleActionService {

    @Autowired
    private UserRoleActionMapper userRoleActionMapper;

    @Override
    public void insert(UserRoleAction test) throws Exception {
        userRoleActionMapper.insert(test);
    }

    @Override
    public void update(UserRoleAction entity) throws Exception {
        userRoleActionMapper.update(entity);
    }

    @Override
    public void delete(UserRoleAction entity) throws Exception {
        userRoleActionMapper.delete(entity);
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public UserRoleAction select(UserRoleAction entity) {
       return userRoleActionMapper.select(entity);
    }

    @Override
    public Page<UserRoleAction> selectPage(Page<UserRoleAction> page) {
        return null;
    }

    @Override
    public Page<UserRoleAction> selectPageUseDyc(Page<UserRoleAction> page) {
        return null;
    }
}
