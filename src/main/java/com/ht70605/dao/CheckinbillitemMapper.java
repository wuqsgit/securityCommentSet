package com.ht70605.dao;

import com.ht70605.entity.Checkinbillitem;

import java.util.List;

public interface CheckinbillitemMapper extends BaseMapper<Checkinbillitem> {
    List<Checkinbillitem> selectByCheckInBillId(String checkInBillId);
}