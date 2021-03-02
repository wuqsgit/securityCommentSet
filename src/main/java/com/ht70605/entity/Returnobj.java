package com.ht70605.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public class Returnobj {
    public Returnobject returnobject;
    public List<Returnobjectitem> returnobjectitemList;

    public Returnobject getReturnobject() {
        return returnobject;
    }

    public void setReturnobject(Returnobject returnobject) {
        this.returnobject = returnobject;
    }

    public List<Returnobjectitem> getReturnobjectitemList() {
        return returnobjectitemList;
    }

    public void setReturnobjectitemList(List<Returnobjectitem> returnobjectitemList) {
        this.returnobjectitemList = returnobjectitemList;
    }
}
