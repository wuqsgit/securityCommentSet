package com.ht70605.entity;

public class Accesscontrol {
    private String id;

    private String productId;

    private String sysequipmentId;

    private String accessTime;
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

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getSysequipmentId() {
        return sysequipmentId;
    }

    public void setSysequipmentId(String sysequipmentId) {
        this.sysequipmentId = sysequipmentId;
    }

    public String getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(String accessTime) {
        this.accessTime = accessTime;
    }
}