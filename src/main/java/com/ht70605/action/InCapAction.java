package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.InCap;
import com.ht70605.entity.Message;
import com.ht70605.entity.Page;
import com.ht70605.entity.User;
import com.ht70605.service.InCapService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
/**
 * Created by 706 on 2017/7/6.
 */
@Controller
@RequestMapping("/incap")
public class InCapAction  extends BaseAction{
    @Resource
    private InCapService inCapService;

    //application表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String page,HttpServletRequest request) {
        HttpSession session = request.getSession();
        String deptid = null;
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
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
        Page p = inCapService.selectPageUseDyc(page1);
        return JSONObject.toJSON(p);
    }
}
