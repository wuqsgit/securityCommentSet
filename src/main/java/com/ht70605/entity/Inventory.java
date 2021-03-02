package com.ht70605.entity;

import java.util.List;

public class Inventory {
    private String id;

    private String dictionaryid;

    private String applicationid;

    private String sysuserid;

    private String creattime;

    private String result;

    private String rettime;

    private String status;

    private String performer;

    private String locationid;

    private List<Product> products;

    private String departmentid;

    private List<Inventoryitem> inventoryitems;

    public List<InventoryitemSelect> inventoryitemSelects;

    public List<InventoryitemSelect> getInventoryitemSelects() {
        return inventoryitemSelects;
    }

    public void setInventoryitemSelects(List<InventoryitemSelect> inventoryitemSelects) {
        this.inventoryitemSelects = inventoryitemSelects;
    }

    public List<Inventoryitem> getInventoryitems() {
        return inventoryitems;
    }

    public void setInventoryitems(List<Inventoryitem> inventoryitems) {
        this.inventoryitems = inventoryitems;
    }

    public String getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(String departmentid) {
        this.departmentid = departmentid;
    }

    public String getLocationid() {
        return locationid;
    }

    public void setLocationid(String locationid) {
        this.locationid = locationid;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDictionaryid() {
        return dictionaryid;
    }

    public void setDictionaryid(String dictionaryid) {
        this.dictionaryid = dictionaryid;
    }

    public String getApplicationid() {
        return applicationid;
    }

    public void setApplicationid(String applicationid) {
        this.applicationid = applicationid;
    }

    public String getSysuserid() {
        return sysuserid;
    }

    public void setSysuserid(String sysuserid) {
        this.sysuserid = sysuserid;
    }

    public String getCreattime() {
        return creattime;
    }

    public void setCreattime(String creattime) {
        this.creattime = creattime;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getRettime() {
        return rettime;
    }

    public void setRettime(String rettime) {
        this.rettime = rettime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer;
    }

    @Override
    public boolean equals(Object obj) {
        Inventory inventory;
        if(obj instanceof  Inventory){
            inventory = (Inventory)obj;
        }else{
            return false;
        }
        return id.equals(inventory.id) ? true : false;
    }

    @Override
    public int hashCode() {
        return Long.valueOf(id) > Integer.MAX_VALUE ? Integer.valueOf(id.substring(0, 6)):Integer.valueOf(id);
    }
}