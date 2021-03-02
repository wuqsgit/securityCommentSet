package com.ht70605.service;

import com.ht70605.entity.ProductStatus;

import java.util.List;

/**
 * Created by Administrator on 2017/8/29.
 */
public interface ProductStatusService extends BaseService<ProductStatus>{

   void insertList(List<ProductStatus> productStatusList, String tableName);

   void createProductStatusTableAndView(String deptId);
}
