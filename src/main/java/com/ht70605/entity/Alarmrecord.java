package com.ht70605.entity;

public class Alarmrecord {
    private String id;

    private String sysequipmentId;

    private String productId;

    private String sysuserId;

    private String alarmTime;

    private String alarmType;

    private String solveTime;

    private String info;
    private String sysequipmentDicValue;//

    public String getSysequipmentDicValue() {
        return sysequipmentDicValue;
    }

    public void setSysequipmentDicValue(String sysequipmentDicValue) {
        this.sysequipmentDicValue = sysequipmentDicValue;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSysequipmentId() {
        return sysequipmentId;
    }

    public void setSysequipmentId(String sysequipmentId) {
        this.sysequipmentId = sysequipmentId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getSysuserId() {
        return sysuserId;
    }

    public void setSysuserId(String sysuserId) {
        this.sysuserId = sysuserId;
    }

    public String getAlarmTime() {
        return alarmTime;
    }

    public void setAlarmTime(String alarmTime) {
        this.alarmTime = alarmTime;
    }

    public String getAlarmType() {
        return alarmType;
    }

    public void setAlarmType(String alarmType) {
        this.alarmType = alarmType;
    }

    public String getSolveTime() {
        return solveTime;
    }

    public void setSolveTime(String solveTime) {
        this.solveTime = solveTime;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}