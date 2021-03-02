package com.ht70605.service;

import com.ht70605.entity.*;

import java.util.List;

//继承Service接口基类
public interface SysUserService extends BaseService<Sysuser> {

    void insertUserrole(Userrole userrole);

    void updateUserrole(Userrole userrole);

    List<Role> selectRole();

    List<Department> selectDepartment();

    List<Sysuser> selectByNameAndUserName(Sysuser sysuserBean);
    //获取所有的用户信息
    List<Sysuser> selectAll();

    String selectDepartmentIdBySysUserId(String sysuserId);

    Sysuser getSysuserById(String id);

}
