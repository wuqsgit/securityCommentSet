package com.ht70605.entity;

/**
 * Created by Administrator on 2017/6/27.
 */
public class SysequipmentSelect extends Sysequipment{
    private String dictionaryValue;
    private String departmentid;
    private String departmentName;
    private String locationiInfo;
    private String sysuserName;

    public String getDictionaryValue() {
        return dictionaryValue;
    }

    public void setDictionaryValue(String dictionaryValue) {
        this.dictionaryValue = dictionaryValue;
    }

    public String getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(String departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getLocationiInfo() {
        return locationiInfo;
    }

    public void setLocationiInfo(String locationiInfo) {
        this.locationiInfo = locationiInfo;
    }

    public String getSysuserName() {
        return sysuserName;
    }

    public void setSysuserName(String sysuserName) {
        this.sysuserName = sysuserName;
    }
}
