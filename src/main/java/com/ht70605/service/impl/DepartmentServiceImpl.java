package com.ht70605.service.impl;

import com.ht70605.dao.DepartmentMapper;
import com.ht70605.entity.*;
import com.ht70605.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("DepartmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper deptMapperDao;

    @Override
    public void insert(Department entity) throws Exception {
        deptMapperDao.insert(entity);
    }

    @Override
    public void update(Department entity) throws Exception {
        deptMapperDao.update(entity);
    }

    @Override
    public void delete(Department entity) throws Exception {
        deptMapperDao.delete(entity);
    }

    public void deleteList(String[] pks) throws Exception {
        deptMapperDao.deleteList(pks);
    }

    @Override
    public Department select(Department entity) {
        entity= deptMapperDao.select(entity);
        return entity;
    }

    @Override
    public Page<Department> selectPage(Page<Department> page) {
        return null;
    }

    @Override
    public Page<Department> selectPageUseDyc(Page<Department> page) {
        return null;
    }
//
//    @Override
//    public Page<Department> selectPage(Page<Department> page) {
//        return null;
//    }
//
//    @Override
//    public Page<Department> selectPageUseDyc(Page<Department> page) {
//        return null;
//    }

    @Override
    public  void updateDepatmentAdmin(String deptId, String userId){
        deptMapperDao.updateDepatmentAdmin(deptId, userId);
    }

    @Override
    public boolean selectDeptAdmin(String deptId){
        Department department = deptMapperDao.selectByPrimaryKey(deptId);
        if(department != null && !StringUtils.isEmpty(department.getSysUserId())){
            return false;
        }
        return true;
    }

    //递归子节点
    private void getChildNodes(Map<String,Item> items, String parentId)
    {

        Department dept=new Department();
        dept.setId(parentId);
        List<Dept_View> dept_views = deptMapperDao.selectSuperDeptId(dept);
        if(dept_views.size( )>0){

            //添加一个总节点
//            Item item0=new Item( );
//            item0.setText("组织架构目录");
//            item0.setType("folder");
//            items.put("组织架构", item0 );
            for ( Dept_View dept1 : dept_views )
            {
                //递归子节点
                Item item=new Item( );
                item.setText(dept1.getDepName());
                item.setType("folder");

                getChildItems(item,dept1.getId( ).toString( ),dept1.getDepName( ));
                items.put( dept1.getDepName( ), item );
            }
        }

    }
    //获取子节点
    private void getChildItems( Item item, String parentId,String parentName )
    {
        Department dept=new Department();
        dept.setId(parentId);
        dept.setDepName(parentName);
        Dept_View dept_view= deptMapperDao.select(dept);
        List<Dept_View> childPermissions = deptMapperDao.selectSuperDeptId(dept);
        if(childPermissions.size( )>0){
            //父节点为“folder”
            item.setText(parentName);
            item.setType("folder");
            AdditionalParameters additionalParameters=new AdditionalParameters( );
            additionalParameters.setId( parentId );
            additionalParameters.setPid(dept_view.getSuperDepId());
            additionalParameters.setPname(dept_view.getSuperDepName());
            additionalParameters.setInfo(dept_view.getInfo());
            additionalParameters.setSysUserId(dept_view.getSysUserId());
            Map<String, Item> children=new LinkedHashMap<>( );
            for ( Department childPermission : childPermissions )
            {
                Item item2=new Item( );
                getChildItems( item2,childPermission.getId(),childPermission.getDepName() );
                children.put( childPermission.getDepName( ), item2 );
//                children.put( childPermission.getSuperDepId( ), item2 );//获取上级ID
//                children.put( childPermission.getSuperDepName( ), item2 );//获取上级名称
            }
            additionalParameters.setChildren(children);
            item.setAdditionalParameters( additionalParameters );

        }else{
            //子节点为“item”,获取当前
            item.setText(parentName);
            item.setType("item");
            AdditionalParameters additionalParameters=new AdditionalParameters( );
            additionalParameters.setId( parentId );
            additionalParameters.setPid(dept_view.getSuperDepId());
            additionalParameters.setPname(dept_view.getSuperDepName());
            additionalParameters.setInfo(dept_view.getInfo());
            additionalParameters.setSysUserId(dept_view.getSysUserId());
            item.setAdditionalParameters( additionalParameters );
        }


    }

    //获取单位树
    @Override
    public Map<String, Item> selectSuperDeptId(Department dept) {
        Map<String,Item> items = new LinkedHashMap<>( );
        getChildNodes(items, "0");//最外层节点父节点为空
        return items;
    }

    //获取单位树
    @Override
    public Map<String, Item> selectSuperDeptIdByUser(Department dept) {
        Map<String,Item> items = new LinkedHashMap<>( );
        if(dept != null && !StringUtils.isEmpty(dept.getId())) {
            Department dep = deptMapperDao.selectByPrimaryKey(dept.getId());
            if (dep != null) {
                Item item = new Item();
                item.setText(dep.getDepName());
                item.setType("folder");
                getChildItems(item,dep.getId( ).toString( ),dep.getDepName( ));
                items.put(dep.getDepName(), item);
            }
        }
        return items;
    }

    @Override
    public  Department selectSuperDeptByDeptId(String deptId){
        Department dept = deptMapperDao.selectSuperDeptByDeptId(deptId);
        return  dept;
    }

    public List<Department> getAllDepartment(){
      return  deptMapperDao.selectAll();
    }

    @Override
    public Department getDepartmentById(String id){
        return deptMapperDao.selectByPrimaryKey(id);
    }
}
