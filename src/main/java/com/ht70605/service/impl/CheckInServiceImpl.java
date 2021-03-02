package com.ht70605.service.impl;

import com.ht70605.dao.*;
import com.ht70605.entity.*;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.CheckInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("CheckInBillService")
public class CheckInServiceImpl implements CheckInService {

    @Autowired
    private CheckinbillMapper checkinbillMapper;
    @Autowired
    private CheckinbillitemMapper checkinbillitemMapper;
    @Autowired
    private ApplicationMapper applicationMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private DictionaryMapper dictionaryMapper;
    @Autowired
    private LocationMapper locationMapper;

    @Autowired
    private ReturnobjectMapper returnobjectMapper;

    @Autowired
    private ReturnobjectitemMapper returnobjectitemMapper;

    @Transactional
    public void insert(Checkin checkin) throws Exception {
        if (checkin.getCheckinbill() != null) {
            try {
                checkinbillMapper.insertSelective(checkin.getCheckinbill());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (checkin.getCheckinbillitemList() != null) {
            try {
                checkin.getCheckinbillitemList().forEach(checkinbillitem -> {
                    checkinbillitemMapper.insertSelective(checkinbillitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (checkin.getProductList() != null) {
            try {
                checkin.getProductList().forEach(product -> {
                    productMapper.insertSelective(product);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void update(Checkin checkin) throws Exception {
        if (checkin.getCheckinbill() != null) {
            try {
                checkinbillMapper.updateByPrimaryKeySelective(checkin.getCheckinbill());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (checkin.getCheckinbillitemList() != null) {
            try {
                checkin.getCheckinbillitemList().forEach(checkinbillitem -> {
                    checkinbillitemMapper.updateByPrimaryKeySelective(checkinbillitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Transactional
    public void delete(Checkin checkin) throws Exception {
        if (checkin.getCheckinbill() != null) {
            try {
                Checkinbill checkinbill = checkinbillMapper.selectByPrimaryKey(checkin.getCheckinbill().getId());
                List<Checkinbillitem> checkinbillitems = checkinbillitemMapper.selectByCheckInBillId(checkinbill.getId());
                checkinbillitems.forEach(checkinbillitem -> {
                    productMapper.deleteByPrimaryKey(checkinbillitem.getProductId());
                    checkinbillitemMapper.deleteByPrimaryKey(checkinbillitem.getId());
                });
                checkinbillMapper.deleteByPrimaryKey(checkinbill.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    public Checkin select(Checkin checkin) {
        Checkin checkinReturn = new Checkin();
        if (checkin.getCheckinbill() != null) {
            try {
                checkinReturn.setCheckinbill(checkinbillMapper.selectByPrimaryKey(checkin.getCheckinbill().getId()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<Checkinbillitem> checkinbillitemSelectList = new ArrayList<>();
        if (checkin.getCheckinbillitemList() != null) {
            try {
                checkin.getCheckinbillitemList().forEach(checkinbillitem -> {
                    checkinbillitemSelectList.add(checkinbillitemMapper.selectByPrimaryKey(checkinbillitem.getId()));
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        checkinReturn.setCheckinbillitemList(checkinbillitemSelectList);
        return checkinReturn;
    }

    @Override
    public Page<Checkin> selectPage(Page<Checkin> page) {
        return null;
    }

    public Page<Checkin> selectPageUseDyc(Page<Checkin> page) {
        return null;
    }

    @Override
    public Page<Checkinbill> selectPageUseDycCheckinbill(Page<Checkinbill> page) {
        List<Checkinbill> checkinbills = checkinbillMapper.selectPageListUseDyc(page);
        Integer integer = checkinbillMapper.selectPageCountUseDyc(page);
        page.setList(checkinbills);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    public Page<Checkinbillitem> selectPageUseDycCheckinbillitem(Page<Checkinbillitem> page) {
        List<Checkinbillitem> checkinbillitems = checkinbillitemMapper.selectPageListUseDyc(page);
        Integer integer = checkinbillitemMapper.selectPageCountUseDyc(page);
        page.setList(checkinbillitems);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    @Override
    public List<Application> selectApplication() {
        return applicationMapper.selectAll();
    }

    @Override
    public String selectDepartmentIdBySysUserId(String sysuserId) {
        return departmentMapper.selectDepartmentIdBySysUserId(sysuserId);
    }

    @Override
    public void updateProductStorage(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public List<Dictionary> selectDictionary() {
        return dictionaryMapper.selectDictionary();
    }

    @Override
    public void selectForUpdateCheckInBillResult(Checkinbill checkinBean) {
        Page page = new Page();
        page.setPageIndex(1);
        Checkinbillitem checkinbillitem = new Checkinbillitem();
        checkinbillitem.setCheckinbillId(checkinBean.getId());
        page.setParamEntity(checkinbillitem);
        page.setKeyWord("random");
        Page<Checkinbillitem> page1 = selectPageUseDycCheckinbillitem(page);
        List<Checkinbillitem> list = page1.getList();
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getResult().equals("0")) return;
            }
            try {
                Date date = new Date(System.currentTimeMillis());
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                checkinBean.setResult("1");
                checkinBean.setUpdateTime(simpleDateFormat.format(date));
                checkinbillMapper.updateByPrimaryKeySelective(checkinBean);

                Returnobject returnobject = returnobjectMapper.selectReturnobjectSelectByCheckInBill(checkinBean.getId());
                if(returnobject != null){
                    returnobject.setRetTime(simpleDateFormat.format(date));
                    returnobject.setStatus("2");
                    returnobject.setResult("完成");
                    returnobjectMapper.updateByPrimaryKeySelective(returnobject);

                    List<Returnobjectitem> returnobjectitems = returnobjectitemMapper.selectReturnobjectitemByReturnobjId(returnobject.getId());
                    returnobjectitems.forEach(returnobjectitem -> {
                        returnobjectitem.setUpdateTime(simpleDateFormat.format(date));
                        returnobjectitem.setStatus("1");
                        returnobjectitem.setResult("完成");
                        returnobjectitemMapper.updateByPrimaryKey(returnobjectitem);
                    });
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Location> selectDeptLocations(String deptNodeid) {
        return locationMapper.selectLocationByDept(deptNodeid);
    }

    @Override
    public Product selectProductById(String productId) {
        return productMapper.selectByPrimaryKey(productId);
    }
}
