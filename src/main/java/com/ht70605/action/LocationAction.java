package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.*;
import com.ht70605.service.DepartmentService;
import com.ht70605.service.LocationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by 706 on 2017/6/28.
 */
@Controller
@RequestMapping("/location")
public class LocationAction extends  BaseAction
{
    @Resource
    private LocationService locationService;

    @Resource
    private DepartmentService departmentService;


    //Product表查询
    @RequestMapping(value = "selectLocation", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectDictionary() {
        try {
            List<Location> dictionaryList = locationService.selectAll();

            return new Message("true", "加载位置成功", dictionaryList);
        } catch (Exception ex) {
            return new Message("true", "加载位置失败", null);

        }
    }


    //Location表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String locationStr) {
        Page page = JSONObject.toJavaObject(JSON.parseObject(locationStr), Page.class);
        Page p = locationService.selectPageUseDyc(page);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String location
    ) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Location locationBean = JSONObject.toJavaObject(JSON.parseObject(location), Location.class);

        List<Location> locations = locationService.selectByLocationAndUnit(locationBean);
        if (locations.size() == 0) {
            SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
            locationBean.setId(idWorker.nextId() + "");

            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            locationBean.setCreatTime(simpleDateFormat.format(date));
            try {
                locationService.insert(locationBean);
                return new Message("true", "新增成功", locationBean);
            } catch (Exception e) {
                e.printStackTrace();
                return new Message("false", "新增异常", locationBean);
            }
        }else{
            return new Message("false", "信息重复", locationBean);
        }
    }

    //Location表删除
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object deleteList(@RequestParam String deleteList) throws Exception {
        try {
            String[] strArray = deleteList.split(",");
            locationService.deleteList(strArray);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "删除异常"+e.getMessage(), "");
        }
        return new Message("true", "删除成功", "");
    }

    //Location表编辑
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String location) throws Exception {
        Location locationBean = JSONObject.toJavaObject(JSON.parseObject(location), Location.class);

        List<Location> locations = locationService.selectByLocationAndUnit(locationBean);
        if (locations.size() == 0||(locations.size() == 1&&locations.get(0).getId().equals(locationBean.getId()))) {
            try {
                locationService.update(locationBean);
            } catch (Exception e) {
                e.printStackTrace();
                return new Message("false", "编辑异常"+e.getMessage(), locationBean);
            }
            return new Message("true", "编辑成功", locationBean);
        }else{
            return new Message("false", "已有相同位置信息描述", locationBean);
        }
    }

    @RequestMapping(value = "selectDepts", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectForInsert() {
        JSONObject jsonObject = new JSONObject();

        List<Department> departmentList= departmentService.getAllDepartment();
        jsonObject.put("depts", departmentList);
        return jsonObject;
    }



    @RequestMapping(value = "selectLocationByDept", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectLocationByDept(@RequestParam String nodeId) {
        try {
            Set<Location> dictionaryList = locationService.selectLocationByDept(nodeId);
            return new Message("true", "加载位置成功", dictionaryList);
        } catch (Exception ex) {
            return new Message("true", "加载位置失败", null);

        }
    }

    //所有位置信息
    @RequestMapping(value = "selectALL", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectALL(HttpServletRequest request) {

        try
        {
            HttpSession session = request.getSession();
            User user = new User();
            if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
                user = (User) session.getAttribute("User");
            }
            List<Location> locations = locationService.selectLocationBySysUserId(user.getuId());
            return new Message("true", "获取位置信息成功", locations);
        }
        catch (Exception ex)
        {
            return new Message("false", "获取位置信息失败", null);
        }


//        Page page = JSONObject.toJavaObject(JSON.parseObject(locationStr), Page.class);
//        Page p = locationService.selectPageUseDyc(page);
       // return JSONObject.toJSON(p);
    }


}
