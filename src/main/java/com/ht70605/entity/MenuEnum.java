package com.ht70605.entity;

/**
 * Created by Administrator on 2017/8/22.
 */
public enum MenuEnum {

    密品清退("密品清退"),密品清点("密品清点");

    private String name;

    private MenuEnum(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
