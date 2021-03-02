package com.ht70605.entity;

/**
 * Created by Administrator on 2017/6/22.
 */
public class ProductForRecord extends Product {
    private String sysEquipmentValue;
    private String recordType;
    private String recordTime;

    public String getSysEquipmentValue() {
        return sysEquipmentValue;
    }

    public void setSysEquipmentValue(String sysEquipmentValue) {
        this.sysEquipmentValue = sysEquipmentValue;
    }

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime;
    }
}
