package com.ht70605.service;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.*;

import java.util.List;

//继承Service接口基类
public interface CheckOutService extends BaseService<Checkout> {

    Page selectPageUseDycCheckoutbill(Page<Checkoutbill> page);

    Page selectPageUseDycCheckoutbillitem(Page<Checkoutbillitem> page);

    List<Application> selectApplication();

    String selectDepartmentIdBySysUserId(String sysuserId);

    void updateProductStorage(Product product);

    JSONObject addFormSelect(Page page);

    JSONObject addProductSelect(Page page,JSONObject jsonObject);

    List<Location> selectDeptLocations(String deptNodeid);

    List<Sysuser> selectDeptSysusers(String deptNodeid);

    String selectSysUserIdByDepartmentId(String id);

    Checkoutbill getCheckoutBillByBillCodeAndDeptId(String billCode, String resDeptId);
}














