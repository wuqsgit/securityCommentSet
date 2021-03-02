package com.ht70605.entity;

/**
 * Created by 706 on 2017/7/5.
 */
public class AccesscontrolSelect extends Accesscontrol {
    private String rfidCode;//RDID编号
    private String proCode;//列装号
    private String serNum;//出厂编号
    private String dictionaryType;//密品类别
    private String model;//密品型号
    private String sysUserName;//责任人
    private String equipment;//监控设备

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

    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }
}
