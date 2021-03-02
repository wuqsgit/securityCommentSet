package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/17.
 */
public class Checkin {
    public Checkinbill checkinbill;
    public List<Checkinbillitem> checkinbillitemList;
    public List<Product> productList;

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public List<Checkinbillitem> getCheckinbillitemList() {
        return checkinbillitemList;
    }

    public void setCheckinbillitemList(List<Checkinbillitem> checkinbillitemList) {
        this.checkinbillitemList = checkinbillitemList;
    }

    public Checkinbill getCheckinbill() {
        return checkinbill;
    }

    public void setCheckinbill(Checkinbill checkinbill) {
        this.checkinbill = checkinbill;
    }
}
