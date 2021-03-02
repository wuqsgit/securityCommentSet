package com.ht70605.action;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.Application;
import com.ht70605.entity.Message;
import com.ht70605.entity.Page;
import com.ht70605.service.ApplicationService;
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
@RequestMapping("/application")
public class BasicDataApplicationAction extends BaseAction {
    @Resource
    private ApplicationService applicationService;

    //application表添加
    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String name,
                         @RequestParam String info) {

        snowflakeIdWorker().nextId();
        Application application = new Application();
        application.setAllName(name);
        Page<Application> page = new Page<>();
        page.setParamEntity(application);
        Page<Application> applicationPage = applicationService.selectPageUseDyc(page);

        if (applicationPage.getList().size() == 0) {
            SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
            application.setId(idWorker.nextId() + "");
            application.setName(name);
            application.setInfo(info);
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            application.setCreateTime(simpleDateFormat.format(date));
            application.setUpdateTime(simpleDateFormat.format(date));
            application.setStatus("1");
            try {
                applicationService.insert(application);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
                    return "application error";
            }

        return "error";
    }

    //application表删除
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object deleteList(@RequestParam String deleteList) throws Exception {
        try {
            String[] strArray = deleteList.split(",");
            applicationService.deleteList(strArray);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    //application表编辑
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String update(@RequestParam String id,
                         @RequestParam String name,
                         @RequestParam String info) throws Exception {
        Application application = new Application();
        application.setAllName(name);
        Page<Application> page = new Page<>();
        page.setParamEntity(application);
        Page<Application> applicationPage = applicationService.selectPageUseDyc(page);
        if (applicationPage.getList().size() == 0 && !StringUtils.isEmpty(id)) {
            // application = applicationPage.getList().get(0);
            application.setName(name);
            application.setInfo(info);
            application.setId(id);
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            application.setUpdateTime(simpleDateFormat.format(date));
            try {
                applicationService.update(application);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            return "application error";
        }
        return "error";
    }

    //application表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String pageIndex,
                         @RequestParam String name,
                         @RequestParam String info) {
        Application application = new Application();
        application.setName(name.equals("") ? null : name);
        application.setInfo(info.equals("") ? null : info);

        Page<Application> page = new Page<>();
        page.setPageIndex(Integer.parseInt(pageIndex));
        String pageSize = "10";
        page.setPageSize(Integer.parseInt(pageSize));
        page.setParamEntity(application);//查询条件
        Page p = applicationService.selectPageUseDyc(page);
        return JSONObject.toJSON(p);
    }

    //获取所有用户信息
    @RequestMapping(value = "selectApplication", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectApplication() {
        try {
            List<Application> applicationList = applicationService.selectAll();
            return new Message("true", "加载密品类别成功", applicationList);
        } catch (Exception ex) {
            return new Message("true", "加载密品类别失败", null);

        }

    }

}
