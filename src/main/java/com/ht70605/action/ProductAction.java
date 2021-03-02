package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ht70605.entity.*;
import com.ht70605.service.ApplicationService;
import com.ht70605.service.DepartmentService;
import com.ht70605.service.DictionaryService;
import com.ht70605.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/product")
public class ProductAction extends BaseAction {
    @Resource
    private ProductService productService;
    @Resource
    private DictionaryService dictionaryService;
    @Resource
    private ApplicationService applicationService;

    @Resource
    private DepartmentService departmentService;

    //Product表添加
    @Transactional
    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String product,
                         @RequestParam String productList,ServletRequest servletRequest) {

        try {
            Product product1 = JSONObject.toJavaObject(JSON.parseObject(product), Product.class);
            List product2 = JSONObject.parseArray(productList);
            List<Product>list =(List<Product>)product2;

            HttpServletRequest request = (HttpServletRequest)servletRequest;
            HttpSession session = request.getSession();
            String deptid = null;
            if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
                User user = (User)session.getAttribute("User");
                deptid= user.getuDeptId();
                product1.setDeptId(deptid);
                product1.setSysuserName(user.getuName());
                Department department=new Department();
                department.setId(deptid);
                department=departmentService.getDepartmentById(deptid);
                product1.setDepName(department.getDepName());

            }
            productService.insert(product1,list);

            return new Message("true","新增密品成功", null);

        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "新增密品失败", null);
        }
        //return JSONObject.toJSON(null);
    }

    //Product表删除
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object deleteList(@RequestParam String deleteList) throws Exception {
        try {
            String[] strArray = deleteList.split(",");
            productService.deleteList(strArray);
            return new Message("true", "删除密品成功", null);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "删除密品失败", null);
        }
    }

    //Product表编辑
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String product,
                         @RequestParam String productList) throws Exception {
        try {
            Product product1 = JSONObject.toJavaObject(JSON.parseObject(product), Product.class);
            List product2 = JSONObject.parseArray(productList);
            List<Product> list = (List<Product>) product2;
            productService.update(product1, list);
            return new Message("true", "修改密品成功", null);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "修改密品失败", null);
        }


    }

    //Product表编辑
    @RequestMapping(value = "rfidUpdate", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object rfidUpdate(@RequestParam String product) throws Exception {
        try {
            Product product1 = JSONObject.toJavaObject(JSON.parseObject(product), Product.class);
            Page page = new Page();
            page.setParamEntity(product1);
            Page p = productService.selectPage(page);
            if (p.getList().size() > 0) {
                Product product2 = (Product) p.getList().get(0);
                String ProCode = product2.getProCode();
                if(StringUtils.isEmpty(ProCode))
                {
                    ProCode=product2.getInfo();
                }
                return new Message("false", "该标签已被【" + ProCode + "】绑定", null);
            } else {
                productService.update(product1, null);
                return new Message("true", "绑定标签成功", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "绑定标签失败", null);
        }
    }

    @RequestMapping(value = "rfidSelect", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object rfidSelect(@RequestParam String product) throws Exception {
        try {
            Product product1 = JSONObject.toJavaObject(JSON.parseObject(product), Product.class);
            Page page = new Page();
            page.setParamEntity(product1);
            Page p = productService.selectPage(page);
            if (p.getList().size() > 0) {
                Product product2 = (Product) p.getList().get(0);
                String ProCode = product2.getProCode();
                return new Message("false", "该标签已被【" + ProCode + "】绑定", null);
            } else {
                return new Message("true", "绑定标签成功", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "绑定标签失败", null);
        }
    }

    //Product表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String page,ServletRequest servletRequest) {

        //JSONObject ParamEntity = JSON.parseObject(page).getJSONObject("paramEntity");
        JsonObject obj = new JsonParser().parse(page).getAsJsonObject();
        Product product = new Gson().fromJson(obj.getAsJsonObject("paramEntity"),Product.class);
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        Page _page = JSONObject.toJavaObject(JSON.parseObject(page), Page.class);
        HttpSession session = request.getSession();
        String deptid = null;
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
            User user = (User)session.getAttribute("User");
            deptid = user.getuDeptId();
            product.setDeptId(deptid);
            product.setSysuserName(user.getuName());
//            JSONObject json =  JSONObject.parseObject(_page.getParamEntity().toString());
//            json.put("deptId",deptid);
//            _page.setParamEntity(json);
        }

        Page  p = productService.selectProductViewListByParamEntity(_page,product);
        return JSONObject.toJSON(p);

//        Page p=null;
//        HttpServletRequest request = (HttpServletRequest)servletRequest;
//
//        HttpSession session = request.getSession();
//        if(session!=null)
//        {
//            User user= (User)session.getAttribute("User");
//            Page _page = JSONObject.toJavaObject(JSON.parseObject(page), Page.class);
//            JSONObject o= (JSONObject) _page.getParamEntity();
//            o.put("sysuserId",null);
//            _page.setParamEntity(o);
//            Product paramEntity= JSONObject.toJavaObject(JSON.parseObject(_page.getParamEntity().toString()), Product.class);
//            paramEntity.setSysuserId(user.getuId());
//            _page.setParamEntity(paramEntity);
//            p = productService.selectPageUseDyc(_page);
//            //TODO后续更改用下面的Servers
//           // p= productService.selectListByParamEntity(_page);
//        }
//        return JSONObject.toJSON(p);
    }

    //Product表查询
    @RequestMapping(value = "selectDictionary", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectDictionary() {
        // Map<String,Object> sysParamMap =new HashMap<String,Object>();
        try {
            List<Dictionary> dictionaryList = dictionaryService.selectAll();

//            for(int i=0;i<dictionaryList.size();i++)
//            {
//                if(dictionaryList.get(i).getType()=="productType")//密品类别
//                {
//                    sysParamMap.put(dictionaryList.get(i).getCode(), dictionaryList.get(i).getValue());
//                }
//            }
            return new Message("true", "加载密品类别成功", dictionaryList);
        } catch (Exception ex) {
            return new Message("true", "加载密品类别失败", null);

        }

    }

    //获取位置信息
    @RequestMapping(value = "selectLocation", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectLocation() {
        // Map<String,Object> sysParamMap =new HashMap<String,Object>();
        try {
            List<Dictionary> dictionaryList = dictionaryService.selectAll();

            return new Message("true", "加载密品类别成功", dictionaryList);
        } catch (Exception ex) {
            return new Message("true", "加载密品类别失败", null);

        }

    }

    @RequestMapping(value = "selectAppliactionNum", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectAppliactionNum(@RequestParam String page,HttpServletRequest request){
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
        Page p =  productService.selectApplicationNum(page1);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "selectProductNumByApplication", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectProductNumByApplication(@RequestParam String page,HttpServletRequest request){
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
        Page p =  productService.selectProductNumByApplication(page1);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "selectProductNumByType", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectProductNumByType(@RequestParam String page,HttpServletRequest request){
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
        Page p =  productService.selectProductNumByType(page1);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "selectProductNumByLocation", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectProductNumByLocation(@RequestParam String page,HttpServletRequest request){
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
        Page p =  productService.selectProductNumByLocation(page1);
        return JSONObject.toJSON(p);
    }


}
