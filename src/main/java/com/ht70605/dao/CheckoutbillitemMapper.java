package com.ht70605.dao;

import com.ht70605.entity.Checkoutbillitem;

import java.util.List;

public interface CheckoutbillitemMapper extends BaseMapper<Checkoutbillitem> {
    List<Checkoutbillitem> selectByCheckOutBillId(String checkOutBillId);

}