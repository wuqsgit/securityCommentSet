package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
public class SyncObj {
    private String type;
    private String time;
    private String status;
    private List<SyncObjInfo> syncObjInfoList;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<SyncObjInfo> getSyncObjInfoList() {
        return syncObjInfoList;
    }

    public void setSyncObjInfoList(List<SyncObjInfo> syncObjInfoList) {
        this.syncObjInfoList = syncObjInfoList;
    }
}
