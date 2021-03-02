package com.ht70605.service.impl;

import com.ht70605.dao.UserroleMapper;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.entity.Userrole;
import com.ht70605.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/17.
 */

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("UserRoleService")
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserroleMapper userroleMapper;

    /*@Override
    public Userrole selectUserroleByUserId(String userId){
        return null;
    }*/

    @Override
    public void insert(Userrole test) throws Exception {

    }

    @Override
    public void update(Userrole entity) throws Exception {

    }

    @Override
    public void delete(Userrole entity) throws Exception {

    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public Userrole select(Userrole entity) {

            return userroleMapper.select(entity);
    }

    @Override
    public Page<Userrole> selectPage(Page<Userrole> page) {

      return (Page<Userrole>) userroleMapper.selectPageListUseDyc(page);
       // return userroleMapper.selectPageList(page);
    }

    @Override
    public Page<Userrole> selectPageUseDyc(Page<Userrole> page) {
        return (Page<Userrole>) userroleMapper.selectPageListUseDyc(page);
    }
}
