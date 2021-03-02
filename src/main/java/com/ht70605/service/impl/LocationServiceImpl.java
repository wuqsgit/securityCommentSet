package com.ht70605.service.impl;

import com.ht70605.dao.DepartmentMapper;
import com.ht70605.dao.LocationMapper;
import com.ht70605.entity.*;
import com.ht70605.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * Created by 706 on 2017/6/28.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("LocationService")
public class LocationServiceImpl implements LocationService {

    @Autowired
    private LocationMapper locationMapper;

    @Autowired
    private DepartmentMapper deptMapperDao;

    @Override
    public void insertLocation(Location location) {
        locationMapper.insert(location);
    }

    @Override
    public void updateLocation(Location location) {
      locationMapper.updateByPrimaryKeySelective(location);
    }

    @Override
    public List<Location> selectLocation() {
        return null;
    }

    @Override
    public Location getLocationById(String id){
        return locationMapper.selectByPrimaryKey(id);
    }

    //新建时候查询是否重复
    @Override
    public List<Location> selectByLocationAndUnit(Location location) {
        return locationMapper.selectByLocationAndUnit(location);
    }

    @Override
    public List<Location> selectAll() {
        return locationMapper.selectAll();
    }

    @Override
    public void insert(Location test) throws Exception {
        insertLocation(test);
    }

    @Override
    public void update(Location entity) throws Exception {
        updateLocation(entity);
    }

    @Override
    public void delete(Location entity) throws Exception {
        if(entity == null || StringUtils.isEmpty(entity.getId())){
            return ;
        }
        locationMapper.deleteByPrimaryKey(entity.getId());
    }

    @Override
    public void deleteList(String[] pks) throws Exception {
        locationMapper.deleteList(pks);
    }

    @Override
    public Location select(Location entity) {
        return locationMapper.select(entity);
    }

    @Override
    public Page<Location> selectPage(Page<Location> page) {
        return null;
    }

    //按照查询条件进行查询
    @Override
    public Page<Location> selectPageUseDyc(Page<Location> page) {
        List<Location> locations = locationMapper.selectPageListUseDyc(page);
        Integer integer = locationMapper.selectPageCountUseDyc(page);
        page.setList(locations);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public Set<Location> selectLocationByDept(String nodeId){
        Set<Location> locations = new HashSet<Location>();
        Department dept_views = deptMapperDao.selectByPrimaryKey(nodeId);
        if(dept_views != null){
            //继续递归
            getChildLocation(locations, dept_views.getId( ).toString( ), dept_views.getDepName());
        }
        return locations;
    }

    //获取子节点
    private void getChildLocation( Set<Location> locations, String parentId,String parentName )
    {
        Department dept=new Department();
        dept.setId(parentId);
        dept.setDepName(parentName);
        List<Dept_View> childPermissions = deptMapperDao.selectSuperDeptId(dept);
        List<Location> locationList = locationMapper.selectLocationByDept(parentId);
        locations.addAll(locationList);
//        只循环一次，表示只查询当前部门的位置讯息
//        if(childPermissions.size( )>0){
//            for ( Department childPermission : childPermissions )
//            {
//                getChildLocation( locations,childPermission.getId(),childPermission.getDepName() );
//            }
//        }
    }

    @Override
    public List<Location> selectLocationBySysUserId(String s) {
        return locationMapper.selectLocationBySysUserId(s);
    }
}
