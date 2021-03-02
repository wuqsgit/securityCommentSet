package com.ht70605.dao;

import com.ht70605.entity.Page;
import com.ht70605.entity.ProductUseRecordView;
import com.ht70605.entity.UseRecord;
import com.ht70605.entity.UseRecordAnalyze;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Created by 706 on 2017/7/6.
 */
public interface UseRecordMapper extends BaseMapper<UseRecord>{
    public List<UseRecordAnalyze> selectUseNum(Page<UseRecordAnalyze> page);

    List<ProductUseRecordView> selectMx(@Param(value = "ids")String ids);
}
