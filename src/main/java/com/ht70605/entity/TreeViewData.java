package com.ht70605.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017-6-16.
 */
//组织结构
public class TreeViewData {

    private String status;
    private Map<String,Item>data;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Map<String, Item> getData() {
        return data;
    }

    public void setData(Map<String, Item> data) {
        this.data = data;
    }
}





