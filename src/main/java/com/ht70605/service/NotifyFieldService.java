package com.ht70605.service;

import com.ht70605.entity.NotifyField;

import java.util.List;

/**
 * Created by Administrator on 2017/7/25.
 */
public interface NotifyFieldService {

    List<NotifyField> findAllField();

    NotifyField getFieldByBusiness(String business);
}
