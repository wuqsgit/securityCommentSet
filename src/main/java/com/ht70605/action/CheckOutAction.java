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
@RequestMapping("/checkOut")
public class CheckOutAction extends BaseAction {
    @Resource
    private CheckOutService checkOutService;
    @Resource
    private SysEquipmentService sysEquipmentService;
    @Resource
    private LocationService locationService;
    @Resource
    private CheckInService checkInService;
    @Resource
    private SysUserService sysUserService;
    @Autowired
    private ProductStatusMapper productStatusMapper;

    @Resource
    private DepartmentService departmentService;

    //CheckOutBill表和CheckOutBillItem表添加
    //前端数据格式，下同
    //前端数据格式，下同
    //前端数据格式，下同
//    {
//        "checkoutbillitemList":[{
//        "result":"", "checkoutTime":"", "productId":"", "createTime":null, "updateTime":null, "id":
//        null, "checkoutbillId":"", "status":""
//    }],"checkoutbill":{
//        "result":"", "createTime":null, "desDepartmentId":"", "billCode":"", "dictionaryId":"", "resDepartmentId":
//        "", "updateTime":null, "id":null, "info":"", "status":""
//    }
//    }
    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    @Transactional
    public Object insert(@RequestParam String checkout,
                         HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        User user = new User();
        if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
            user = (User) session.getAttribute("User");
        }

        JSONObject checkoutBean = JSON.parseObject(checkout);
        JSONObject checkoutbill = checkoutBean.getJSONObject("checkoutbill");
        JSONArray checkoutbillitemList = checkoutBean.getJSONArray("checkoutbillitemList");

        //插入Checkoutbill表的数据编辑
        Checkoutbill checkoutbillInsert = JSONObject.toJavaObject(checkoutbill, Checkoutbill.class);
        checkoutbillInsert.setId(snowflakeIdWorker().nextId() + "");
        checkoutbillInsert.setDictionaryId("9");
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        checkoutbillInsert.setCreateTime(simpleDateFormat.format(date));
        checkoutbillInsert.setUpdateTime(simpleDateFormat.format(date));
        checkoutbillInsert.setStatus("1");
        checkoutbillInsert.setResult("1");//初始化为完成
        String s = sysUserService.selectDepartmentIdBySysUserId(user.getuId());
        if (s == null) return new Message("false", "用户未登录", "");
        checkoutbillInsert.setResDepartmentId(s);

        //插入Checkinbill表的数据编辑
        Checkinbill checkinbillInsert = new Checkinbill();
        checkinbillInsert.setId(snowflakeIdWorker().nextId() + "");
        checkinbillInsert.setDictionaryId("10");
        checkinbillInsert.setBillCode(checkoutbillInsert.getBillCode());
        checkinbillInsert.setResDepartmentId(checkoutbillInsert.getResDepartmentId());
        checkinbillInsert.setDesDepartmentId(checkoutbillInsert.getDesDepartmentId());
        String s1 = checkOutService.selectSysUserIdByDepartmentId(checkoutbillInsert.getDesDepartmentId());
        checkinbillInsert.setSysuserId(s1);
        checkinbillInsert.setResult("0");//初始化为未完成
        checkinbillInsert.setInfo(checkoutbillInsert.getInfo());
        checkinbillInsert.setCreateTime(simpleDateFormat.format(date));
        checkinbillInsert.setUpdateTime(simpleDateFormat.format(date));
        checkinbillInsert.setStatus("1");
        checkinbillInsert.setLocationId(checkoutbillInsert.getLocationId());


        //更新Product表的数据编辑
        List<Product> products = new ArrayList<>();
        //插入Checkoutbillitem表的数据编辑
        List<Checkoutbillitem> checkoutbillitems = new ArrayList<>();
        //插入Checkinbillitem表的数据编辑
        List<Checkinbillitem> checkinbillitems = new ArrayList<>();

