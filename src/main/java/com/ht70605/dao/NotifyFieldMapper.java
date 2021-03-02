package com.ht70605.dao;

import com.ht70605.entity.NotifyField;
import org.apache.ibatis.annotations.Param;

public interface NotifyFieldMapper extends BaseMapper<NotifyField> {

    NotifyField getFieldByBusiness(@Param(value = "business") String business);

}