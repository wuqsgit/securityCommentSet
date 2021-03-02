package com.ht70605.entity;

/**
 * Created by Administrator on 2017/5/10.
 */
public class Dept {
    private String id;
    private String deptName;
    private String deptNameIndex;
    private String superDeptId;
    private String dictionaryId;
    private String dictionaryValue;
    private String sysUserId;
    private String sysUserName;
    private String createTime;
    private String updateTime;
    private String info;
    private String status;

    public String getDeptNameIndex() {
        return deptNameIndex;
    }

    public void setDeptNameIndex(String deptNameIndex) {
        this.deptNameIndex = deptNameIndex;
    }

    public String getSuperDeptId() {

        return superDeptId;
    }

    public void setSuperDeptId(String superDeptId) {
        this.superDeptId = superDeptId;
    }

    public String getDictionaryId() {
        return dictionaryId;
    }

    public void setDictionaryId(String dictionaryId) {
        this.dictionaryId = dictionaryId;
    }

    public String getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(String sysUserId) {
        this.sysUserId = sysUserId;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }


    public String getDictionaryValue() {
        return dictionaryValue;
    }

    public void setDictionaryValue(String dictionaryValue) {
        this.dictionaryValue = dictionaryValue;
    }

    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

}
