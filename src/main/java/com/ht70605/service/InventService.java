package com.ht70605.service;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.*;

import java.util.List;

//继承Service接口基类
public interface InventService extends BaseService<Invent> {

    Page selectPageUseDycInventory(Page<Inventory> page);

    Page selectPageUseDycInventoryitem(Page<Inventoryitem> page);

    Page selectInComNum(Page<Inventory> page);
    Page selectInNonComNum(Page<Inventory> page);

    void sendInventory(String inventoryId);

    void deleteItem(String[] pks, String inventId) throws Exception;

    Page<Inventory> selectPageUseSearch(Page<Inventory> page);

    Page<ProductView> insertPageUseSearch(Page<ProductView> page, JSONObject jsonObject);

    Page<Product> editPageUseSearch(Page<Product> page, String id);

    List<Inventory> selectInventByUserId(String userId);

    List<ProductView> selectProductPage(Inventory inventory, JSONObject json);

    void updateInventory(List<Inventory> inventoryList);

    Page<InventorySelect> selectjys(Page<Inventory> page);
}














