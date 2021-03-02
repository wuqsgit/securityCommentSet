package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
public class SyncLog {
    private String type;
    private String ip;
    private String time;
    private String userNum;
    private List<SyncLogInfo> syncObjInfoList;


    public String getType() {
        return type;
    }

    public void setType(String type) {
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

    public String getUserNum() {
        return userNum;
    }

    public void setUserNum(String userNum) {
        this.userNum = userNum;
    }


    public List<SyncLogInfo> getSyncObjInfoList() {
        return syncObjInfoList;
    }

    public void setSyncObjInfoList(List<SyncLogInfo> syncObjInfoList) {
        this.syncObjInfoList = syncObjInfoList;
    }
}
