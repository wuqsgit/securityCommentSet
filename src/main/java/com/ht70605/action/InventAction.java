package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.*;
import com.ht70605.service.InventService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/Invent")
public class InventAction extends BaseAction {
    @Resource
    private InventService inventService;


    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String inventory, HttpServletRequest request) throws Exception {
        Invent inventBean = new Invent();

        Inventory inventorys = new Inventory();

        JSONObject json = JSON.parseObject(inventory);
        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User)session.getAttribute("User");
            if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                inventorys.setSysuserid(user.getuId());
                json.put("deptId", user.getuDeptId());
            }else{
                return new Message("false", "保存失败", "");
            }
        }

        inventorys.setDictionaryid(json.getString("dictionaryId"));
        inventorys.setApplicationid(json.getString("applicationId"));
        inventorys.setDepartmentid(json.getString("deptId"));
        inventorys.setLocationid(json.getString("locationId"));

        List<ProductView> productSelects = inventService.selectProductPage(inventorys, json);
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        inventorys.setId(idWorker.nextId() + "");
        inventorys.setStatus("0");

        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        inventorys.setCreattime(simpleDateFormat.format(date));
        //inventorys.setRettime(simpleDateFormat.format(date));

        inventBean.setInventory(inventorys);

        List<Inventoryitem> inventoryitemList = new ArrayList<>();
        if(productSelects != null){
            for(ProductView product : productSelects) {
                if(product.getIsTrue() == 0){
                    continue;
                }
                if (!StringUtils.isEmpty(inventorys.getId()) && !StringUtils.isEmpty(product.getId())) {
                    Inventoryitem inventoryitem = new Inventoryitem();
                    inventoryitem.setId(idWorker.nextId() + "");
                    inventoryitem.setInventoryId(inventorys.getId());
                    inventoryitem.setProductId(product.getId());
                    inventoryitemList.add(inventoryitem);
                }
            }

        }
        inventBean.setInventoryitemList(inventoryitemList);
        inventService.insert(inventBean);
        return new Message("true", "保存成功", "");
    }

    @RequestMapping(value = "send", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object sendInventory(@RequestParam String inventoryId) throws Exception {
        try {
            inventService.sendInventory(inventoryId);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "下发异常"+e.getMessage(), "");
        }
        return new Message("true", "下发成功", "");
    }

    //Inventory表和InventoryItem表删除 需要id
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object delete(@RequestParam String deleteList) throws Exception {
        //Invent inventBean = JSONObject.toJavaObject(JSON.parseObject(invent), Invent.class);
        //inventService.delete(inventBean);
        if(!StringUtils.isEmpty(deleteList)) {
            String[] deletes = deleteList.split(",");
            inventService.deleteList(deletes);
        }

        return new Message("true", "删除成功", "");
    }

    @RequestMapping(value = "deleteItem", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object deleteItem(@RequestParam String deleteList,@RequestParam String inventId) throws Exception {

        if (!StringUtils.isEmpty(deleteList)) {
            String[] deletes = deleteList.split(",");
            inventService.deleteItem(deletes, inventId);
        }
        return new Message("true", "删除成功", "");
    }

    //Inventory表和InventoryItem表编辑 需要id
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String inventory) throws Exception {
        Invent inventBean = new Invent();
        Inventory inventoryBean =  JSONObject.toJavaObject(JSON.parseObject(inventory), Inventory.class);

        /*Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        inventoryBean.setCreattime(simpleDateFormat.format(date));*/
        inventBean.setInventory(inventoryBean);

        inventService.update(inventBean);
        return new Message("true", "更新成功", "");
    }

    //Inventory表和InventoryItem表查询
    //{             "pageIndex":"1",             "pageSize":"10",             "paramEntity":{             "status":"1" ,        }         }
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(//1 单号  2 详情
                         @RequestParam String isDetail,
                         //查Inventory的 Page类型
                         String invertory,
                         //查InventoryItem详情 Page类型
                         String inventoryitem, HttpServletRequest request) {
        if (isDetail.equals("1")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(invertory), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            Page p = inventService.selectPageUseDycInventory(page);
            return JSONObject.toJSON(p);
        } else if (isDetail.equals("2")) {
            Page page = JSONObject.toJavaObject(JSON.parseObject(inventoryitem), Page.class);
            Page p = inventService.selectPageUseDycInventoryitem(page);
            return JSONObject.toJSON(p);
        }else if(isDetail.equals("3")){
            Page page = JSONObject.toJavaObject(JSON.parseObject(invertory), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            Page p = inventService.selectPageUseDycInventory(page);
            return JSONObject.toJSON(p);
        }else if(isDetail.equals("4")){
            Page page = JSONObject.toJavaObject(JSON.parseObject(invertory), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            HttpSession session = request.getSession();
            if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
                User user = (User)session.getAttribute("User");
                if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                    JSONObject jsonObject = JSON.parseObject(invertory).getJSONObject("paramEntity");
                    jsonObject.put("deptId", user.getuDeptId());
                    page.setParamEntity(jsonObject);
                }else{
                    page.setList(null);
                    page.setTotalRecord(0);
                    page.setTotalPages(0);
                    return JSONObject.toJSON(page);
                }
            }
            Page p = inventService.selectPageUseSearch(page);
            return JSONObject.toJSON(p);
        }else if(isDetail.equals("5")){
            Page page = JSONObject.toJavaObject(JSON.parseObject(invertory), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            JSONObject json = JSON.parseObject(invertory).getJSONObject("paramEntity");
            HttpSession session = request.getSession();
            if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
                User user = (User)session.getAttribute("User");
                if(user != null && !StringUtils.isEmpty(user.getuDeptId())){
                    json.put("deptId", user.getuDeptId());
                    json.put("startPage", page.getStart());
                    json.put("pageSize", page.getPageSize());
                }else{
                    page.setList(null);
                    page.setTotalRecord(0);
                    page.setTotalPages(0);
                    return JSONObject.toJSON(page);
                }
            }
            Page p = inventService.insertPageUseSearch(page, json);
            return JSONObject.toJSON(p);
        }else if(isDetail.equals("6")){
            JSONObject json = JSON.parseObject(invertory).getJSONObject("paramEntity");
            Page page = JSONObject.toJavaObject(JSON.parseObject(invertory), Page.class);
            if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
                page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
            }
            Page p = inventService.editPageUseSearch(page, json.getString("Stringid"));
            return JSONObject.toJSON(p);
        }
        return "error";
    }

    @RequestMapping(value = "selectjys", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectjys(@RequestParam String page,HttpServletRequest request){
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
        Page p = inventService.selectjys(page1);
        return JSONObject.toJSON(p);
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
        Page p = inventService.selectInComNum(page1);
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
        Page p = inventService.selectInNonComNum(page1);
        return JSONObject.toJSON(p);
    }


}
