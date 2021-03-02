package com.ht70605.service;

import com.ht70605.entity.Department;
import com.ht70605.entity.Item;

import java.util.List;
import java.util.Map;

//继承Service接口基类
public interface DepartmentService extends BaseService<Department> {

    Map<String,Item> selectSuperDeptId(Department dept);

    List<Department>  getAllDepartment();

    Map<String, Item> selectSuperDeptIdByUser(Department dept);

    Department selectSuperDeptByDeptId(String userId);

    boolean selectDeptAdmin(String deptId);

    void updateDepatmentAdmin(String deptId, String userId);

    Department getDepartmentById(String id);
}
