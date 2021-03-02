package com.ht70605.entity;

/**
 * Created by Administrator on 2017/6/19.
 */
public class CheckoutbillitemSelect extends Checkoutbillitem {

    private String billCode;
    private String resDepartmentName;
    private String desDepartmentName;
    private String desDepartmentSysUserId;
    private String desDepartmentSysUser;
    private String info;
    private String productDictionaryValue;
    private String productModel;
    private String productProCode;
    private String productSerNum;
    private String productRfidCode;
    private String productProductId;

    public String getDesDepartmentSysUserId() {
        return desDepartmentSysUserId;
    }

    public void setDesDepartmentSysUserId(String desDepartmentSysUserId) {
        this.desDepartmentSysUserId = desDepartmentSysUserId;
    }

    public String getProductProductId() {
        return productProductId;
    }

    public void setProductProductId(String productProductId) {
        this.productProductId = productProductId;
    }

    public String getDesDepartmentName() {
        return desDepartmentName;
    }

    public void setDesDepartmentName(String desDepartmentName) {
        this.desDepartmentName = desDepartmentName;
    }

    public String getBillCode() {
        return billCode;
    }

    public void setBillCode(String billCode) {
        this.billCode = billCode;
    }

    public String getResDepartmentName() {
        return resDepartmentName;
    }

    public void setResDepartmentName(String resDepartmentName) {
        this.resDepartmentName = resDepartmentName;
    }

    public String getDesDepartmentSysUser() {
        return desDepartmentSysUser;
    }

    public void setDesDepartmentSysUser(String desDepartmentSysUser) {
        this.desDepartmentSysUser = desDepartmentSysUser;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getProductDictionaryValue() {
        return productDictionaryValue;
    }

    public void setProductDictionaryValue(String productDictionaryValue) {
        this.productDictionaryValue = productDictionaryValue;
    }

    public String getProductModel() {
        return productModel;
    }

    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }

    public String getProductProCode() {
        return productProCode;
    }

    public void setProductProCode(String productProCode) {
        this.productProCode = productProCode;
    }

    public String getProductSerNum() {
        return productSerNum;
    }

    public void setProductSerNum(String productSerNum) {
        this.productSerNum = productSerNum;
    }

    public String getProductRfidCode() {
        return productRfidCode;
    }

    public void setProductRfidCode(String productRfidCode) {
        this.productRfidCode = productRfidCode;
    }
}
