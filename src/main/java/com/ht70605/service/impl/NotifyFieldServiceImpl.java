package com.ht70605.service.impl;

import com.ht70605.dao.NotifyFieldMapper;
import com.ht70605.entity.NotifyField;
import com.ht70605.service.NotifyFieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/25.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("NotifyFieldService")
public class NotifyFieldServiceImpl implements NotifyFieldService {

    @Autowired
    private NotifyFieldMapper notifyFieldMapper;

    @Override
    public List<NotifyField> findAllField() {
        return notifyFieldMapper.selectAll();
    }

    @Override
    public NotifyField getFieldByBusiness(String business) {
        return  notifyFieldMapper.getFieldByBusiness(business);
    }
}
