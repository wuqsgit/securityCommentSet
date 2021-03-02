package com.ht70605.actionsync;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.action.CheckInAction;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.dao.CheckinbillitemMapper;
import com.ht70605.dao.CheckoutbillitemMapper;
import com.ht70605.dao.ProductStatusMapper;
import com.ht70605.entity.*;
import com.ht70605.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 706 on 2017/7/8.
 */
@Controller
@RequestMapping("/checkInSync")
public class CheckInSyncAction {
    @Resource
    private CheckInAction checkInAction;

    @Autowired
    private ProductStatusMapper productStatusMapper;
    @Resource
    private CheckOutService checkOutService;
    @Autowired
    private CheckoutbillitemMapper checkoutbillitemMapper;
    @Resource
    private CheckInService checkInService;
    @Resource
    private LocationService locationService;
    @Resource
    private SysUserService sysUserService;
    @Resource
    private DepartmentService departmentService;

    @Autowired
    private CheckinbillitemMapper checkinbillitemMapper;

    private Logger logger = LoggerFactory.getLogger(CheckInSyncAction.class);

    private DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

    @RequestMapping(value = "select", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(//1 单号  2 详情  随机密件
                         @RequestParam String isDetail,
                         //查checkInBill的 Page类型
                         String checkinbill,
                         //查checkInBillItem详情 Page类型
                         String checkinbillitem) throws Exception {

        logger.error("select:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + isDetail + "," + checkinbill + "," + checkinbillitem);

        Object returnObj = checkInAction.select(isDetail, checkinbill, checkinbillitem, null);
        logger.error("return select:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + JSONObject.toJSON(returnObj));
        return returnObj;
    }

    //更新入库单状态  检查对应out表单中product是否全部修改在库
    @RequestMapping(value = "update", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String checkinList) throws Exception {
        logger.error("update:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + checkinList);
        JSONArray objects = JSON.parseArray(checkinList);
        if (objects != null) {
            for (int i = 0; i < objects.size(); i++) {
                try {
                    checkInAction.update(objects.get(i).toString());
                    Checkin checkinBean = JSONObject.toJavaObject(JSON.parseObject(objects.get(i).toString()), Checkin.class);
                    updateProductStatus(checkinBean);
                    if(checkinBean != null && checkinBean.getCheckinbill() != null && StringUtils.isEmpty(checkinBean.getCheckinbill().getDictionaryId())){
                        switch (checkinBean.getCheckinbill().getDictionaryId()){
                            case "7"://清退入库
                                break;
                            case "10"://生成的请退单  需要将上级的productStatus更新为出库已完成
                                updateGradeDeptStatus(checkinBean);
                            break;
                        }
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    logger.error("return update:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "状态更新失败", "").toString());
                    return new Message("false", "状态更新失败", "");
                }
            }
            logger.error("return update:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("true", "状态更新成功", "").toString());
            return new Message("true", "状态更新成功", "");
        }
        logger.error("return update:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "状态更新失败", "").toString());
        return new Message("false", "状态更新失败", "");
    }

    //将上级的productStatus更新为出库已完成
    private void updateGradeDeptStatus(Checkin checkinBean){
        Checkinbill checkinbill = checkinBean.getCheckinbill();
        String deptid= checkinbill.getDesDepartmentId();//这个是上级单位的Id
        List<Checkinbillitem> checkinbillitemList = checkinBean.getCheckinbillitemList();
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

        String[] productIds = new String[checkinbillitemList.size()];
        for (int i = 0; i < checkinbillitemList.size(); i++) {
            productIds[i] = checkinbillitemList.get(i).getProductId();
        }
        String sql = selectSql(productIds, deptid + "status_view");

        List<ProductStatus> statusList =productStatusMapper.getProductStatusByProductId(sql);


        for(ProductStatus productStatus : statusList){

            ProductStatus status = new ProductStatus();
            status.setId(idWorker.nextId() + "");
            status.setDepartmentId(checkinbill.getResDepartmentId());
            Department department = departmentService.getDepartmentById(checkinbill.getResDepartmentId());
            if(department != null) {
                status.setDepartmentName(department.getDepName());//TODO
            }
            status.setProductId(productStatus.getProductId());
            status.setSysUserId(checkinbill.getSysuserId());
            Sysuser user = sysUserService.getSysuserById(checkinbill.getSysuserId());
            if(user != null) {
                status.setSysUserName(user.getUserName());//TODO
            }
            status.setLocationId(checkinbill.getLocationId());
            Location location = locationService.getLocationById(checkinbill.getLocationId());
            if(location != null) {
                status.setLocationInfo(location.getInfo());//TODO
            }
            status.setUpdateTime(dateFormat.format(date));
            status.setStatus(ProductStatusEnum.已配发已完成.getStatus());

            insert(status, deptid);
        }

    }

    //修改在库状态 检测out中所有product状态是否全部在库或者使用中   清退入库  仅仅修改本级的
    private void updateProductStatus( Checkin checkinBean){

        Checkinbill checkinbill = checkinBean.getCheckinbill();
        String deptid= checkinbill.getResDepartmentId();//这个是本单位的Id
      //  List<Checkinbillitem> checkinbillitemList = checkinBean.getCheckinbillitemList();
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        Date date = new Date();


        //找到相同的billCode和res_departmentId（对应in的des_departmentId相同的）
        Checkoutbill checkoutbill = checkOutService.getCheckoutBillByBillCodeAndDeptId(checkinbill.getBillCode(), checkinbill.getDesDepartmentId());
        //TODO   这个是中间状态  就是既有出库也有入库单
        if(null != checkinbill && !StringUtils.isEmpty(checkinbill.getId())) {
            List<Checkoutbillitem> checkoutbillitems = checkoutbillitemMapper.selectByCheckOutBillId(checkoutbill.getId());

            if(checkoutbillitems != null) {
                String[] outProductIds = new String[checkoutbillitems.size()];
                for (int i = 0; i < checkoutbillitems.size(); i++){
                    outProductIds[i] = checkoutbillitems.get(i).getProductId();
                }
                //直接查询数据库 是否全部在库或者使用中
                String outSql = selectSql(outProductIds, deptid+"status_view");

                List<ProductStatus> outStatusList =productStatusMapper.getProductStatusByProductId(outSql);

                //查询是否全部在库或者使用中
                boolean isAll = true;
                for(ProductStatus productStatus: outStatusList){
                    if(!ProductStatusEnum.在库.getStatus().equals(productStatus.getStatus()) && !ProductStatusEnum.使用中.getStatus().equals(productStatus.getStatus())){
                        isAll = false;
                        break;
                    }
                }

                //全部都在库  修改成为使用中
                if(isAll){
                    Date allDate = new Date();
                    for(ProductStatus productStatus: outStatusList){
                        productStatus.setId(idWorker.nextId()+"");
                        productStatus.setStatus(ProductStatusEnum.清退中.getStatus());
                        productStatus.setUpdateTime(dateFormat.format(allDate));
                        insert(productStatus, deptid);
                    }
                }
            }else{
                //TODO   这个是只有入库单而没有出库单的  就是公安部  检测入库单items的productId是否全部入库  全部入库则把状态改成待销毁
                List<Checkinbillitem> checkinbillitems = checkinbillitemMapper.selectByCheckInBillId(checkinbill.getId());
                String[] productIns = new String[checkinbillitems.size()];
                for (int i=0; i < checkinbillitems.size(); i++){
                    productIns[i] = checkinbillitems.get(i).getProductId();
                }
                String rootSql = selectSql(productIns, deptid+"status_view");
                List<ProductStatus> outStatusList =productStatusMapper.getProductStatusByProductId(rootSql);

                boolean isAll = true;
                for(ProductStatus productStatus: outStatusList){
                    if(!ProductStatusEnum.在库.getStatus().equals(productStatus.getStatus()) && !ProductStatusEnum.使用中.getStatus().equals(productStatus.getStatus())){
                        isAll = false;
                        break;
                    }
                }

                //全部都在库  修改成为使用中
                if(isAll){
                    Date allDate = new Date();
                    for(ProductStatus productStatus: outStatusList){
                        productStatus.setId(idWorker.nextId()+"");
                        productStatus.setStatus(ProductStatusEnum.已销毁.getStatus());
                        productStatus.setUpdateTime(dateFormat.format(allDate));
                        insert(productStatus, deptid);
                    }
                }

            }
        }else{
            logger.error("没有检测到相应的入库单，请联系管理员");
        }


    }

    private void insert(ProductStatus status, String tablename){
        String insetSql = "insert into " + tablename + "productstatus(id, product_id, update_time, status,location_id,location_info, " +
                "sysUser_id,sysUser_name,department_id,department_name) values ('"+status.getId()+ "','"+
                status.getProductId()+"','"+ status.getUpdateTime()+"','"+status.getStatus()+"','"+
                status.getLocationId()+"','"+status.getLocationInfo()+"','"+status.getSysUserId()+"','"+
                status.getSysUserName()+"','"+status.getDepartmentId()+"','"+status.getDepartmentName()+"')";

        productStatusMapper.insertList(insetSql);
    }

    private String selectSql(String[] products, String tablename){
        if(StringUtils.isEmpty(tablename) || products == null || products.length == 0){
            return null;
        }
        String sql = "select * from "+ tablename+" where product_id IN (";

        String temp="";
        for(int i=0; i < products.length; i++){
            temp += "%s,";
        }
        temp = temp.substring(0, temp.length() - 1);
        temp = String.format(temp, products);
        sql +=temp+")";
        return sql;
    }


    //插入新的数据  TODO  这里也需要修改productStatus状态
    @RequestMapping(value = "insertNew", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insertNew(@RequestParam String checkinList) throws Exception {
        logger.error("insertNew:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + checkinList);
        JSONArray objects = JSON.parseArray(checkinList);
        if (objects != null) {
            for (int i = 0; i < objects.size(); i++) {
                try {
                    Checkin checkinBean = JSONObject.toJavaObject(JSON.parseObject(objects.get(i).toString()), Checkin.class);
                    Checkinbill checkinbill = checkinBean.getCheckinbill();
                    List<Checkinbillitem> checkinbillitemList = checkinBean.getCheckinbillitemList();
                    //TODO  对productStatus改变   也需要加入Product?
                    checkInService.insert(checkinBean);
                } catch (Exception e) {
                    e.printStackTrace();
                    logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "添加失败", "").toString());
                    return new Message("false", "添加失败", "");
                }
            }
            logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("true", "添加成功", "").toString());
            return new Message("true", "添加成功", "");
        }
        logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "添加失败", "").toString());
        return new Message("false", "添加失败", "");
    }
}