package com.ht70605.dao;

import com.ht70605.entity.Inventory;
import com.ht70605.entity.Page;
import com.ht70605.entity.Product;
import com.ht70605.entity.Returnobject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper extends BaseMapper<Product>{
    List<Product> selectSignalAndLeaves(Page<Product> page);

    List<Product> selectPageListUseDycForRecord(Page<Product> page);

    Integer selectPageCountUseDycForRecord(Page<Product> page);

    List<Product> selectSignalLeaves(String id);

    List<Product> selectPageListMapper(Page<Product> page);

    List<Product> selectPageListMapperTwo(Page<Product> page);

    List<Product> selectPageListProduct(Inventory page);

    List<Product> selectReturnobjPageListProduct(Returnobject page);

    Integer selectPageListCountMapper(Page<Product> page);

    Integer selectPageCountListByMapperId(@Param(value = "array") String[] ids);

    Integer selectPageCountListMapper(Page<Product> page);

    Integer selectPageCountListMapperTwo(Page<Product> page);

    List<Product> selectPageListByMapperId(@Param(value="array") String[] ids, @Param(value = "start") Integer start,  @Param(value = "pageSize") Integer pageSize);

    List<Product> selectPageListByLeavesMapper(@Param(value="array") String[] ids, @Param(value="id") String id);

    Integer selectPageCountByMapperId(String[] ids);
    Page addFormSelect(Page page1);

    List<Product> selectPageListAddFormSelect(Page page);

    Integer selectPageCountAddFormSelect(Page page);
    public List<Product> selectApplicationNum(Page<Product> page);
    public List<Product> selectProductNumByApplication(Page<Product> page);
    public List<Product> selectProductNumByType(Page<Product> page);
    public List<Product> selectProductNumByLocation(Page<Product> page);

    Product selectOneById(String id);
    //FF新增查询用于密品信息2017-07-20
   public List<Product> selectListByParamEntity(Page<Product> page);

   //FF新增查询用于密品信息总数量2017-07-20
    Integer selectListByParamEntityCount (Page<Product> page);

}