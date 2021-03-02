package com.ht70605.entity;

/**
 * Created by Administrator on 2017/6/19.
 */
public class Dept_View extends Department {
    private String sysUserName;
    private String superDepName;
    private String deptType;


    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName;
    }

    public String getSuperDepName() {
        return superDepName;
    }

    public void setSuperDepName(String superDepName) {
        this.superDepName = superDepName;
    }

    public String getDeptType() {
        return deptType;
    }

    public void setDeptType(String deptType) {
        this.deptType = deptType;
    }
}
