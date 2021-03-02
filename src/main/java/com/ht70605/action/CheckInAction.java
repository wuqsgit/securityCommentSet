package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.dao.ProductStatusMapper;
import com.ht70605.entity.*;
import com.ht70605.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/checkIn")
public class CheckInAction extends BaseAction {
    @Resource
    private CheckInService checkInService;
    @Resource
    private SysEquipmentService sysEquipmentService;
    @Resource
    private LocationService locationService;
    @Resource
    private SysUserService sysUserService;
    @Resource
    private ProductService productService;

    @Autowired
    private ProductStatusMapper productStatusMapper;

    @Resource
    private DepartmentService departmentService;

    //CheckInBill表和CheckInBillItem表添加
    //前端数据格式，下同
    //前端数据格式，下同
    //前端数据格式，下同
//    {
//        "checkinbillitemList":[{
//        "result":"", "checkinTime":"", "productId":"", "createTime":null, "updateTime":null, "id":
//        null, "checkinbillId":"", "status":""
//    }],"checkinbill":{
//        "result":"", "createTime":null, "desDepartmentId":"", "billCode":"", "dictionaryId":"", "resDepartmentId":
//        "", "updateTime":null, "id":null, "info":"", "status":""
//    }
//    }
    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    @Transactional
    public Object insert(@RequestParam String checkin,
                         HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = new User();
        if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
            user = (User) session.getAttribute("User");
        }

        JSONObject checkinBean = JSON.parseObject(checkin);
        JSONObject checkinbill = checkinBean.getJSONObject("checkinbill");
        JSONArray checkinbillitemList = checkinBean.getJSONArray("checkinbillitemList");

        //插入Checkinbill表的数据编辑
        Checkinbill checkinbillInsert = JSONObject.toJavaObject(checkinbill, Checkinbill.class);
        checkinbillInsert.setId(snowflakeIdWorker().nextId() + "");
        checkinbillInsert.setDictionaryId("6");
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        checkinbillInsert.setCreateTime(simpleDateFormat.format(date));
        checkinbillInsert.setUpdateTime(simpleDateFormat.format(date));
        checkinbillInsert.setStatus("1");
        checkinbillInsert.setResult("1");//初始化为完成
        String s = sysUserService.selectDepartmentIdBySysUserId(checkinbillInsert.getSysuserId());
        if (s == null) return new Message("false", "所选接收人没有部门", "");
        checkinbillInsert.setDesDepartmentId(s);

        //插入Product表的数据编辑
        List<Product> products = new ArrayList<>();
        //插入Checkinbillitem表的数据编辑
        List<Checkinbillitem> checkinbillitems = new ArrayList<>();

