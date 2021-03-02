package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/17.
 */
public class Checkout {
    public Checkoutbill checkoutbill;
    public List<Checkoutbillitem> checkoutbillitemList;
    public List<Product> productList;

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public List<Checkoutbillitem> getCheckoutbillitemList() {
        return checkoutbillitemList;
    }

    public void setCheckoutbillitemList(List<Checkoutbillitem> checkoutbillitemList) {
        this.checkoutbillitemList = checkoutbillitemList;
    }

    public Checkoutbill getCheckoutbill() {
        return checkoutbill;
    }

    public void setCheckoutbill(Checkoutbill checkoutbill) {
        this.checkoutbill = checkoutbill;
    }
}