        for (int i = 0; i < checkoutbillitemList.size(); i++) {
            JSONObject jsonObject = (JSONObject) checkoutbillitemList.get(i);
            Product product = new Product();
            product.setId(jsonObject.get("id").toString());
            product.setSysuserId(jsonObject.get("sysuserId").toString());
            product.setLocationId(jsonObject.get("locationId").toString());
            product.setUpdateTime(simpleDateFormat.format(date));
            product.setStorage("0");
            products.add(product);

            Checkoutbillitem checkoutbillitem = new Checkoutbillitem();
            checkoutbillitem.setId(snowflakeIdWorker().nextId() + "");
            checkoutbillitem.setCheckoutbillId(checkoutbillInsert.getId());
            checkoutbillitem.setProductId(product.getId());
            checkoutbillitem.setCheckoutTime(simpleDateFormat.format(date));
            checkoutbillitem.setResult("1");
            checkoutbillitem.setCreateTime(simpleDateFormat.format(date));
            checkoutbillitem.setUpdateTime(simpleDateFormat.format(date));
            checkoutbillitem.setStatus("1");
            checkoutbillitems.add(checkoutbillitem);

            Checkinbillitem checkinbillitem = new Checkinbillitem();
            checkinbillitem.setId(snowflakeIdWorker().nextId() + "");
            checkinbillitem.setCheckinbillId(checkinbillInsert.getId());
            checkinbillitem.setProductId(checkoutbillitem.getProductId());
            checkinbillitem.setResult("0");
            checkinbillitem.setCreateTime(simpleDateFormat.format(date));
            checkinbillitem.setUpdateTime(simpleDateFormat.format(date));
            checkinbillitem.setStatus("1");
            checkinbillitems.add(checkinbillitem);
        }
        Checkout checkoutInsert = new Checkout();
        checkoutInsert.setCheckoutbill(checkoutbillInsert);
        checkoutInsert.setCheckoutbillitemList(checkoutbillitems);
        checkoutInsert.setProductList(products);

