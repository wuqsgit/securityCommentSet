package com.ht70605.service;
import com.ht70605.entity.Page;
import com.ht70605.entity.UseRecord;
import com.ht70605.entity.UseRecordAnalyze;
/**
 * Created by 706 on 2017/7/6.
 */
public interface UseRecordService extends BaseService<UseRecord>{
     Page selectUseNum(Page<UseRecordAnalyze> page);

     Page<UseRecord> selectPageUseDyc1(Page<UseRecord> page,String pageString);
}
