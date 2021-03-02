package com.ht70605.service.impl;

import com.ht70605.dao.NotifyTopicMapper;
import com.ht70605.entity.NotifyTopic;
import com.ht70605.service.NotifyTopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/25.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("NotifyTopicService")
public class NotifyTopicServiceImpl implements NotifyTopicService {

    @Autowired
    private NotifyTopicMapper notifyTopicMapper;

    @Override
    public List<NotifyTopic> getNotifyTopicByUserId(String uid) {
        return notifyTopicMapper.getNotifyTopicByUserId(uid);
    }

    @Override
    public List<NotifyTopic> getNotifyTopicByTopic(String fieldId) {
        return notifyTopicMapper.getNotifyTopicByFieldId(fieldId);
    }
}
