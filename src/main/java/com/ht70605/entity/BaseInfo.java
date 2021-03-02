package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/7/8.
 */
public class BaseInfo {

    private List<Sysuser> sysusers;
    private List<Department> departmentList;
    private List<Dictionary> dictionaryList;
    private List<Location> locationList;
    private List<Application> applicationList;

    public List<Sysuser> getSysusers() {
        return sysusers;
    }

    public void setSysusers(List<Sysuser> sysusers) {
        this.sysusers = sysusers;
    }

    public List<Department> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(List<Department> departmentList) {
        this.departmentList = departmentList;
    }

    public List<Dictionary> getDictionaryList() {
        return dictionaryList;
    }

    public void setDictionaryList(List<Dictionary> dictionaryList) {
        this.dictionaryList = dictionaryList;
    }

    public List<Location> getLocationList() {
        return locationList;
    }

    public void setLocationList(List<Location> locationList) {
        this.locationList = locationList;
    }

    public List<Application> getApplicationList() {
        return applicationList;
    }

    public void setApplicationList(List<Application> applicationList) {
        this.applicationList = applicationList;
    }
}
