package com.ht70605.dao;

import com.ht70605.entity.Checkoutbill;
import org.apache.ibatis.annotations.Param;

public interface CheckoutbillMapper extends BaseMapper<Checkoutbill>{

    Checkoutbill getCheckoutBillByBillCodeAndDeptId(@Param("billCode")String billCode, @Param("resDeptId")String resDeptId);
}