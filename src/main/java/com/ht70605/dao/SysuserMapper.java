package com.ht70605.dao;

import com.ht70605.entity.Sysuser;

import java.util.List;

public interface SysuserMapper extends BaseMapper<Sysuser> {
    List<Sysuser> selectByNameAndUserName(Sysuser sysuserBean);

    String selectDepartmentIdBySysUserId(String sysuserId);

    List<Sysuser> selectUserByDeptId(String deptId);

    List<Sysuser> selectSysuserByUserDept(String s);

}