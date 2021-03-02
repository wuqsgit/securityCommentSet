package com.ht70605.service;

import com.ht70605.entity.ProductUseRecordView;
import com.ht70605.entity.Productuserecord;

import java.util.List;

/**
 * Created by Administrator on 2017/7/13.
 */
public interface ProductUseRecordService extends BaseService<Productuserecord> {

    List<ProductUseRecordView> selectProductUseRecord (Productuserecord productuserecord);
}
