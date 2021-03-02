package com.ht70605.dao;

import com.ht70605.entity.Inventoryitem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InventoryitemMapper extends BaseMapper<Inventoryitem> {

    void deleteIdList(String[] pks);

    List<Inventoryitem> selectInventoryitemByInvenId(@Param(value="inid") String inid);

    void deleteItemByInventIdAndProductId(@Param(value="proId") String proId, @Param(value="inventId") String inventId);
}