package com.ht70605.dao;

import com.ht70605.entity.Page;
import com.ht70605.entity.Product;
import com.ht70605.entity.ProductView;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 仅仅查询使用  需要动态设置表名
 */
public interface ProductViewMapper extends BaseMapper<ProductView>{
  /*  int insert(ProductView record);

    int insertSelective(ProductView record);*/

  List<ProductView> selectReturnbjProductOne(@Param("sql") String sql);


  int selectCountReturnbjProductOne(@Param("sql") String sql);

  List<String> selectFatherProductIds(@Param("sql") String sql);

  //查询子节点
  List<ProductView> selectSignalAndLeaves(@Param("sql") String sql);
}