package com.ht70605.dao;

import com.ht70605.entity.Returnobjectitem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReturnobjectitemMapper extends BaseMapper<Returnobjectitem> {

    void deleteIdList(String[] pks);

    List<Returnobjectitem> selectReturnobjectitemByReturnobjId(@Param(value="inid") String inid);

    void deleteItemByReturnobjIdAndProductId(@Param(value="proId") String proId, @Param(value="returnobjId") String returnobjId);

}