package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public class Invent {
    public Inventory inventory;
    public List<Inventoryitem> inventoryitemList;
    public List<InventorySelect> inventorySelectList;

    public List<InventorySelect> getInventorySelectList() {
        return inventorySelectList;
    }

    public void setInventorySelectList(List<InventorySelect> inventorySelectList) {
        this.inventorySelectList = inventorySelectList;
    }

    public Inventory getInventory() {
        return inventory;
    }

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    public List<Inventoryitem> getInventoryitemList() {
        return inventoryitemList;
    }

    public void setInventoryitemList(List<Inventoryitem> inventoryitemList) {
        this.inventoryitemList = inventoryitemList;
    }
}
