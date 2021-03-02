package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.LoggingRecord;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.*;
import com.ht70605.service.DepartmentService;
import com.ht70605.service.ProductStatusService;
import com.ht70605.service.ReturnobjService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/Returnobj")
public class ReturnobjAction extends BaseAction {
    @Resource
    private ReturnobjService returnobjService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private ProductStatusService productStatusService;

    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    @LoggingRecord(param = {"returnobj"}, classType = {Returnobject.class}, menu =MenuEnum.密品清退, operation = OperationEnum.新增主项, info="添加新的密品清退计划，对象为：%s")
    public Object insert(@RequestParam String returnobj, HttpServletRequest request) throws Exception {
        Returnobj returnobjBean = new Returnobj();

        Returnobject returnobject = new Returnobject();

        HttpSession session = request.getSession();
        JSONObject jsonObject = JSON.parseObject(returnobj);
        User user = null;
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            user = (User)session.getAttribute("User");
            if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                jsonObject.put("deptId", user.getuDeptId()+"productfather_view");
                jsonObject.put("sonDeptId", user.getuDeptId() + "productson_view");
            }else{
                return  new Message("false", "信息缺失", "");
            }
        }else{
            return  new Message("false", "信息缺失", "");
        }

        if(!StringUtils.isEmpty(returnobj)) {
            returnobject  = JSONObject.toJavaObject(JSON.parseObject(returnobj), Returnobject.class);
        }
        List<ProductView> productSelects = returnobjService.selectProductReturnobjPage(jsonObject);

        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        returnobject.setId(idWorker.nextId() + "");

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        returnobject.setCreateTime(simpleDateFormat.format(date));
        returnobject.setUpdateTime(simpleDateFormat.format(date));

        returnobject.setSysuserId(user.getuId());
        //查询上级单位
        Department department = departmentService.selectSuperDeptByDeptId(returnobject.getDepartmentId());
        if(department != null){
            returnobject.setRecDepartmentId(department.getId());
        }else{
            return new Message("false", "上级部门为空", "");
        }

        returnobject.setStatus("0");

        returnobjBean.setReturnobject(returnobject);

        List<Returnobjectitem> returnobjectitemList =new ArrayList<Returnobjectitem>();
        List<ProductStatus> productStatuses = new ArrayList<>();
        if(productSelects != null){
            for(ProductView product : productSelects) {
                if (!StringUtils.isEmpty(returnobject.getId()) && !StringUtils.isEmpty(product.getId())) {
                    Returnobjectitem returnobjectitem = new Returnobjectitem();
                    ProductStatus status = new ProductStatus();

                    returnobjectitem.setId(idWorker.nextId() + "");
                    returnobjectitem.setReturnobjectId(returnobject.getId());
                    returnobjectitem.setProductId(product.getId());
                    returnobjectitem.setCreateTime(simpleDateFormat.format(date));
                    returnobjectitem.setUpdateTime(simpleDateFormat.format(date));
                    returnobjectitem.setStatus("0");

                    status.setId(idWorker.nextId() + "");
                    status.setProductId(product.getId());
                    status.setUpdateTime(simpleDateFormat.format(date));
                    status.setStatus(ProductStatusEnum.清退中.getStatus());
                    status.setSysUserId(product.getSysuserId());
                    status.setSysUserName(product.getSysuserName());
                    status.setDepartmentId(product.getDepartmentId());
                    status.setDepartmentName(product.getDepartmentName());
                    status.setLocationId(product.getLocationId());
                    status.setLocationInfo(product.getLocationInfo());

                    returnobjectitemList.add(returnobjectitem);
                    productStatuses.add(status);
                }
            }

        }
        returnobjBean.setReturnobjectitemList(returnobjectitemList);

        returnobjService.insert(returnobjBean);
        productStatusService.insertList(productStatuses, user.getuDeptId() + "productstatus");

        return new Message("true", "保存成功", "");
    }

    //Returnobject表和ReturnobjectItem表删除 需要id
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    @LoggingRecord(param = {"deleteList"}, classType = {java.lang.String.class}, menu =MenuEnum.密品清退, operation = OperationEnum.删除主项, info="删除密品清退计划，主键是:%s")
    public Object delete(@RequestParam String deleteList, HttpServletRequest request) throws Exception {
      /*  Returnobj returnobjBean = JSONObject.toJavaObject(JSON.parseObject(returnobj), Returnobj.class);
        returnobjService.delete(returnobjBean);
        return "success";*/
        HttpSession session = request.getSession();
        String tableName=null;
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User) session.getAttribute("User");
            if (user != null && !StringUtils.isEmpty(user.getuDeptId())) {
                tableName = user.getuDeptId();
            }
        }
        if(StringUtils.isEmpty(tableName)){
            return new Message("false", "删除失败", "");
        }

        if(!StringUtils.isEmpty(deleteList)) {
            String[] deletes = deleteList.split(",");
            returnobjService.deleteAllList(deletes, tableName);
        }

        return new Message("true", "删除成功", "");
    }

    @RequestMapping(value = "send", produces = "application/json;charset=utf-8")
    @ResponseBody
    @LoggingRecord(param = {"returnobjId"}, classType = {java.lang.String.class}, menu =MenuEnum.密品清退, operation = OperationEnum.下发,  info="下发密品清退计划，主键是:%s")
    public Object sendReturnobj(@RequestParam String returnobjId) throws Exception {

        try {
            returnobjService.sendReturnobj(returnobjId);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "下发异常"+e.getMessage(), "");
        }
        return new Message("true", "下发成功", "");
    }

    @RequestMapping(value = "deleteItem", produces = "application/json;charset=utf-8")
    @ResponseBody
    @LoggingRecord(param = {"returnobjId","deleteList"}, classType = {java.lang.String.class, java.lang.String.class}, menu =MenuEnum.密品清退, operation = OperationEnum.删除子项, info="删除密品清退:%s下子密件：%s")
    public Object deleteItem(@RequestParam String deleteList,@RequestParam String returnobjId, HttpServletRequest request) throws Exception {

        String deptId = null;
        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User)session.getAttribute("User");
            if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                deptId = user.getuDeptId();
            }
        }

        if (!StringUtils.isEmpty(deleteList) && !StringUtils.isEmpty(deptId)) {
            String[] deletes = deleteList.split(",");
            returnobjService.deleteItem(deletes, returnobjId, deptId);
        }else{

        }
        return new Message("true", "删除成功", "");
    }

    //Returnobject表和ReturnobjectItem表编辑 需要id
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    @LoggingRecord(param = {"returnobj.id", "returnobj"}, classType = {Returnobject.class, Returnobject.class}, menu =MenuEnum.密品清退, operation = OperationEnum.修改, info="编辑主键为%s密品清退计划,编辑后对象为:%s")
    public Object update(@RequestParam String returnobj) throws Exception {
        Returnobj returnobjBean = new Returnobj();

        Returnobject returnobject = JSONObject.toJavaObject(JSON.parseObject(returnobj), Returnobject.class);;

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        returnobject.setUpdateTime(simpleDateFormat.format(date));
        returnobjBean.setReturnobject(returnobject);

        returnobjService.update(returnobjBean);
        return new Message("true", "更新成功", "");
    }

    //Returnobject表和ReturnobjectItem表查询
    //{             "pageIndex":"1",             "pageSize":"10",             "paramEntity":{             "status":"1"         }         }
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    @LoggingRecord(param = {"returnobject.paramEntity","isDetail","returnobjectitem"}, classType = {Page.class, java.lang.String.class, Page.class}, menu =MenuEnum.密品清退, operation = OperationEnum.查询)
    public Object select(//1 单号  2 详情
                         @RequestParam String isDetail,
                         //查Returnobject的 Page类型
                         String returnobject,
                         //查ReturnobjectItem详情 Page类型
                         String returnobjectitem, HttpServletRequest request) {
        if (isDetail.equals("1")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(returnobject), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            HttpSession session = request.getSession();
            if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
                User user = (User)session.getAttribute("User");
                if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                    JSONObject jsonObject = JSON.parseObject(returnobject).getJSONObject("paramEntity");
                    jsonObject.put("deptId", user.getuDeptId());
                    page.setParamEntity(jsonObject);
                }else{
                    page.setList(null);
                    page.setTotalRecord(0);
                    page.setTotalPages(0);
                    return JSONObject.toJSON(page);
                }
            }
            Page p = returnobjService.selectPageUseDycReturnobject(page);
            return JSONObject.toJSON(p);
        } else if (isDetail.equals("2")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(returnobjectitem), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            Page p = returnobjService.selectPageUseDycReturnobjectitem(page);
            return JSONObject.toJSON(p);
        }else if(isDetail.equals("3")){
            //清退计划product查询  需要查询本单位的在库/
            Page page = JSONObject.toJavaObject(JSON.parseObject(returnobject), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            HttpSession session = request.getSession();
            if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
                User user = (User)session.getAttribute("User");
                if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                    JSONObject jsonObject = JSON.parseObject(returnobject).getJSONObject("paramEntity");
                    jsonObject.put("deptId", user.getuDeptId()+"productfather_view");
                    jsonObject.put("sonDeptId", user.getuDeptId()+"productson_view");
                    page.setParamEntity(jsonObject);
                    Page p = returnobjService.insertPageUseSearch(page, jsonObject);
                    return JSONObject.toJSON(p);
                }else{
                    page.setList(null);
                    page.setTotalRecord(0);
                    page.setTotalPages(0);
                    return JSONObject.toJSON(page);
                }
            }
        } else if(isDetail.equals("4")){
            JSONObject json = JSON.parseObject(returnobject).getJSONObject("paramEntity");
            Page page = JSONObject.toJavaObject(JSON.parseObject(returnobject), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", null)));
            }
            Page p = returnobjService.editPageUseSearch(page, json.getString("Stringid"));
            return JSONObject.toJSON(p);
        }
        return "error";
    }

    @RequestMapping(value = "selectcomnum", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectcomnum(@RequestParam String page,HttpServletRequest request){
        HttpSession session = request.getSession();
        String deptid = null;
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User)session.getAttribute("User");
            deptid = user.getuDeptId();
        }
        JSONObject jsonParamEntity = JSON.parseObject(page).getJSONObject("paramEntity");
        if(jsonParamEntity!=null){
            jsonParamEntity.put("deptid",deptid);
        }
        JSONObject temp = JSON.parseObject(page);
        temp.put("paramEntity", jsonParamEntity);
        Page page1 = JSONObject.toJavaObject(temp, Page.class);

        Page p = returnobjService.selectReturnComNum(page1);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "selectuncomnum", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectuncomnum(@RequestParam String page,HttpServletRequest request){
        HttpSession session = request.getSession();
        String deptid = null;
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User)session.getAttribute("User");
            deptid = user.getuDeptId();
        }
        JSONObject jsonParamEntity = JSON.parseObject(page).getJSONObject("paramEntity");
        if(jsonParamEntity!=null){
            jsonParamEntity.put("deptid",deptid);
        }
        JSONObject temp = JSON.parseObject(page);
        temp.put("paramEntity", jsonParamEntity);
        Page page1 = JSONObject.toJavaObject(temp, Page.class);
        Page p = returnobjService.selectReturnNonComNum(page1);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "selectjys", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectjys(@RequestParam String page,HttpServletRequest request){
        HttpSession session = request.getSession();
        String deptid = null;
        if(session != null && session.getAttribute("User") != null ) {
            User user = (User)session.getAttribute("User");
            deptid = user.getuDeptId();
        }
        JSONObject jsonParamEntity = JSON.parseObject(page).getJSONObject("paramEntity");
        if(jsonParamEntity!=null){
            jsonParamEntity.put("deptid",deptid);
        }
        JSONObject temp = JSON.parseObject(page);
        temp.put("paramEntity", jsonParamEntity);
        Page page1 = JSONObject.toJavaObject(temp, Page.class);
        Page p =  returnobjService.selectjys(page1);
        return JSONObject.toJSON(p);
    }
}
