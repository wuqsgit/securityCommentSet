package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/22.
 */
public class Record {

    private ProductForRecord productForRecord;//密品

    private List<Capuserecord> capuserecord;//开柜记录
    private List<Productuserecord> productuserecord;//取放记录
    private List<Accesscontrol> accesscontrol;//出入记录
    private List<Alarmrecord> alarmrecord;//报警记录

    public ProductForRecord getProductForRecord() {
        return productForRecord;
    }

    public void setProductForRecord(ProductForRecord productForRecord) {
        this.productForRecord = productForRecord;
    }

    public List<Capuserecord> getCapuserecord() {
        return capuserecord;
    }

    public void setCapuserecord(List<Capuserecord> capuserecord) {
        this.capuserecord = capuserecord;
    }

    public List<Productuserecord> getProductuserecord() {
        return productuserecord;
    }

    public void setProductuserecord(List<Productuserecord> productuserecord) {
        this.productuserecord = productuserecord;
    }

    public List<Accesscontrol> getAccesscontrol() {
        return accesscontrol;
    }

    public void setAccesscontrol(List<Accesscontrol> accesscontrol) {
        this.accesscontrol = accesscontrol;
    }

    public List<Alarmrecord> getAlarmrecord() {
        return alarmrecord;
    }

    public void setAlarmrecord(List<Alarmrecord> alarmrecord) {
        this.alarmrecord = alarmrecord;
    }
}
