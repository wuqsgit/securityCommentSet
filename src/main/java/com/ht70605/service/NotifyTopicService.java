package com.ht70605.service;

import com.ht70605.entity.NotifyTopic;

import java.util.List;

/**
 * Created by Administrator on 2017/7/25.
 */
public interface NotifyTopicService {
    List<NotifyTopic> getNotifyTopicByUserId(String uid);

    List<NotifyTopic> getNotifyTopicByTopic(String fieldId);
}
