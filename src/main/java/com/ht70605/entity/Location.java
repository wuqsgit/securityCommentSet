package com.ht70605.entity;

public class Location {
    private String id;

    private String locinfo;

    private String departmentid;

    private String creatTime;

    private String info;
    private String isUserable;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocinfo() {
        return locinfo;
    }

    public void setLocinfo(String locinfo) {
        this.locinfo = locinfo;
    }

    public String getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(String departmentid) {
        this.departmentid = departmentid;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getIsUserable() {
        return isUserable;
    }

    public void setIsUserable(String isUserable) {
        this.isUserable = isUserable;
    }
}