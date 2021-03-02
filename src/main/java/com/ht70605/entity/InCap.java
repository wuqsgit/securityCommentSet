package com.ht70605.entity;

/**
 * Created by 706 on 2017/7/6.
 */
public class InCap {
    private String incapid;//在柜记录ID
    private String equipment;//监控设备
    private String location;//位置
    private String usename;//责任人
    private String productnum;//密品数量
    private String proCode;//列装号
    private String serNum;//出厂编号
    private String dictionaryType;//密品类别
    private String model;//密品型号
    private String rfidCode;//RDID编号
    private String application;//所属系统
    private String deptname;//所属单位
    private String sysIp;

    public String getSysIp() {
        return sysIp;
    }

    public void setSysIp(String sysIp) {
        this.sysIp = sysIp;
    }

    public String getIncapid() {
        return incapid;
    }

    public void setIncapid(String incapid) {
        this.incapid = incapid;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUsename() {
        return usename;
    }

    public void setUsename(String usename) {
        this.usename = usename;
    }

    public String getProductnum() {
        return productnum;
    }

    public void setProductnum(String productnum) {
        this.productnum = productnum;
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

    public String getDictionaryType() {
        return dictionaryType;
    }

    public void setDictionaryType(String dictionaryType) {
        this.dictionaryType = dictionaryType;
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

    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }
}
