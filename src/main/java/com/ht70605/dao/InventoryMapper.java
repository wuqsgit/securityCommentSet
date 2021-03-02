package com.ht70605.dao;

import com.ht70605.entity.Inventory;

import com.ht70605.entity.Page;
import com.ht70605.entity.InventorySelect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InventoryMapper extends BaseMapper<Inventory> {
    public List<InventorySelect> selectInventoryComNum(Page<Inventory> page);
    public List<InventorySelect> selectInventoryNonComNum(Page<Inventory> page);
    public List<InventorySelect> selectjys(Page<Inventory> page);

    List<Inventory> selectPageListSearch(Page<Inventory> page);

    List<Inventory> insertPageListSearch(Page<Inventory> page);

    Integer selectPageCountListSearch(Page<Inventory> page);

    List<Inventory> selectInventoryByUserId(@Param(value = "userId")String userId);

    void updateByPKey(Inventory inventory);
}
