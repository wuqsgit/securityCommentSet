package com.ht70605.dao;

import com.ht70605.entity.NotifyTopic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NotifyTopicMapper extends BaseMapper<NotifyTopic> {

  List<NotifyTopic> getNotifyTopicByUserId(@Param(value = "uid") String uid);

  List<NotifyTopic> getNotifyTopicByFieldId(@Param(value = "fieldId") String fieldId);
}