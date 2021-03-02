package com.ht70605.dao;

import com.ht70605.entity.Page;
import com.ht70605.entity.Returnobj;
import com.ht70605.entity.Returnobject;
import com.ht70605.entity.ReturnobjectSelect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReturnobjectMapper extends BaseMapper<Returnobject> {

    List<ReturnobjectSelect> selectReturnComNum(Page<Returnobj> page);
    List<ReturnobjectSelect> selectReturnNonComNum(Page<Returnobj> page);
    List<ReturnobjectSelect> selectjys(Page<Returnobj> page);
    void deleteIdList(String[] pks);
    Integer selectPageCountListUseDyc(Page<Returnobject> page);

    Returnobject selectReturnobjectSelectByCheckInBill(@Param(value="checkinBill") String checkinBill);
}