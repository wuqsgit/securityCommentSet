package com.ht70605.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.dao.*;
import com.ht70605.entity.*;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.ReturnobjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("ReturnobjService")
public class ReturnobjServiceImpl implements ReturnobjService {

    @Autowired
    private ReturnobjectMapper returnobjectMapper;
    @Autowired
    private ReturnobjectitemMapper returnobjectitemMapper;

    @Autowired
    private ProductViewMapper productViewMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CheckinbillMapper checkinbillMapper;
    @Autowired
    private CheckinbillitemMapper checkinbillitemMapper;
    @Autowired
    private CheckoutbillMapper checkoutbillMapper;
    @Autowired
    private CheckoutbillitemMapper checkoutbillitemMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private ProductStatusMapper productStatusMapper;

    public void insert(Returnobj returnobj) throws Exception {
        if (returnobj.getReturnobject() != null) {
            try {
                returnobjectMapper.insertSelective(returnobj.getReturnobject());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (returnobj.getReturnobjectitemList() != null) {
            try {
                returnobj.getReturnobjectitemList().forEach(returnobjectitem -> {
                    returnobjectitemMapper.insertSelective(returnobjectitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteItem(String[] pks, String returnobjId, String deptId) throws Exception {
        //删除pks的所有子节点
        List<String> productIds = new ArrayList<String>();
        Collections.addAll(productIds, pks);

        for (String pk : pks) {
            Returnobjectitem item = returnobjectitemMapper.selectByPrimaryKey(pk);
            if (item != null && !StringUtils.isEmpty(item.getProductId())) {
                List<Product> products = productMapper.selectSignalLeaves(item.getProductId());
                for (Product product : products) {
                    productIds.add(product.getId());
                    returnobjectitemMapper.deleteItemByReturnobjIdAndProductId(product.getId(), returnobjId);
                }
            }
        }
        //删除相应的父节点
        returnobjectitemMapper.deleteList(pks);

        //删掉记录
        String[] statusIds = new String[productIds.size()];
        for(int i=0; i < productIds.size(); i++){
            statusIds[i] = "'"+productIds.get(i)+"'";
        }
        String deleteSql = deleteStatusSql(statusIds, deptId + "status_view");
        if(!StringUtils.isEmpty(deleteSql)) {
            productStatusMapper.insertList(deleteSql);
        }
    }

    //TODO  递归 检测product是否全部在库或者使用中，如果没有则生成子出库单和入库单
    //递归退出条件：当出库单中所有product全部在库或者使用中
    //注意：统一的BillCode   recDepartment字段是上级部门的id
    //传入参数：本级源Department和下级DepartmentId 下级productId
    //返回参数：包含 出库和入库单Id  仅仅是
    private String createBill(String departmentId, String recDepartmentId, List<String> productId, String billCode ){
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Department res = departmentMapper.selectByPrimaryKey(departmentId);
        Department des = departmentMapper.selectByPrimaryKey(recDepartmentId);

        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);

        Checkinbill checkinbill = new Checkinbill();
        checkinbill.setId(idWorker.nextId() + "");
        checkinbill.setDictionaryId("7");
        checkinbill.setCreateTime(simpleDateFormat.format(date));
        checkinbill.setBillCode(billCode);
        checkinbill.setResDepartmentId(departmentId);
        checkinbill.setDesDepartmentId(recDepartmentId);
        checkinbill.setStatus("1");
        checkinbill.setSysuserId(des.getSysUserId());
        checkinbill.setUpdateTime("");
        checkinbill.setInfo("清退入库");
        checkinbill.setResult("0");
        checkinbill.setLocationId("");
        checkinbillMapper.insert(checkinbill);

        //出库单
        Checkoutbill checkoutbill = new Checkoutbill();
        checkoutbill.setId(checkinbill.getId());
        checkoutbill.setCreateTime(simpleDateFormat.format(date));
        checkoutbill.setDesDepartmentId(recDepartmentId);
        checkoutbill.setResDepartmentId(departmentId);
        checkoutbill.setDictionaryId("11");
        checkoutbill.setStatus("1");
        checkoutbill.setInfo("清退出库");
        checkoutbill.setBillCode(billCode);
        checkoutbill.setSysuserId(res.getSysUserId());
        checkoutbill.setUpdateTime("");
        checkoutbill.setResult("0");
        checkoutbill.setPersonName("");
        checkoutbillMapper.insert(checkoutbill);

        List<Checkinbillitem> checkinbillitems = new ArrayList<Checkinbillitem>();
        if (productId != null) {
            for (String pid : productId) {
                Checkinbillitem checkinbillitem = new Checkinbillitem();
                checkinbillitem.setId(idWorker.nextId() + "");
                checkinbillitem.setCheckinbillId(checkinbill.getId());
                //checkinbillitem.setCheckinTime(simpleDateFormat.format(date));
                checkinbillitem.setCheckinTime("");
                checkinbillitem.setCreateTime(simpleDateFormat.format(date));
                checkinbillitem.setProductId(pid);
                // checkinbillitem.setUpdateTime(simpleDateFormat.format(date));
                checkinbillitem.setUpdateTime("");
                checkinbillitem.setResult("0");
                checkinbillitem.setStatus("1");
                checkinbillitems.add(checkinbillitem);
            }
            checkinbillitems.forEach(checkinbillitem -> {
                checkinbillitemMapper.insertSelective(checkinbillitem);
            });
        }

        List<Checkoutbillitem> checkoutbillitems = new ArrayList<Checkoutbillitem>();
        if (productId != null) {
            for (String pid : productId) {
                Checkoutbillitem checkoutbillitem = new Checkoutbillitem();
                checkoutbillitem.setId(idWorker.nextId() + "");
                checkoutbillitem.setCheckoutbillId(checkoutbill.getId());

                //checkoutbillitem.setCheckoutTime(simpleDateFormat.format(date));
                checkoutbillitem.setCheckoutTime("");
                checkoutbillitem.setCreateTime(simpleDateFormat.format(date));
                checkoutbillitem.setProductId(pid);
                //checkoutbillitem.setUpdateTime(simpleDateFormat.format(date));
                checkoutbillitem.setResult("0");
                checkoutbillitem.setStatus("1");
//                checkoutbillitem.setApplicationId(returnobject.getApplicationId());
//                checkoutbillitem.setBillCode("");
//
//                checkoutbillitem.setDesDepartmentId(returnobject.getRecDepartmentId());
//                checkoutbillitem.setResDepartmentId(returnobject.getDepartmentId());
//                checkoutbillitem.setProductDictionaryId(returnobject.getDictionaryId());

                checkoutbillitems.add(checkoutbillitem);
            }
            checkoutbillitems.forEach(checkoutbillitem -> {
                checkoutbillitemMapper.insertSelective(checkoutbillitem);
            });
        }

        //TODO 判断是否需要继续生成子出库入库单  判断product的状态
        String [] products = new String[productId.size()];
        productId.toArray(products);
        String sql = deleteSql(products, departmentId+ "status_view");
        if(StringUtils.isEmpty(sql) || "".equals(sql)){
            return "";
        }
        List<ProductStatus> productStatuses = productStatusMapper.getProductStatusByProductId(sql);
        //status作为key  在库或者使用中则修改成为清退中 配发未完成或者配发完成则生成入库出库单
        Map<String, List<ProductStatus>> productMaps = new HashMap<>();
        for(ProductStatus productStatus : productStatuses){
            List<ProductStatus> productStatusList = productMaps.get(productStatus.getStatus());
            if(productStatusList == null){
                productStatusList = new ArrayList<>();
            }
            productStatusList.add(productStatus);
            productMaps.put(productStatus.getStatus(), productStatusList);
        }

        //下级生成出库单和本级的入库单  中间层处理
        if(productMaps.containsKey(ProductStatusEnum.已配发已完成.getStatus()) || productMaps.containsKey(ProductStatusEnum.已配发未完成.getStatus())) {
            List<ProductStatus> downProductStatusList = new ArrayList<>();
            if(productMaps.containsKey(ProductStatusEnum.已配发已完成.getStatus())) {
                downProductStatusList.addAll(productMaps.get(ProductStatusEnum.已配发已完成.getStatus()));
            }
            if(productMaps.containsKey(ProductStatusEnum.已配发未完成.getStatus())) {
                downProductStatusList.addAll(productMaps.get(ProductStatusEnum.已配发未完成.getStatus()));
            }
            //key是下发单位的单位编号
            Map<String, List<String>> downDepartProductId = new HashMap<>();
            for(ProductStatus productStatus : downProductStatusList){
                List<String> productStatusList = downDepartProductId.get(productStatus.getDepartmentId());
                if(productStatusList == null){
                    productStatusList = new ArrayList<String>();
                }
                productStatusList.add(productStatus.getProductId());
                downDepartProductId.put(productStatus.getDepartmentId(), productStatusList);
            }

            //循环遍历生成入库出库单  迭代
            Set<String> keySet = downDepartProductId.keySet();
            for(String key : keySet){
                List<String> productIds = downDepartProductId.get(key);
                createBill(key, departmentId, productIds, billCode);
            }
            //这个是最下层  全部在库  处理变成清退中
        }else if(productMaps.containsKey(ProductStatusEnum.在库.getStatus()) || productMaps.containsKey(ProductStatusEnum.使用中.getStatus())) {
            List<ProductStatus> productStatusList = new ArrayList<>();
            if(productMaps.containsKey(ProductStatusEnum.在库.getStatus())) {
                productStatusList.addAll(productMaps.get(ProductStatusEnum.在库.getStatus()));
            }
            if(productMaps.containsKey(ProductStatusEnum.使用中.getStatus())) {
                productStatusList.addAll(productMaps.get(ProductStatusEnum.使用中.getStatus()));
            }

            date = new Date();
            for(ProductStatus status : productStatusList){
                status.setId(idWorker.nextId() + "");
                status.setStatus(ProductStatusEnum.清退中.getStatus());
                status.setUpdateTime(simpleDateFormat.format(date));
                //标识上一级的departmentid
                status.setDepartmentId(recDepartmentId);

                //标识本级为清退中
                String insetSql = "insert into " + departmentId + "productstatus(id, product_id, update_time, status,location_id,location_info, " +
                        "sysUser_id,sysUser_name,department_id,department_name) values ('"+status.getId()+ "','"+
                        status.getProductId()+"','"+ status.getUpdateTime()+"','"+status.getStatus()+"','"+
                        status.getLocationId()+"','"+status.getLocationInfo()+"','"+status.getSysUserId()+"','"+
                        status.getSysUserName()+"','"+status.getDepartmentId()+"','"+status.getDepartmentName()+"')";
                productStatusMapper.insertList(insetSql);
            }
        }
            return  checkinbill.getId();
    }

    @Override
    public void sendReturnobj(String returnobjId) {
        if (StringUtils.isEmpty(returnobjId)) {
            return;
        }

        Returnobject returnobject = returnobjectMapper.selectByPrimaryKey(returnobjId);
        List<Returnobjectitem> items = returnobjectitemMapper.selectReturnobjectitemByReturnobjId(returnobjId);
        returnobject.setStatus("1");//已完成

        List<String> productIds = new ArrayList<String>(items.size());
        items.forEach(returnobjectitem -> {
           productIds.add(returnobjectitem.getProductId());
        });

        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        String billCode = idWorker.nextId() + "";
        String billId = createBill(returnobject.getDepartmentId(), returnobject.getRecDepartmentId(), productIds, billCode);
        returnobject.setCheckInBillId(billId);
        returnobject.setCheckOutBillId(billId);

        //TODO  针对下级部门生成相应的清退单
        returnobjectMapper.updateByPrimaryKey(returnobject);
    }

    @Override
    public Page<Product> editPageUseSearch(Page<Product> page, String id) {
        List<Returnobjectitem> items = returnobjectitemMapper.selectReturnobjectitemByReturnobjId(id);
        List<Product> returnObj = new ArrayList<>();
        String[] ids = new String[items.size()];
        Map<String, Returnobjectitem> mapper = new HashMap<String, Returnobjectitem>(items.size());

        for (int i = 0; i < items.size(); i++) {
            ids[i] = items.get(i).getProductId();
            mapper.put(items.get(i).getProductId(), items.get(i));
        }
        int TotalRecord = 0;
        if (ids != null && ids.length > 0) {
            TotalRecord = productMapper.selectPageCountByMapperId(ids);
            List<Product> pros = productMapper.selectPageListByMapperId(ids, page.getStart(), page.getPageSize());

            Set<String> proIds = new HashSet<String>();
            for (Product pro : pros) {
                if(pro.getProductId() == null){
                    proIds.add(pro.getId());
                }
            }

            for (Product pro : pros) {
                if(pro.getProductId() == null) {
                    page.setParamEntity(pro);
                    pro.setItemId(mapper.get(pro.getId()).getId());
                    pro.setReturnobjId(id);
                    pro.setResult(mapper.get(pro.getId()).getResult());

                    List<Product> leaves = productMapper.selectPageListByLeavesMapper(ids, pro.getId());
                    for (Product leave : leaves) {
                        leave.setResult(mapper.get(leave.getId()).getResult());
                        //returnObj.add(leave);
                    }
                    pro.setProductList(leaves);
                    returnObj.add(pro);
                }else{
                    if(!proIds.contains(pro.getProductId())){
                        returnObj.add(pro);
                    }
                }
            }
        }
        page.setList(returnObj);
        page.setTotalRecord(TotalRecord);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    public void update(Returnobj returnobj) throws Exception {
        if (returnobj.getReturnobject() != null) {
            try {
                returnobjectMapper.updateByPrimaryKeySelective(returnobj.getReturnobject());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (returnobj.getReturnobjectitemList() != null) {
            try {
                returnobj.getReturnobjectitemList().forEach(returnobjectitem -> {
                    returnobjectitemMapper.updateByPrimaryKeySelective(returnobjectitem);
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void delete(Returnobj returnobj) throws Exception {
        if (returnobj.getReturnobject() != null) {
            try {
                returnobjectMapper.deleteByPrimaryKey(returnobj.getReturnobject().getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (returnobj.getReturnobjectitemList() != null) {
            try {
                returnobj.getReturnobjectitemList().forEach(returnobjectitem -> {
                    returnobjectitemMapper.deleteByPrimaryKey(returnobjectitem.getId());
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteList(String[] pks) throws Exception {

    }

    @Override
    public void deleteAllList(String[] pks, String tablename) throws Exception {
        returnobjectMapper.deleteList(pks);
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Returnobjectitem> items = new ArrayList<Returnobjectitem>();
        for(String pk : pks){
            //先查询出来
            items.addAll(returnobjectitemMapper.selectReturnobjectitemByReturnobjId(pk));
        }
        returnobjectitemMapper.deleteIdList(pks);

        String[] products = new String[items.size()];
        for(int i=0; i < items.size(); i++){
            products[i] = "'"+items.get(i).getProductId()+"'";
        }
        //TODO可以直接删除不需要查询出来
        String sql = deleteSql(products, tablename+ "status_view");
        if(StringUtils.isEmpty(sql)){
            return;
        }
        List<ProductStatus> oldProductStatuses = productStatusMapper.getProductStatusByProductId(sql);

       /* for (ProductStatus status : oldProductStatuses){

            ProductStatus productStatus = new ProductStatus();
            String insetSql = "insert into " + tablename + "productstatus(id, product_id, update_time, status,location_id,location_info, " +
                    "sysUser_id,sysUser_name,department_id,department_name) values ('"+idWorker.nextId()+ "','"+
                    status.getProductId()+"','"+ simpleDateFormat.format(date)+"','4','"+
                    status.getLocationId()+"','"+status.getLocationInfo()+"','"+status.getSysUserId()+"','"+
                    status.getSysUserName()+"','"+status.getDepartmentId()+"','"+status.getDepartmentName()+"')";

            productStatusMapper.insertList(insetSql);

        }*/
        //删除最近一条
        String[] statusIds = new String[oldProductStatuses.size()];
        for(int i=0; i < oldProductStatuses.size(); i++){
            statusIds[i] = "'"+oldProductStatuses.get(i).getId()+"'";
        }
       String deleteSql = deleteStatusSql(statusIds, tablename + "status_view");
        if(!StringUtils.isEmpty(deleteSql)) {
            productStatusMapper.insertList(deleteSql);
        }
    }

    private String deleteStatusSql(String[] ids, String tablename){
        if(StringUtils.isEmpty(tablename) || ids == null || ids.length == 0){
            return null;
        }
        String sql = "delete from "+ tablename+" where id IN (";

        String temp="";
        for(int i=0; i < ids.length; i++){
            temp += "%s,";
        }
        temp = temp.substring(0, temp.length() - 1);
        temp = String.format(temp, ids);
        sql +=temp+")";
        return sql;
    }

    private String deleteSql(String[] products, String tablename){
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

    public Returnobj select(Returnobj returnobj) {
        return null;
    }

    @Override
    public Page<Returnobj> selectPage(Page<Returnobj> page) {
        return null;
    }

    public Page<Returnobj> selectPageUseDyc(Page<Returnobj> page) {
        return null;
    }

    /**
     *TODO
     * @param page
     * @return
     */
    @Override
    public Page<ProductView> insertPageUseSearch(Page<ProductView> page, JSONObject json) {

        List<ProductView> returnList = getProductViewByJson(json);
        int totalRecord = getProductViewCountByJson(json);
        page.setList(returnList);
        page.setTotalRecord(totalRecord);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());//总页数
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    private List<ProductView> getProductViewByJson(JSONObject json){

        //仅仅查询父product信息进行筛选
        String sql = "select  p.*, a.name as 'application_name' FROM " + json.getString("deptId") +" p LEFT JOIN application a ON a.id = p.application_id where p.status IN ('4') ";
        sql = whereSql(sql, json);
        sql += " ORDER BY p.create_time";
        List<ProductView> products = productViewMapper.selectReturnbjProductOne(sql);

        List<ProductView> returnList = new ArrayList<ProductView>();
        //查询相应子结果
        for (int i = 0; i < products.size(); i++) {
            String productId = products.get(i).getId();
            if (!StringUtils.isEmpty(productId)) {
                returnList.add(products.get(i));//存入密品信息
                //page.setParamEntity(products.get(i));
                String sonSql = "select p.* FROM "+json.getString("sonDeptId")+" p where p.product_id ='"+ productId +"' AND p.status IN ('4')";
                List<ProductView> items = productViewMapper.selectSignalAndLeaves(sonSql);
                returnList.addAll(items);//存入密品随即密件
            }
        }
        return returnList;
    }

    private String whereSql(String sql, JSONObject json){
        if(!StringUtils.isEmpty(json.getString("locationId")) && !"".equals(json.getString("locationId").trim())){
            sql += " and location_id = '"+json.getString("locationId")+"'";
        }
        if(!StringUtils.isEmpty(json.getString("searchDepartment")) && !"".equals(json.getString("searchDepartment").trim())){
            sql += " and department_id = '"+json.getString("searchDepartment")+"'";
        }
        if(!StringUtils.isEmpty(json.getString("dictionaryId")) && !"".equals(json.getString("dictionaryId").trim())){
            sql += " and dictionary_id = '"+json.getString("dictionaryId")+"'";
        }
        if(!StringUtils.isEmpty(json.getString("applicationId")) && !"".equals(json.getString("applicationId").trim())){
            sql += " and application_id = '"+json.getString("applicationId")+"'";
        }
        return  sql;
    }

    private int getProductViewCountByJson(JSONObject json) {
        String countSql = "select  count(1) FROM " + json.getString("deptId") +" p  where p.status IN ('4') ";
        countSql = whereSql(countSql, json);
        int totalRecord = productViewMapper.selectCountReturnbjProductOne(countSql);
        return totalRecord;
    }

    @Override
    public List<ProductView> selectProductReturnobjPage(JSONObject jsonObject) {
        List<ProductView> products = getProductViewByJson(jsonObject);
        return products;
    }

    @Override
    public Page<Returnobject> selectPageUseDycReturnobject(Page<Returnobject> page) {
        List<Returnobject> returnobjects = returnobjectMapper.selectPageListUseDyc(page);
        Integer integer = returnobjectMapper.selectPageCountListUseDyc(page);
        page.setList(returnobjects);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    public Page<Returnobjectitem> selectPageUseDycReturnobjectitem(Page<Returnobjectitem> page) {
        List<Returnobjectitem> returnobjectitems = returnobjectitemMapper.selectPageListUseDyc(page);
        Integer integer = returnobjectitemMapper.selectPageCountUseDyc(page);
        page.setList(returnobjectitems);
        page.setTotalRecord(integer);
        if (page.getPageSize() != null) {
            if (page.getTotalRecord() % page.getPageSize() == 0)
                page.setTotalPages(page.getTotalRecord() / page.getPageSize());
            else page.setTotalPages(page.getTotalRecord() / page.getPageSize() + 1);
        }
        return page;
    }

    /*
     清退完成数量
 */
    public Page<ReturnobjectSelect> selectReturnComNum(Page<Returnobj> page) {
        List<ReturnobjectSelect> inventoryitems = returnobjectMapper.selectReturnComNum(page);
        Page<ReturnobjectSelect> p = new Page<ReturnobjectSelect>();
        p.setList(inventoryitems);
        return p;
    }

    /*
     清退未完成数量
 */
    public Page<ReturnobjectSelect> selectReturnNonComNum(Page<Returnobj> page) {
        List<ReturnobjectSelect> inventoryitems = returnobjectMapper.selectReturnNonComNum(page);
        Page<ReturnobjectSelect> p = new Page<ReturnobjectSelect>();
        p.setList(inventoryitems);
        return p;
    }

    @Override
    public Page selectjys(Page<Returnobj> page) {
        List<ReturnobjectSelect> inventoryitems = returnobjectMapper.selectjys(page);
        Page<ReturnobjectSelect> p = new Page<ReturnobjectSelect>();
        p.setList(inventoryitems);
        return p;
    }
}
