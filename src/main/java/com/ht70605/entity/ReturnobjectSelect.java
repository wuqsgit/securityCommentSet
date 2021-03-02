package com.ht70605.entity;

/**
 * Created by Administrator on 2017/6/21.
 */
public class ReturnobjectSelect extends Returnobject {
    private String startTime;
    private String endTime;

    private String departmentName;
    private String applicationName;
    private String dictionaryValue;
    private String sysuserName;
    private String locInfo;

    private String completeNum;//未完成数量
    private String noncompleteNum;//未完成数量
    private String month;//统计月份

    private String model;

    private String proCode;//列传号
    private String  serNum;//出厂编号
    private String rfidCode;


    public String getLocInfo() {
        return locInfo;
    }

    public void setLocInfo(String locInfo) {
        this.locInfo = locInfo;
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

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getApplicationName() {
        return applicationName;
    }

    public void setApplicationName(String applicationName) {
        this.applicationName = applicationName;
    }

    public String getDictionaryValue() {
        return dictionaryValue;
    }

    public void setDictionaryValue(String dictionaryValue) {
        this.dictionaryValue = dictionaryValue;
    }

    public String getSysuserName() {
        return sysuserName;
    }

    public void setSysuserName(String sysuserName) {
        this.sysuserName = sysuserName;
    }

    public String getCompleteNum() {
        return completeNum;
    }

    public void setCompleteNum(String completeNum) {
        this.completeNum = completeNum;
    }

    public String getNoncompleteNum() {
        return noncompleteNum;
    }

    public void setNoncompleteNum(String noncompleteNum) {
        this.noncompleteNum = noncompleteNum;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRfidCode() {
        return rfidCode;
    }

    public void setRfidCode(String rfidCode) {
        this.rfidCode = rfidCode;
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
}
