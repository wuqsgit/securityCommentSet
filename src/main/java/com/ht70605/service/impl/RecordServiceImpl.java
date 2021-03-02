package com.ht70605.service.impl;

import com.ht70605.dao.*;
import com.ht70605.entity.*;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("RecordService")
public class RecordServiceImpl implements RecordService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private CapuserecordMapper capuserecordMapper;
    @Autowired
    private ProductuserecordMapper productuserecordMapper;
    @Autowired
    private AccesscontrolMapper accesscontrolMapper;
    @Autowired
    private AlarmrecordMapper alarmrecordMapper;

    public void insert(Record record) throws Exception {
        if (record.getCapuserecord() != null) {
            try {
                record.getCapuserecord().forEach(capuserecord -> {
                    capuserecordMapper.insertSelective(capuserecord);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getProductuserecord() != null) {
            try {
                record.getProductuserecord().forEach(productuserecord -> {
                    productuserecordMapper.insertSelective(productuserecord);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getAccesscontrol() != null) {
            try {
                record.getAccesscontrol().forEach(accesscontrol -> {
                    accesscontrolMapper.insertSelective(accesscontrol);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getAlarmrecord() != null) {
            try {
                record.getAlarmrecord().forEach(alarmrecord -> {
                    alarmrecordMapper.insertSelective(alarmrecord);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void update(Record record) throws Exception {
        if (record.getCapuserecord() != null) {
            try {
                record.getCapuserecord().forEach(capuserecord -> {
                    capuserecordMapper.updateByPrimaryKeySelective(capuserecord);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getProductuserecord() != null) {
            try {
                record.getProductuserecord().forEach(productuserecord -> {
                    productuserecordMapper.updateByPrimaryKeySelective(productuserecord);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getAccesscontrol() != null) {
            try {
                record.getAccesscontrol().forEach(accesscontrol -> {
                    accesscontrolMapper.updateByPrimaryKeySelective(accesscontrol);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getAlarmrecord() != null) {
            try {
                record.getAlarmrecord().forEach(alarmrecord -> {
                    alarmrecordMapper.updateByPrimaryKeySelective(alarmrecord);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void delete(Record record) throws Exception {
        if (record.getCapuserecord() != null) {
            try {
                record.getCapuserecord().forEach(capuserecord -> {
                    capuserecordMapper.deleteByPrimaryKey(capuserecord.getId());
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getProductuserecord() != null) {
            try {
                record.getProductuserecord().forEach(productuserecord -> {
                    productuserecordMapper.deleteByPrimaryKey(productuserecord.getId());
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getAccesscontrol() != null) {
            try {
                record.getAccesscontrol().forEach(accesscontrol -> {
                    accesscontrolMapper.deleteByPrimaryKey(accesscontrol.getId());
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (record.getAlarmrecord() != null) {
            try {
                record.getAlarmrecord().forEach(alarmrecord -> {
                    alarmrecordMapper.deleteByPrimaryKey(alarmrecord.getId());
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    public Record select(Record record) {
        return null;
    }

    @Override
    public Page<Record> selectPage(Page<Record> recordPage) {
        return null;
    }

    @Override
    public Page<Record> selectPageUseDyc(Page<Record> page) {
        return null;
    }

    public Page<Product> selectPageUseDycProductForRecord(Page<Product> page) {
        List<Product> products = productMapper.selectPageListUseDycForRecord(page);
        Integer integer = productMapper.selectPageCountUseDycForRecord(page);
        page.setList(products);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }


}
