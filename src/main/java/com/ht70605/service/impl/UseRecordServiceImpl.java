package com.ht70605.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.dao.UseRecordMapper;
import com.ht70605.entity.*;
import com.ht70605.service.UseRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by 706 on 2017/7/6.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("UseRecordService")
public class UseRecordServiceImpl implements UseRecordService {

    @Autowired
    private UseRecordMapper useRecordMapper;


    public void insert(UseRecord application) throws Exception {

    }

    public void update(UseRecord entity) throws Exception {

    }

    public void delete(UseRecord entity) throws Exception {
    }

    public void deleteList(String[] pks) throws Exception {
    }

    public UseRecord select(UseRecord entity) {
        return null;
    }

    public Page<UseRecord> selectPage(Page<UseRecord> page) {
        return null;
    }


    @Override
    public Page<UseRecord> selectPageUseDyc(Page<UseRecord> page){return null;}

    @Override
    public Page<UseRecord> selectPageUseDyc1(Page<UseRecord> page,String pageString) {

        List<UseRecord> accesscontrolSelects = useRecordMapper.selectPageListUseDyc(page);
        JSONObject jsonParamEntity = JSON.parseObject(pageString).getJSONObject("paramEntity");

       if(jsonParamEntity!=null && jsonParamEntity.containsKey("capuseid")){
            String ids = jsonParamEntity.getString("capuseid");
            if(!StringUtils.isEmpty(ids)) {
                List<ProductUseRecordView> views = useRecordMapper.selectMx(ids);
                for (UseRecord useRecord : accesscontrolSelects) {
                    for(ProductUseRecordView view : views){
                        if(!StringUtils.isEmpty(view.getPid()) && view.getPid().equals(useRecord.getpId())){
                            useRecord.setDictionaryType(view.getDictionaryValue());
                            useRecord.setRfidCode(view.getRfidCode());
                        }
                   }
                }
            }
        }


        Integer integer = useRecordMapper.selectPageCountUseDyc(page);
        page.setList(accesscontrolSelects);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

   public Page<UseRecordAnalyze> selectUseNum(Page<UseRecordAnalyze> page){
        List<UseRecordAnalyze> inventoryitems = useRecordMapper.selectUseNum(page);
        Page<UseRecordAnalyze> p = new Page<UseRecordAnalyze>();
        p.setList(inventoryitems);
        return p;
    }
}
