package com.ht70605.entity;

/**
 * Created by Administrator on 2017/7/21.
 */
public class ProductUseRecordView  extends Product  {
    private String capUseRecord_id;
    private String product_id;
    private String InOut;
    private String pid;


    public String getCapUseRecord_id() {
        return capUseRecord_id;
    }

    public void setCapUseRecord_id(String capUseRecord_id) {
        this.capUseRecord_id = capUseRecord_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getInOut() {
        return InOut;
    }

    public void setInOut(String inOut) {
        InOut = inOut;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
