package com.ht70605.service;

import com.ht70605.entity.Page;
import com.ht70605.entity.Product;
import com.ht70605.entity.Record;

//继承Service接口基类
public interface RecordService extends BaseService<Record> {
    Page selectPageUseDycProductForRecord(Page<Product> page);
}














