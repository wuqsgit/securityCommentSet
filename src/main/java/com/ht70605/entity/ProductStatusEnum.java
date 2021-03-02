package com.ht70605.entity;

/**
 * Created by Administrator on 2017/8/28.
 */
public enum ProductStatusEnum {

    在库("1", "在库"),
    使用中("2", "使用中"),
    已配发未完成("3", "已配发未完成"),
    已配发已完成("4", "已配发已完成"),
    清退中("5", "清退中（清点计划下发后）"),
    待销毁("6", "待销毁（部里清退入库完成后）"),
    已销毁("7", "已销毁");

    private ProductStatusEnum(String status, String name){
        this.status = status;
        this.name = name;
    }

    private String status;

    private String name;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
