package com.ht70605.entity;

import java.util.List;

public class ProductView {
    private String id;

    private String createTime;

    private String info;

    private String level;

    private String productId;

    private String dictionaryId;

    private String status;

    private String locationId;

    private String locationInfo;

    private String updateTime;

    private String sysuserId;

    private String sysuserName;

    private String departmentId;

    private String departmentName;

    private String rfidCode;

    private String model;

    private String proCode;

    private String serNum;

    private String applicationId;

    private String dictionaryvalue;

    private String applicationName;

    private char isUserable;

    private List<ProductView> productViewList;

    private int isTrue;//用于判断是否符合要求 0表示不符合要求

    public int getIsTrue() {
        return isTrue;
    }

    public void setIsTrue(int isTrue) {
        this.isTrue = isTrue;
    }

    private String ProCode_begin;
    private String ProCode_end;

    public char getIsUserable() {
        return isUserable;
    }

    public void setIsUserable(char isUserable) {
        this.isUserable = isUserable;
    }

    public String getApplicationName() {
        return applicationName;
    }

    public void setApplicationName(String applicationName) {
        this.applicationName = applicationName;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getDictionaryId() {
        return dictionaryId;
    }

    public void setDictionaryId(String dictionaryId) {
        this.dictionaryId = dictionaryId;
    }

    public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public String getLocationInfo() {
        return locationInfo;
    }

    public void setLocationInfo(String locationInfo) {
        this.locationInfo = locationInfo;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getSysuserId() {
        return sysuserId;
    }

    public void setSysuserId(String sysuserId) {
        this.sysuserId = sysuserId;
    }

    public String getSysuserName() {
        return sysuserName;
    }

    public void setSysuserName(String sysuserName) {
        this.sysuserName = sysuserName;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getRfidCode() {
        return rfidCode;
    }

    public void setRfidCode(String rfidCode) {
        this.rfidCode = rfidCode;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode;
    }

    public String getSerNum() {
        return serNum;
    }

    public void setSerNum(String serNum) {
        this.serNum = serNum;
    }

    public String getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    public String getDictionaryvalue() {
        return dictionaryvalue;
    }

    public void setDictionaryvalue(String dictionaryvalue) {
        this.dictionaryvalue = dictionaryvalue;
    }


    public List<ProductView> getProductViewList() {
        return productViewList;
    }

    public void setProductViewList(List<ProductView> productViewList) {
        this.productViewList = productViewList;
    }

    public String getProCode_begin() {
        return ProCode_begin;
    }

    public void setProCode_begin(String proCode_begin) {
        ProCode_begin = proCode_begin;
    }

    public String getProCode_end() {
        return ProCode_end;
    }

    public void setProCode_end(String proCode_end) {
        ProCode_end = proCode_end;
    }
}