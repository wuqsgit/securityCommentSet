package com.ht70605.dao;

import com.ht70605.entity.Sysequipment;

import java.util.List;

public interface SysequipmentMapper extends BaseMapper<Sysequipment> {
    List<Sysequipment> selectByIP(Sysequipment sysEquipmentBean);
}