package com.ht70605.service;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.*;

import java.util.List;

//继承Service接口基类
public interface ReturnobjService extends BaseService<Returnobj> {
    Page selectReturnComNum(Page<Returnobj> page);
    Page selectReturnNonComNum(Page<Returnobj> page);
    Page selectjys(Page<Returnobj> page);
    Page selectPageUseDycReturnobject(Page<Returnobject> page);

    Page selectPageUseDycReturnobjectitem(Page<Returnobjectitem> page);

    Page<ProductView> insertPageUseSearch(Page<ProductView> page, JSONObject json);

    Page<Product> editPageUseSearch(Page<Product> page, String id);

    void deleteItem(String[] pks, String returnobjId, String deptId) throws Exception;

    void sendReturnobj(String returnobjId);

    List<ProductView> selectProductReturnobjPage(JSONObject jsonObject);

    void deleteAllList(String pks[], String tablename) throws Exception ;

}














