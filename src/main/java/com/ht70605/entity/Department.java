package com.ht70605.entity;

public class Department {
    private String id;

    private String depName;

    private String superDepId;

    private String dictionaryId;

    private String sysUserId;

    private String info;

    private String createTime;

    private String updateTime;

    private String deptSort;

    private String status;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getSuperDepId() {
        return superDepId;
    }

    public void setSuperDepId(String superDepId) {
        this.superDepId = superDepId;
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

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getDeptSort() {
        return deptSort;
    }

    public void setDeptSort(String deptSort) {
        this.deptSort = deptSort;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}