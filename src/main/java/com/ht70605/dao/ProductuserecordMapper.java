package com.ht70605.dao;

import com.ht70605.entity.ProductUseRecordView;
import com.ht70605.entity.Productuserecord;

import java.util.List;

public interface ProductuserecordMapper extends BaseMapper<Productuserecord>{

    //新增一个方法用于查询使用记录
    List<ProductUseRecordView>selectProductUseRecord(Productuserecord productuserecord);

}