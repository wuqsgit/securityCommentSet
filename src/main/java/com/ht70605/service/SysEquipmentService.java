package com.ht70605.service;

import com.ht70605.entity.Dictionary;
import com.ht70605.entity.Location;
import com.ht70605.entity.Sysequipment;
import com.ht70605.entity.Sysuser;

import java.util.List;

//继承Service接口基类
public interface SysEquipmentService extends BaseService<Sysequipment> {

    List<Sysequipment> selectByIP(Sysequipment sysEquipmentBean);

    List<Dictionary> selectDictionary();

    List<Dictionary> selectSysequitMent();

    List<Location> selectLocation();

    List<Sysuser> selectSysuser();

    List<Sysuser> selectSysuserByUserDept(String s);

    List<Sysuser> selectSysuserByDeptId(String deptId);
}
