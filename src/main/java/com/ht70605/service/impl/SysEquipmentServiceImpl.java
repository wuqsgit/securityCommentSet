package com.ht70605.service.impl;

import com.ht70605.dao.DictionaryMapper;
import com.ht70605.dao.LocationMapper;
import com.ht70605.dao.SysequipmentMapper;
import com.ht70605.dao.SysuserMapper;
import com.ht70605.entity.*;
import com.ht70605.service.SysEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("SysEquipmentService")
public class SysEquipmentServiceImpl implements SysEquipmentService {

    @Autowired
    private SysequipmentMapper sysequipmentMapper;
    @Autowired
    private DictionaryMapper dictionaryMapper;
    @Autowired
    private LocationMapper locationMapper;
    @Autowired
    private SysuserMapper sysuserMapper;

    public void insert(Sysequipment sysequipment) throws Exception {
        sysequipmentMapper.insertSelective(sysequipment);
    }

    public void update(Sysequipment entity) throws Exception {
        sysequipmentMapper.updateByPrimaryKeySelective(entity);
    }

    public void delete(Sysequipment entity) throws Exception {
    }

    public void deleteList(String[] pks) throws Exception {
        sysequipmentMapper.deleteList(pks);
    }

    public Sysequipment select(Sysequipment entity) {
        return sysequipmentMapper.select(entity);
    }

    public Page<Sysequipment> selectPage(Page<Sysequipment> page) {
        return null;
    }

    @Override
    public Page<Sysequipment> selectPageUseDyc(Page<Sysequipment> page) {
        List<Sysequipment> sysequipments = sysequipmentMapper.selectPageListUseDyc(page);
        Integer integer = sysequipmentMapper.selectPageCountUseDyc(page);
        page.setList(sysequipments);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public List<Sysequipment> selectByIP(Sysequipment sysEquipmentBean) {
        return sysequipmentMapper.selectByIP(sysEquipmentBean);
    }

    @Override
    public List<Sysuser> selectSysuserByDeptId(String deptId){
        return sysuserMapper.selectUserByDeptId(deptId);
    }

    @Override
    public List<Dictionary> selectDictionary() {
        return dictionaryMapper.selectAll();
    }

    @Override
    public List<Dictionary> selectSysequitMent(){
        return dictionaryMapper.selectEquitMent();
    }

    @Override
    public List<Location> selectLocation() {
        return locationMapper.selectAll();
    }

    @Override
    public List<Sysuser> selectSysuser() {
        return sysuserMapper.selectAll();
    }

    @Override
    public List<Sysuser> selectSysuserByUserDept(String s) {
        return sysuserMapper.selectSysuserByUserDept(s);

    }
}
