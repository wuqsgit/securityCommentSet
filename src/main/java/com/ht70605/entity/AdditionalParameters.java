package com.ht70605.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/19.
 */
public class AdditionalParameters
{
    /**
     * node id
     */
    private String id;
    private  String pid;
    private String pname;
    private String info;
    private String sysUserId;
    /**
     * subnode ifno
     */
    private Map<String,Item> children;

    /**
     * node chosen
     */
    @JsonProperty(value="item-selected")
    private boolean itemSelected ;



    public String getId( )
    {
        return id;
    }


    public void setId( String id )
    {
        this.id = id;
    }



    public Map<String, Item> getChildren( )
    {
        return children;
    }



    public void setChildren( Map<String, Item> children )
    {
        this.children = children;
    }


    public boolean isItemSelected( )
    {
        return itemSelected;
    }


    public void setItemSelected( boolean itemSelected )
    {
        this.itemSelected = itemSelected;
    }


    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(String sysUserId) {
        this.sysUserId = sysUserId;
    }
}