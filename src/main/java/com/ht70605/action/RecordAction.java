package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.Page;
import com.ht70605.entity.Record;
import com.ht70605.service.RecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/Record")
public class RecordAction extends BaseAction {
    @Resource
    private RecordService recordService;

//    List<Capuserecord> capuserecord;//开柜记录表添加
//    List<Productuserecord> productuserecord;//取放记录表添加
//    List<Accesscontrol> accesscontrol;//出入记录表添加
//    List<Alarmrecord> alarmrecord;//报警记录表添加

    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String record) throws Exception {
        Record recordBean = JSONObject.toJavaObject(JSON.parseObject(record), Record.class);
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        if (recordBean.getProductuserecord() != null)
            recordBean.getProductuserecord().forEach(productuserecord -> {
                productuserecord.setId(idWorker.nextId() + "");
            });
        if (recordBean.getCapuserecord() != null)
            recordBean.getCapuserecord().forEach(capuserecord -> {
                capuserecord.setId(idWorker.nextId() + "");
            });
        if (recordBean.getAccesscontrol() != null)
            recordBean.getAccesscontrol().forEach(accesscontrol -> {
                accesscontrol.setId(idWorker.nextId() + "");
            });
        if (recordBean.getAlarmrecord() != null)
            recordBean.getAlarmrecord().forEach(alarmrecord -> {
                alarmrecord.setId(idWorker.nextId() + "");
            });

        recordService.insert(recordBean);
        return "success";
    }

    //下列各表id作为条件
//    List<Capuserecord> capuserecord;//开柜记录表删除
//    List<Productuserecord> productuserecord;//取放记录表删除
//    List<Accesscontrol> accesscontrol;//出入记录表删除
//    List<Alarmrecord> alarmrecord;//报警记录表删除
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object delete(@RequestParam String record) throws Exception {
        Record recordBean = JSONObject.toJavaObject(JSON.parseObject(record), Record.class);
        recordService.delete(recordBean);
        return "success";
    }

    //下列各表id作为条件
//    List<Capuserecord> capuserecord;//开柜记录表修改
//    List<Productuserecord> productuserecord;//取放记录表修改
//    List<Accesscontrol> accesscontrol;//出入记录表修改
//    List<Alarmrecord> alarmrecord;//报警记录表修改
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String update(@RequestParam String record) throws Exception {
        Record recordBean = JSONObject.toJavaObject(JSON.parseObject(record), Record.class);
        recordService.update(recordBean);
        return "success";
    }

    //productForRecord bean作为条件
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String productForRecord) {
        Page page = JSONObject.toJavaObject(JSON.parseObject(productForRecord), Page.class);
        Page p = recordService.selectPageUseDycProductForRecord(page);
        return JSONObject.toJSON(p);
    }
}
