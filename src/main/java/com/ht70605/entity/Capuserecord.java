package com.ht70605.entity;

public class Capuserecord {
    private String id;

    private String sysequipmentId;

    private String sysuserId;

    private String timeStart;

    private String timeEnd;

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

    public String getSysuserId() {
        return sysuserId;
    }

    public void setSysuserId(String sysuserId) {
        this.sysuserId = sysuserId;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }
}