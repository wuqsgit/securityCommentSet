package com.ht70605.service.impl;

import com.ht70605.dao.NotifyMessageMapper;
import com.ht70605.entity.NotifyMessage;
import com.ht70605.service.NotifyMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/25.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("NotifyMessageService")
public class NotifyMessageServiceImpl implements NotifyMessageService {

    @Autowired
    private NotifyMessageMapper notifyMessageMapper;

    @Override
    public void saveNotifyMessage(NotifyMessage notifyMessage) {
        notifyMessageMapper.insert(notifyMessage);
    }
}
