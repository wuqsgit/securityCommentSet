package com.ht70605.service.impl;

import com.ht70605.dao.DepartmentMapper;
import com.ht70605.dao.RoleMapper;
import com.ht70605.dao.SysuserMapper;
import com.ht70605.dao.UserroleMapper;
import com.ht70605.entity.*;
import com.ht70605.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("SysUserService")
public class SysUserServiceImpl implements SysUserService {


    @Autowired
    private SysuserMapper sysuserMapper;
    @Autowired
    private UserroleMapper userroleMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private DepartmentMapper departmentMapper;

    public void insert(Sysuser sysuser) throws Exception {
        sysuserMapper.insertSelective(sysuser);
    }

    public void update(Sysuser entity) throws Exception {
        sysuserMapper.updateByPrimaryKeySelective(entity);
    }

    @Override
    public Sysuser getSysuserById(String id){
        return sysuserMapper.selectByPrimaryKey(id);
    }

    public void delete(Sysuser entity) throws Exception {
        try {
            sysuserMapper.deleteByPrimaryKey(entity.getId());
            userroleMapper.deleteByPrimaryKey(entity.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteList(String[] pks) throws Exception {
        sysuserMapper.deleteList(pks);
    }

    public Sysuser select(Sysuser entity) {
        return sysuserMapper.select(entity);
    }

    public Page<Sysuser> selectPage(Page<Sysuser> page) {
        return null;
    }

    @Override
    public Page<Sysuser> selectPageUseDyc(Page<Sysuser> page) {
        List<Sysuser> sysusers = sysuserMapper.selectPageListUseDyc(page);
        Integer integer = sysuserMapper.selectPageCountUseDyc(page);
        page.setList(sysusers);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public void insertUserrole(Userrole userrole) {
        userroleMapper.insertSelective(userrole);
    }

    @Override
    public void updateUserrole(Userrole userrole) {
        userroleMapper.updateByPrimaryKeySelective(userrole);
    }

    @Override
    public List<Role> selectRole() {
        return roleMapper.selectAll();
    }

    @Override
    public List<Department> selectDepartment() {
        return departmentMapper.selectAll();
    }

    @Override
    public List<Sysuser> selectByNameAndUserName(Sysuser sysuserBean) {
        return sysuserMapper.selectByNameAndUserName(sysuserBean);
    }

    @Override
    public List<Sysuser> selectAll() {
        return sysuserMapper.selectAll();
    }

    @Override
    public String selectDepartmentIdBySysUserId(String sysuserId) {
        return sysuserMapper.selectDepartmentIdBySysUserId(sysuserId);
    }




}
