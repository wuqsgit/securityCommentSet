package com.ht70605.entity;

/**
 * Created by 706 on 2017/7/6.
 */
public class UseRecord  {
    private String capuseid;//使用记录ID
    private String usename;//使用人
    private String rfidCode;//RDID编号
    private String proCode;//列装号
    private String serNum;//出厂编号
    private String dictionaryType;//密品类别
    private String model;//密品型号
    private String timeStart;//开柜时间
    private String timeEnd;//关柜时间
    private String application;//所属系统
    private String deptname;//所属单位
    private String equipment;//监控设备
    private String outin;//操作类别

    private String seIp;

    private String pId;

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getSeIp() {
        return seIp;
    }

    public void setSeIp(String seIp) {
        this.seIp = seIp;
    }

    public String getCapuseid() {
        return capuseid;
    }

    public void setCapuseid(String capuseid) {
        this.capuseid = capuseid;
    }

    public String getUsename() {
        return usename;
    }

    public void setUsename(String usename) {
        this.usename = usename;
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

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public String getOutin() {
        return outin;
    }

    public void setOutin(String outin) {
        this.outin = outin;
    }
}
