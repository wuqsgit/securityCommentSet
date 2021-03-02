package com.ht70605.entity;

/**
 * Created by Administrator on 2017/6/19.
 */
public class CheckinbillSelect extends Checkinbill {

    private String productDictionaryId;
    private String productModel;
    private String applicationId;
    private String startTime;
    private String endTime;

    private String resDepartmentName;
    private String desDepartmentName;
    private String locationLocInfo;

    public String getLocationLocInfo() {
        return locationLocInfo;
    }

    public void setLocationLocInfo(String locationLocInfo) {
        this.locationLocInfo = locationLocInfo;
    }

    public String getResDepartmentName() {
        return resDepartmentName;
    }

    public void setResDepartmentName(String resDepartmentName) {
        this.resDepartmentName = resDepartmentName;
    }

    public String getDesDepartmentName() {
        return desDepartmentName;
    }

    public void setDesDepartmentName(String desDepartmentName) {
        this.desDepartmentName = desDepartmentName;
    }

    public String getProductDictionaryId() {
        return productDictionaryId;
    }

    public void setProductDictionaryId(String productDictionaryId) {
        this.productDictionaryId = productDictionaryId;
    }

    public String getProductModel() {
        return productModel;
    }

    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }

    public String getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

}
