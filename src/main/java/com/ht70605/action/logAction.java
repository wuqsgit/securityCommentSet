package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.Page;
import com.ht70605.service.LogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/8/22.
 */
@Controller
@RequestMapping("/log")
public class logAction {

    @Resource
    private LogService logService;
    //application表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String page, HttpServletRequest request) {
        Page _page = JSONObject.toJavaObject(JSON.parseObject(page), Page.class);
        //Log log = new Log();
        JSONObject entity = new JSONObject();
        JSONObject obj= JSON.parseObject(page).getJSONObject("paramEntity");
        String createTime = obj.getString("createTime");
        String sysuserId= obj.getString("sysuserId");
        if(createTime!=null&&!"".equals(createTime))
        {
            String []time= createTime.toString().split("至");
            entity.put("startTime", time[0].trim());
            entity.put("endTime", time[1].trim());
        }
        if(sysuserId!=null&&!"".equals(sysuserId)) {
            entity.put("sysuserId", sysuserId);
        }
        _page.setParamEntity(entity);
        Page  p = logService.selectPageUseDyc(_page);
        return JSONObject.toJSON(p);
    }
}
