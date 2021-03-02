package com.ht70605.service;

import com.ht70605.entity.*;

import java.util.List;

//继承Service接口基类
public interface CheckInService extends BaseService<Checkin> {

    Page selectPageUseDycCheckinbill(Page<Checkinbill> page);

    Page selectPageUseDycCheckinbillitem(Page<Checkinbillitem> page);

    List<Application> selectApplication();

    String selectDepartmentIdBySysUserId(String sysuserId);

    void updateProductStorage(Product product);

    List<Dictionary> selectDictionary();

    void selectForUpdateCheckInBillResult(Checkinbill checkinBean);

    List<Location> selectDeptLocations(String deptNodeid);

    Product selectProductById(String productId);
}