        for (int i = 0; i < checkinbillitemList.size(); i++) {
            JSONObject jsonObject = (JSONObject) checkinbillitemList.get(i);
            Product product = new Product();
            product.setId(snowflakeIdWorker().nextId() + "");
            product.setRfidCode(jsonObject.get("addFormRfidCode").toString());
            product.setDictionaryId(jsonObject.get("addFormDictionaryId").toString());
            product.setModel(jsonObject.get("addFormModel").toString());
            product.setApplicationId(jsonObject.get("addFormApplicationId").toString());
            product.setProCode(jsonObject.get("addFormProCode").toString());
            product.setSerNum(jsonObject.get("addFormSerNum").toString());
            product.setSysuserId(jsonObject.get("addFormSysUserId").toString());
            product.setLocationId(jsonObject.get("addFormLocationId").toString());
            product.setCreateTime(simpleDateFormat.format(date));
            product.setUpdateTime(simpleDateFormat.format(date));
            product.setStatus("1");
            product.setStorage("1");
            product.setInfo(jsonObject.get("addFormInfo").toString());
            products.add(product);

            Checkinbillitem checkinbillitem = new Checkinbillitem();
            checkinbillitem.setId(snowflakeIdWorker().nextId() + "");
            checkinbillitem.setCheckinbillId(checkinbillInsert.getId());
            checkinbillitem.setProductId(product.getId());
            checkinbillitem.setCheckinTime(simpleDateFormat.format(date));
            checkinbillitem.setResult("1");
            checkinbillitem.setCreateTime(simpleDateFormat.format(date));
            checkinbillitem.setUpdateTime(simpleDateFormat.format(date));
            checkinbillitem.setStatus("1");
            checkinbillitems.add(checkinbillitem);

            JSONArray addFormRandomList = jsonObject.getJSONArray("addFormRandomList");
            for (int k = 0; k < addFormRandomList.size(); k++) {
                JSONObject jsonObjectRandom = (JSONObject) addFormRandomList.get(k);
                Product productRandom = new Product();
                productRandom.setId(snowflakeIdWorker().nextId() + "");
                productRandom.setRfidCode(jsonObjectRandom.get("addFormRandomRfidCode").toString());
                productRandom.setDictionaryId(jsonObjectRandom.get("addFormRandomDictionaryId").toString());
                productRandom.setLocationId(jsonObjectRandom.get("addFormRandomLocationId").toString());
                productRandom.setCreateTime(simpleDateFormat.format(date));
                productRandom.setUpdateTime(simpleDateFormat.format(date));
                productRandom.setStatus("1");
                productRandom.setStorage("1");
                productRandom.setInfo(jsonObjectRandom.get("addFormRandomInfo").toString());
                productRandom.setProductId(product.getId());
                products.add(productRandom);

                Checkinbillitem checkinbillitemRandom = new Checkinbillitem();
                checkinbillitemRandom.setId(snowflakeIdWorker().nextId() + "");
                checkinbillitemRandom.setCheckinbillId(checkinbillInsert.getId());
                checkinbillitemRandom.setProductId(productRandom.getId());
                checkinbillitemRandom.setCheckinTime(simpleDateFormat.format(date));
                checkinbillitemRandom.setResult("1");
                checkinbillitemRandom.setCreateTime(simpleDateFormat.format(date));
                checkinbillitemRandom.setUpdateTime(simpleDateFormat.format(date));
                checkinbillitemRandom.setStatus("1");
                checkinbillitems.add(checkinbillitemRandom);

            }
        }

