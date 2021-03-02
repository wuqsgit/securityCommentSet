package com.ht70605.dao;

import com.ht70605.entity.Dept;
import com.ht70605.entity.Page;

import java.util.List;

public interface DeptMapperDao extends BaseMapper<Dept> {

    List<Dept> selectAll();

//    List<Dept> selectBlurDeptId(Page<Dept> page);
//
//    List<Dept> selectSignalAndLeaves(Page<Dept> page);
}




