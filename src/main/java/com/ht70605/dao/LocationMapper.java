package com.ht70605.dao;

import com.ht70605.entity.Location;

import java.util.List;

public interface LocationMapper extends BaseMapper<Location> {
    List<Location> selectByLocationAndUnit(Location location);

    List<Location> selectLocationByDept(String deptId);

    List<Location> selectLocationBySysUserId(String s);
}