package com.ht70605.entity;

/**
 * Created by Administrator on 2017/8/22.
 */
public enum OperationEnum{

     查询("查询"),新增主项("新增主项"),修改("修改"),删除主项("删除主项"),下发("下发消息"),删除子项("删除子项");

    private String name;

    private OperationEnum(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