        Checkin checkinInsert = new Checkin();
        checkinInsert.setCheckinbill(checkinbillInsert);
        checkinInsert.setCheckinbillitemList(checkinbillitems);
        checkinInsert.setProductList(products);
        try {
            checkInService.insert(checkinInsert);
            inserProductStatus(checkinInsert);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "新增异常" + e.getMessage(), "");
        }

        return new Message("true", "新增成功", "");

    }

    private void inserProductStatus(Checkin checkinBean){
        Checkinbill checkinbill = checkinBean.getCheckinbill();
        String deptid= checkinbill.getResDepartmentId();//这个是本单位的Id
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
            status.setDepartmentId(deptid);
            Department department = departmentService.getDepartmentById(deptid);
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
            status.setStatus(ProductStatusEnum.在库.getStatus());

            insertProductStatus(status, deptid);
        }
    }

    private void insertProductStatus(ProductStatus status, String tablename){
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

    //CheckInBill表和CheckInBillItem表删除 需要id
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object delete(@RequestParam String checkin) throws Exception {
        Checkin checkinBean = JSONObject.toJavaObject(JSON.parseObject(checkin), Checkin.class);
        try {
            checkInService.delete(checkinBean);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "删除异常" + e.getMessage(), "");
        }
        return new Message("true", "删除成功", "");
    }

    //CheckInBill表和CheckInBillItem表编辑 需要id
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String checkin) throws Exception {
        Checkin checkinBean = JSONObject.toJavaObject(JSON.parseObject(checkin), Checkin.class);
        Checkinbill checkinbill = checkinBean.getCheckinbill();

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        List<Checkinbillitem> checkinbillitemList = checkinBean.getCheckinbillitemList();
        if (checkinbillitemList != null) {
            checkinbillitemList.forEach(checkinbillitem -> {
                checkinbillitem.setUpdateTime(simpleDateFormat.format(date));
                if (checkinbillitem.getResult().equals("1")) {
                    checkinbillitem.setResult("0");
                    Page page2 = new Page();
                    page2.setParamEntity(checkinbillitem);
                    Page<Checkinbillitem> page3 = checkInService.selectPageUseDycCheckinbillitem(page2);
                    //为了确认入库添加入库时间
                    checkinbillitem.setCheckinTime(simpleDateFormat.format(date));
                    checkinbillitem.setUpdateTime(simpleDateFormat.format(date));
                    checkinbillitem.setResult("1");
                    //并且更新product表的storage字段
                    Product product = checkInService.selectProductById(page3.getList().get(0).getProductId());
                    if (checkinbill != null) {
                        Page page = new Page();
                        CheckinbillSelect checkinbillSelect = new CheckinbillSelect();
                        checkinbillSelect.setId(checkinbill.getId());
                        page.setParamEntity(checkinbillSelect);
                        Page<Checkinbill> page1 = checkInService.selectPageUseDycCheckinbill(page);
                        product.setSysuserId(page1.getList().get(0).getSysuserId());
                        product.setLocationId(checkinbill.getLocationId());
                    }
                    //并且更新product表的storage字段
                    product.setStorage("1");
                    product.setUpdateTime(simpleDateFormat.format(date));
                    checkInService.updateProductStorage(product);
                }
            });
            checkinBean.setCheckinbillitemList(checkinbillitemList);
        }
        if (checkinbill != null) {
            if (checkinbill.getId() == null) checkinbill.setId(checkinbillitemList.get(0).getCheckinbillId());
            checkinbill.setUpdateTime(simpleDateFormat.format(date));
            checkinBean.setCheckinbill(checkinbill);
        }
        checkInService.update(checkinBean);
        inserProductStatus(checkinBean);
        checkInService.selectForUpdateCheckInBillResult(checkinbill);
        return new Message("true", "状态更新成功", checkInService.select(checkinBean));
    }

    //CheckInBill表和CheckInBillItem表查询
    //{             "pageIndex":"1",             "pageSize":"10",             "paramEntity":{             "status":"1"         }         }
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(//1 单号  2 详情  随机密件
                         @RequestParam String isDetail,
                         //查checkInBill的 Page类型
                         String checkinbill,
                         //查checkInBillItem详情 Page类型
                         String checkinbillitem,
                         HttpServletRequest request) throws Exception {
        User user = new User();
        if (request != null) {
            HttpSession session = request.getSession();
            if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
                user = (User) session.getAttribute("User");
            }
        }
        if (isDetail.equals("1")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(checkinbill), Page.class);
            page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            if (request != null) {
                CheckinbillSelect checkinbillSelect = JSONObject.toJavaObject((JSON) page.getParamEntity(), CheckinbillSelect.class);
                checkinbillSelect.setSysuserId(user.getuId());
                page.setParamEntity(checkinbillSelect);
            }
            Page p = checkInService.selectPageUseDycCheckinbill(page);
            return JSONObject.toJSON(p);
        } else if (isDetail.equals("2")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(checkinbillitem), Page.class);
            Page pageSelect = new Page();
            pageSelect.setParamEntity(page.getParamEntity());
            pageSelect.setKeyWord("detail");
            Page p = checkInService.selectPageUseDycCheckinbillitem(pageSelect);
            List<CheckinbillitemSelect> list = p.getList();
            List<CheckinbillitemSelect> listReturn = new ArrayList<>();
            List<CheckinbillitemSelect> checkinbillitemSelectList = new ArrayList<>();
            list.forEach(checkinbillitem1 -> {
                if (checkinbillitem1.getProductProductId() == null) {
                    if (checkinbillitem1.getProductRfidCode() == null) checkinbillitem1.setProductRfidCode("");
                    if (checkinbillitem1.getCheckinTime() == null) checkinbillitem1.setCheckinTime("");
                    listReturn.add(checkinbillitem1);
                    Page pageRandom = new Page();
                    pageRandom.setParamEntity(checkinbillitem1);
                    pageRandom.setPageIndex(1);
                    pageRandom.setKeyWord("random");
                    pageRandom = checkInService.selectPageUseDycCheckinbillitem(pageRandom);
                    if (pageRandom.getList().size() > 0) {
                        List<CheckinbillitemSelect> list1 = pageRandom.getList();
                        list1.forEach(o -> {
                            if (o.getProductRfidCode() == null) o.setProductRfidCode("");
                            if (o.getCheckinTime() == null) o.setCheckinTime("");
                            checkinbillitemSelectList.add(o);
                        });
                    }
                }
            });
            list.forEach(checkinbillitem1 -> {
                if (checkinbillitem1.getProductProductId() != null) {
                    if (checkinbillitem1.getProductRfidCode() == null) checkinbillitem1.setProductRfidCode("");
                    if (checkinbillitem1.getCheckinTime() == null) checkinbillitem1.setCheckinTime("");
                    for (int i = 0; i < checkinbillitemSelectList.size(); i++) {
                        if (checkinbillitemSelectList.get(i).getProductId().equals(checkinbillitem1.getProductId())) {
                            return;
                        }
                    }
                    checkinbillitemSelectList.add(checkinbillitem1);
                    Product product = productService.selectOneById(checkinbillitem1.getProductProductId());
                    for (int i = 0; i < listReturn.size(); i++) {
                        if (listReturn.get(i).getProductId().equals(product.getId())) {
                            return;
                        }
                    }

                    CheckinbillitemSelect checkinbillitem1Temp = new CheckinbillitemSelect();
                    checkinbillitem1Temp.setInfo(checkinbillitem1.getInfo());
                    checkinbillitem1Temp.setBillCode(checkinbillitem1.getBillCode());
                    checkinbillitem1Temp.setResDepartmentName(checkinbillitem1.getResDepartmentName());
                    checkinbillitem1Temp.setDesDepartmentName(checkinbillitem1.getDesDepartmentName());
                    checkinbillitem1Temp.setDesDepartmentSysUserId(checkinbillitem1.getDesDepartmentSysUserId());
                    checkinbillitem1Temp.setDesDepartmentSysUser(checkinbillitem1.getDesDepartmentSysUser());
                    checkinbillitem1Temp.setInfo(checkinbillitem1.getInfo());
                    checkinbillitem1Temp.setProductDictionaryValue(checkinbillitem1.getProductDictionaryValue());
                    checkinbillitem1Temp.setProductModel(checkinbillitem1.getProductModel());
                    checkinbillitem1Temp.setProductProCode(checkinbillitem1.getProductProCode());
                    checkinbillitem1Temp.setProductSerNum(checkinbillitem1.getProductSerNum());
                    checkinbillitem1Temp.setProductRfidCode(checkinbillitem1.getProductRfidCode());
                    checkinbillitem1Temp.setProductProductId(checkinbillitem1.getProductProductId());
                    checkinbillitem1Temp.setId(checkinbillitem1.getId());
                    checkinbillitem1Temp.setCheckinbillId(checkinbillitem1.getCheckinbillId());
                    checkinbillitem1Temp.setProductId(checkinbillitem1.getProductId());
                    checkinbillitem1Temp.setCheckinTime("");
                    checkinbillitem1Temp.setResult(checkinbillitem1.getResult());
                    checkinbillitem1Temp.setCreateTime(checkinbillitem1.getCreateTime());
                    checkinbillitem1Temp.setUpdateTime(checkinbillitem1.getUpdateTime());
                    checkinbillitem1Temp.setStatus(checkinbillitem1.getStatus());

                    checkinbillitem1Temp.setProductDictionaryValue(product.getDictionaryValue());
                    checkinbillitem1Temp.setProductId(checkinbillitem1.getProductProductId());
                    checkinbillitem1Temp.setProductProductId("");
                    checkinbillitem1Temp.setStatus("0");
                    checkinbillitem1Temp.setProductModel(product.getModel());
                    checkinbillitem1Temp.setProductProCode(product.getProCode());
                    checkinbillitem1Temp.setProductSerNum(product.getSerNum());
                    checkinbillitem1Temp.setProductRfidCode(product.getRfidCode());
                    checkinbillitem1Temp.setInfo(product.getInfo());
                    listReturn.add(checkinbillitem1Temp);
                }
            });
            JSONObject jsonObject = new JSONObject();
            p.setList(listReturn);
            p.setPageIndex(page.getPageIndex());
            p.setPageSize(page.getPageSize());
            if (p.getTotalRecord() != null && p.getPageSize() != null) {
                if (p.getTotalRecord() % p.getPageSize() == 0)
                    p.setTotalPages(p.getTotalRecord() / p.getPageSize());
                else p.setTotalPages(p.getTotalRecord() / p.getPageSize() + 1);
            }
            jsonObject.put("p", p);
            jsonObject.put("checkinbillitemSelectList", checkinbillitemSelectList);
            return jsonObject;
        } else if (isDetail.equals("3")) {//专供手持机使用
            Page page = JSONObject.toJavaObject(JSON.parseObject(checkinbillitem), Page.class);
            Page pageSelect = new Page();
            pageSelect.setParamEntity(page.getParamEntity());
            pageSelect.setKeyWord("detail");
            Page p = checkInService.selectPageUseDycCheckinbillitem(pageSelect);
            List<CheckinbillitemSelect> list = p.getList();
            List<CheckinbillitemSelect> checkinbillitemSelectList = new ArrayList<>();
            list.forEach(checkinbillitemSelect -> {
                if (checkinbillitemSelect.getProductProductId() != null) {
                    Product product = productService.selectOneById(checkinbillitemSelect.getProductProductId());
                    checkinbillitemSelect.setProductModel(product.getModel());
                    checkinbillitemSelect.setProductProCode(product.getProCode());
                    checkinbillitemSelect.setProductSerNum(product.getSerNum());
                }
            });
            JSONObject jsonObject = new JSONObject();
            p.setList(list);
            p.setPageIndex(page.getPageIndex());
            p.setPageSize(page.getPageSize());
            if (p.getTotalRecord() != null && p.getPageSize() != null) {
                if (p.getTotalRecord() % p.getPageSize() == 0)
                    p.setTotalPages(p.getTotalRecord() / p.getPageSize());
                else p.setTotalPages(p.getTotalRecord() / p.getPageSize() + 1);
            }
            jsonObject.put("p", p);
            jsonObject.put("checkinbillitemSelectList", checkinbillitemSelectList);
            return jsonObject;
        }
        return new Message("false", "查询异常", "");
    }

    //role表查询
    @RequestMapping(value = "checkInInitSelectOption", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object checkInInitSelectOption(HttpServletRequest request, String deptNodeid) {
        HttpSession session = request.getSession();
        User user = new User();
        if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
            user = (User) session.getAttribute("User");
        }

        JSONObject jsonObject = new JSONObject();
        List<Dictionary> dictionaries = checkInService.selectDictionary();
        List<Application> applications = checkInService.selectApplication();
        List<Sysuser> sysusers = sysEquipmentService.selectSysuserByUserDept(user.getuDeptId());
        List<Location> locations = locationService.selectLocationBySysUserId(user.getuId());
        List<Location> deptLocations = checkInService.selectDeptLocations(deptNodeid);

        jsonObject.put("dictionaries", dictionaries);
        jsonObject.put("applications", applications);
        jsonObject.put("sysusers", sysusers);
        jsonObject.put("locations", locations);
        jsonObject.put("deptLocations", deptLocations);

        return jsonObject;
    }
}

