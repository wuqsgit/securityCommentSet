package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/7/13.
 */
public class SyncOnBox {
    private int type;
    private String ip;
    private String time;
    private List<SyncOnBoxInfo> syncObjInfoList;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<SyncOnBoxInfo> getSyncObjInfoList() {
        return syncObjInfoList;
    }

    public void setSyncObjInfoList(List<SyncOnBoxInfo> syncObjInfoList) {
        this.syncObjInfoList = syncObjInfoList;
    }
}
