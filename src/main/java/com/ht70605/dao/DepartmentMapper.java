package com.ht70605.dao;

import com.ht70605.entity.Department;
import com.ht70605.entity.Dept_View;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper extends BaseMapper<Department> {

    List<Dept_View> selectSuperDeptId(Department dept);
    Dept_View select(Department dept);

    Department selectSuperDeptByDeptId(@Param(value = "userId") String userId);

    String selectDepartmentIdBySysUserId(String sysuserId);

    void updateDepatmentAdmin(@Param(value="deptId") String deptId, @Param(value="userId") String userId);

    String selectSysUserIdByDepartmentId(String id);
}