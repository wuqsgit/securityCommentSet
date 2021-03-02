package com.ht70605.service;

import com.ht70605.entity.Location;

import java.util.List;
import java.util.Set;

/**
 * Created by 706 on 2017/6/28.
 */
public interface LocationService extends BaseService<Location> {

    void insertLocation(Location location);

    void updateLocation(Location location);

    List<Location> selectLocation();

    //List<Department> selectDepartment();

    List<Location> selectByLocationAndUnit(Location location);
    //获取所有的位置信息
    List<Location> selectAll();

    Set<Location> selectLocationByDept(String nodeId);

    List<Location> selectLocationBySysUserId(String s);

    Location getLocationById(String id);
}
