package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.*;
import com.ht70605.service.SysEquipmentService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/sysEquipment")
public class BasicDataSysEquipmentAction extends BaseAction {
    @Resource
    private SysEquipmentService sysEquipmentService;

    //SysEquipment表添加
    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String sysEquipment) {
        Sysequipment sysEquipmentBean = JSONObject.toJavaObject(JSON.parseObject(sysEquipment), Sysequipment.class);

        List<Sysequipment> sysequipments = sysEquipmentService.selectByIP(sysEquipmentBean);
        if (sysequipments.size() == 0) {
            SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
            sysEquipmentBean.setId(idWorker.nextId() + "");
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sysEquipmentBean.setCreateTime(simpleDateFormat.format(date));
            sysEquipmentBean.setUpdateTime(simpleDateFormat.format(date));
            //sysEquipmentBean.setStatus("1");
            try {
                sysEquipmentService.insert(sysEquipmentBean);
                return new Message("true", "新增成功", sysEquipmentBean);
            } catch (Exception e) {
                e.printStackTrace();
                return new Message("false", "新增异常", sysEquipmentBean);
            }
        } else {
            return new Message("false", "IP重复", sysEquipmentBean);
        }
    }

    //SysEquipment表删除
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object deleteList(@RequestParam String deleteList) throws Exception {
        try {
            String[] strArray = deleteList.split(",");
            sysEquipmentService.deleteList(strArray);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "删除异常" + e.getMessage(), "");
        }
        return new Message("true", "删除成功", "");
    }

    //SysEquipment表编辑
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String sysEquipment) throws Exception {
        Sysequipment sysEquipmentBean = JSONObject.toJavaObject(JSON.parseObject(sysEquipment), Sysequipment.class);

        List<Sysequipment> sysequipments = sysEquipmentService.selectByIP(sysEquipmentBean);
        if (sysequipments.size() == 0 || (sysequipments.size() == 1 && sysequipments.get(0).getId().equals(sysEquipmentBean.getId()))) {
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sysEquipmentBean.setUpdateTime(simpleDateFormat.format(date));
            try {
                sysEquipmentService.update(sysEquipmentBean);
            } catch (Exception e) {
                e.printStackTrace();
                return new Message("false", "编辑异常" + e.getMessage(), sysEquipmentBean);
            }
            return new Message("true", "编辑成功", sysEquipmentBean);
        } else {
            return new Message("false", "数据库存在同IP数大于2", sysEquipmentBean);
        }
    }

    //SysEquipment表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String sysEquipment) {
        Page page = JSONObject.toJavaObject(JSON.parseObject(sysEquipment), Page.class);
        if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
            page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
        }
        Page p = sysEquipmentService.selectPageUseDyc(page);
        return JSONObject.toJSON(p);
    }

    @RequestMapping(value = "selectAdminByDept", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectAdminByDept(@RequestParam String deptId) throws Exception {
        try
        {
            List<Sysuser> sysusers= sysEquipmentService.selectSysuserByDeptId(deptId);
            return new Message("true","查询成功", sysusers);
        }
        catch (Exception ex)
        {
            return new Message("false","删除单位失败", null);
        }
    }

    //role表查询
    @RequestMapping(value = "selectForInsert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectForInsert() {
        JSONObject jsonObject = new JSONObject();
        List<Dictionary> dictionaries= sysEquipmentService.selectSysequitMent();
        List<Location> locations= sysEquipmentService.selectLocation();
        List<Sysuser> sysusers= sysEquipmentService.selectSysuser();

        jsonObject.put("dictionaries", dictionaries);
        jsonObject.put("locations", locations);
        jsonObject.put("sysusers", sysusers);
        return jsonObject;
    }

}
