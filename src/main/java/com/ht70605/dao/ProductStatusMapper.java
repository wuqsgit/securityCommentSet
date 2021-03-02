package com.ht70605.dao;

import com.ht70605.entity.ProductStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductStatusMapper {
    int deleteByPrimaryKey(String id);

    int insert(ProductStatus record);

    int insertSelective(ProductStatus record);

    ProductStatus selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProductStatus record);

    int updateByPrimaryKey(ProductStatus record);

    int insertList(@Param("sql") String sql);

    List<ProductStatus>  getProductStatusByProductId(@Param("sql") String sql);

    void createTable(@Param("tName") String tName);

    void createTempView(@Param("tName")String tableName, @Param("viewName")String viewName);

    void createStateView(@Param("tName")String tableName, @Param("viewName")String viewName, @Param("tempview")String tempview);

    void createFatherProductView(@Param("tName")String tableName, @Param("viewName")String viewName);

    void createSonProductView(@Param("tName")String tableName, @Param("viewName")String viewName);
}