        Checkin checkin = new Checkin();
        checkin.setCheckinbill(checkinbillInsert);
        checkin.setCheckinbillitemList(checkinbillitems);
        try {
            checkOutService.insert(checkoutInsert);
            if (checkoutbillInsert.getDesDepartmentId().equals(checkoutbillInsert.getResDepartmentId())) {
                products.forEach(product -> {
                    product.setLocationId(checkinbillInsert.getLocationId());
                });
                Checkout checkout1 = new Checkout();
                checkout1.setProductList(products);
                checkOutService.insert(checkoutInsert);
            } else checkInService.insert(checkin);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "新增异常" + e.getMessage(), "");
        }
        return new Message("true", "新增成功", "");
    }

    //修改密品状态  如果目的部门和源部门相同  状态为使用中
    //如果目标部门和源部门不一致  状态为出库未完成
    private void insertProductStatus(Checkout checkoutInsert){
        Checkoutbill checkoutbill = checkoutInsert.getCheckoutbill();
        List<Checkoutbillitem> items = checkoutInsert.getCheckoutbillitemList();

        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

        boolean isOut = false;//出库未完成
        //使用中
        if (checkoutbill != null && checkoutbill.getDesDepartmentId().equals(checkoutbill.getResDepartmentId())){
            isOut = true;
        }
        List<ProductStatus> statusList = new ArrayList<>(items.size());
        for(Checkoutbillitem checkoutbillitem : items){
            ProductStatus status = new ProductStatus();
            status.setId(idWorker.nextId()+"");
            status.setDepartmentId(checkoutbill.getDesDepartmentId());
            Department department = departmentService.getDepartmentById(checkoutbill.getDesDepartmentId());
            if(department != null) {
                status.setDepartmentName(department.getDepName());
            }
            status.setProductId(checkoutbillitem.getProductId());
            status.setSysUserId(checkoutbill.getSysuserId());
            Sysuser user = sysUserService.getSysuserById(checkoutbill.getSysuserId());
            if(user != null) {
                status.setSysUserName(user.getUserName());
            }
            status.setLocationId(checkoutbill.getLocationId());
            Location location = locationService.getLocationById(checkoutbill.getLocationId());
            if(location != null) {
                status.setLocationInfo(location.getInfo());
            }
            status.setUpdateTime(dateFormat.format(date));
            if(isOut) {
                status.setStatus(ProductStatusEnum.使用中.getStatus());
            }else{
                status.setStatus(ProductStatusEnum.已配发未完成.getStatus());
            }

            insertProductStatus(status, checkoutbill.getResDepartmentId());
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

    //CheckOutBill表和CheckOutBillItem表删除 需要id
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object delete(@RequestParam String checkout) throws Exception {
        Checkout checkoutBean = JSONObject.toJavaObject(JSON.parseObject(checkout), Checkout.class);
        try {
            checkOutService.delete(checkoutBean);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "删除异常" + e.getMessage(), "");
        }
        return new Message("true", "删除成功", "");
    }

    //CheckOutBill表和CheckOutBillItem表编辑 需要id
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String checkout) throws Exception {
        Checkout checkoutBean = JSONObject.toJavaObject(JSON.parseObject(checkout), Checkout.class);
        Checkoutbill checkoutbill = checkoutBean.getCheckoutbill();

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


        List<Checkoutbillitem> checkoutbillitemList = new ArrayList<>();
        if (checkoutbill.getResult().equals("1")) {
            Page page = new Page();
            page.setPageIndex(1);
            page.setKeyWord("detail");
            Checkoutbillitem checkoutbillitem = new Checkoutbillitem();
            checkoutbillitem.setCheckoutbillId(checkoutbill.getId());
            page.setParamEntity(checkoutbillitem);
            Page p = checkOutService.selectPageUseDycCheckoutbillitem(page);
            List<Checkoutbillitem> checkoutbillitemList1 = new ArrayList<>();
            checkoutbillitemList1.addAll(p.getList());
            checkoutbillitemList1.forEach(checkoutbillitem1 -> {
                checkoutbillitem1.setResult("1");
                checkoutbillitem1.setUpdateTime(simpleDateFormat.format(date));
                checkoutbillitem1.setCheckoutTime(simpleDateFormat.format(date));
            });
            checkoutbillitemList.addAll(checkoutbillitemList1);
        }
//        List<Checkoutbillitem> checkoutbillitemList1 = checkoutBean.getCheckoutbillitemList();
//        if (checkoutbillitemList1 != null)
//            checkoutbillitemList.addAll(checkoutbillitemList1);
        if (checkoutbillitemList != null) {
            checkoutbillitemList.forEach(checkoutbillitem -> {
                checkoutbillitem.setUpdateTime(simpleDateFormat.format(date));
                if (checkoutbillitem.getResult().equals("1")) {
                    checkoutbillitem.setResult("0");
                    Page page2 = new Page();
                    page2.setParamEntity(checkoutbillitem);
                    //为了确认入库添加入库时间
                    checkoutbillitem.setCheckoutTime(simpleDateFormat.format(date));
                    checkoutbillitem.setUpdateTime(simpleDateFormat.format(date));
                    checkoutbillitem.setResult("1");
                    //并且更新product表的storage字段
                    String id = checkoutbillitem.getProductId();
                    Product product = checkInService.selectProductById(id);
                    if (checkoutbill != null) {
                        Page page = new Page();
                        CheckoutbillSelect checkoutbillSelect = new CheckoutbillSelect();
                        checkoutbillSelect.setId(checkoutbill.getId());
                        page.setParamEntity(checkoutbillSelect);
                        Page<Checkoutbill> page1 = checkOutService.selectPageUseDycCheckoutbill(page);
                        product.setSysuserId(page1.getList().get(0).getSysuserId());
                        //清退出库不改变product表的locationId
//                        product.setLocationId(checkoutbill.getLocationId());
                    }
                    product.setStorage("0");
                    product.setUpdateTime(simpleDateFormat.format(date));
                    checkOutService.updateProductStorage(product);
                }
            });
            checkoutBean.setCheckoutbillitemList(checkoutbillitemList);
        }
        if (checkoutbill != null) {
            if (checkoutbill.getId() == null) checkoutbill.setId(checkoutbillitemList.get(0).getCheckoutbillId());
            checkoutbill.setUpdateTime(simpleDateFormat.format(date));
            checkoutBean.setCheckoutbill(checkoutbill);
        }
        checkOutService.update(checkoutBean);
        return new Message("true", "确认出库已完成", checkOutService.select(checkoutBean));
    }

    //CheckOutBill表和CheckOutBillItem表查询
    //{             "pageIndex":"1",             "pageSize":"10",             "paramEntity":{             "status":"1"         }         }
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(//1 单号  2 详情  随机密件
                         @RequestParam String isDetail,
                         //查checkOutBill的 Page类型
                         String checkoutbill,
                         //查checkOutBillItem详情 Page类型
                         String checkoutbillitem,
                         HttpServletRequest request) throws Exception {
        User user = new User();
        if (request != null) {
            HttpSession session = request.getSession();
            if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
                user = (User) session.getAttribute("User");
            }
        }
        if (isDetail.equals("1")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(checkoutbill), Page.class);
            page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            if (request != null) {
                CheckoutbillSelect checkoutbillSelect = JSONObject.toJavaObject((JSON) page.getParamEntity(), CheckoutbillSelect.class);
                checkoutbillSelect.setSysuserId(user.getuId());
                page.setParamEntity(checkoutbillSelect);
            }
            Page p = checkOutService.selectPageUseDycCheckoutbill(page);
            return JSONObject.toJSON(p);
        } else if (isDetail.equals("2")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(checkoutbillitem), Page.class);
            page.setKeyWord("detail");
            Page p = checkOutService.selectPageUseDycCheckoutbillitem(page);
            List<CheckoutbillitemSelect> list = p.getList();
            List<CheckoutbillitemSelect> checkoutbillitemSelectList = new ArrayList<>();
            list.forEach(checkoutbillitem1 -> {
                if (checkoutbillitem1.getProductRfidCode() == null) checkoutbillitem1.setProductRfidCode("");
                if (checkoutbillitem1.getCheckoutTime() == null) checkoutbillitem1.setCheckoutTime("");
            });
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("p", p);
            jsonObject.put("checkoutbillitemSelectList", checkoutbillitemSelectList);
            return jsonObject;
        }
        return new Message("false", "查询异常", "");
    }

    //role表查询
    @RequestMapping(value = "checkOutInitSelectOption", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object checkOutInitSelectOption(String deptNodeid,
                                           HttpServletRequest request) {
        User user = new User();
        if (request != null) {
            HttpSession session = request.getSession();
            if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
                user = (User) session.getAttribute("User");
            }
        }
        JSONObject jsonObject = new JSONObject();
        List<Dictionary> dictionaries = checkInService.selectDictionary();
        List<Application> applications = checkOutService.selectApplication();
        List<Sysuser> sysusers = sysEquipmentService.selectSysuser();
        List<Location> locations = locationService.selectAll();
        List<Location> deptLocations = checkOutService.selectDeptLocations(deptNodeid);
        List<Sysuser> deptSysusers = checkOutService.selectDeptSysusers(user.getuDeptId());

        jsonObject.put("dictionaries", dictionaries);
        jsonObject.put("applications", applications);
        jsonObject.put("sysusers", sysusers);
        jsonObject.put("locations", locations);
        if (user.getuDeptId().equals(deptNodeid)) {
            jsonObject.put("deptLocations", deptLocations);
        } else {
            jsonObject.put("deptLocations", "");
        }

        jsonObject.put("deptSysusers", deptSysusers);
        return jsonObject;
    }

    //product表查询
    @RequestMapping(value = "addFormSelect", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object addFormSelect(@RequestParam String page, HttpServletRequest request) {

        Page page1 = JSONObject.toJavaObject(JSON.parseObject(page), Page.class);
        JSONObject json = new JSONObject();

        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User) session.getAttribute("User");
            if (user != null && !StringUtils.isEmpty(user.getuDeptId())) {
                json.put("deptId", user.getuDeptId());
            } else {
                page1.setList(null);
                page1.setTotalRecord(0);
                page1.setTotalPages(0);
                return JSONObject.toJSON(page1);
            }
        }

        Product product = JSONObject.toJavaObject((JSON) page1.getParamEntity(), Product.class);
        product.setDictionaryId(product.getDictionaryId().equals("") ? null : product.getDictionaryId());
        json.put("dictionaryId", product.getDictionaryId());
        product.setModel(product.getModel().equals("") ? null : product.getModel());
        json.put("model", product.getModel());
        product.setProCode(product.getProCode().equals("") ? null : product.getProCode());
        json.put("proCode", product.getProCode());
        product.setSerNum(product.getSerNum().equals("") ? null : product.getSerNum());
        json.put("serNum", product.getSerNum());
        product.setApplicationId(product.getApplicationId().equals("") ? null : product.getApplicationId());
        json.put("applicationId", product.getApplicationId());
        product.setRfidCode(product.getRfidCode().equals("") ? null : product.getRfidCode());
        json.put("rfidCode", product.getRfidCode());
        page1.setParamEntity(product);
        //return checkOutService.addFormSelect(page1);
        return checkOutService.addProductSelect(page1, json);
    }

}



