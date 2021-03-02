package com.ht70605.actionsync;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.*;
import com.ht70605.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/8.
 */
@Controller
@RequestMapping("/baseinfoSync")
public class BaseInfoSyncAction {

    @Resource
    private SysUserService sysUserService;
    @Resource
    private DepartmentService  departmentService;
    @Resource
    private ApplicationService applicationService;
    @Resource
    private LocationService locationService;
    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private ProductService productService;

    private Logger logger = LoggerFactory.getLogger(BaseInfoSyncAction.class);

    private DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

    @RequestMapping(method = RequestMethod.POST,value = "getbaseinfo", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object getbaseinfo()
    {
        BaseInfo baseInfo=new BaseInfo();//定义接口返回类型
        Page page=new Page();
        List<Sysuser> sysuserList = sysUserService.selectAll();//获取人员信息
        baseInfo.setSysusers(sysuserList);

        List<Department>departmentPage=  departmentService.getAllDepartment();////获取部门信息
        baseInfo.setDepartmentList(departmentPage);

        List<Application>applicationList= applicationService.selectAll();//获取系统信息
        baseInfo.setApplicationList(applicationList);

        List<Location>locationList= locationService.selectAll();//获取位置信息
        baseInfo.setLocationList(locationList);

        List<Dictionary>dictionaryList= dictionaryService.selectAll();//获取字典信息
        baseInfo.setDictionaryList(dictionaryList);
        logger.error("getbaseinfo---------------------------" + dateFormat.format(new Date()) + "--------------------------------------" + JSONObject.toJSON(baseInfo));
        return JSONObject.toJSON(baseInfo);
    }

    @RequestMapping(method = RequestMethod.POST,value = "getproduct", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object getproduct(@RequestParam String userId)
    {

       Page page=new Page();
        Product product=new Product();
        if(userId!="")
        {
          product.setSysuserId(userId);
        }
//        Sysuser sysuser=new Sysuser();
//        sysuser.setId(userId);
//        page.setParamEntity(sysuser);
//        Page<User> result = sysUserService.selectPageUseDyc(page);
//        if(result.getList().size()>0)
//        {
         page.setParamEntity(product);
         page = productService.selectPage(page);
         page.setParamEntity(null);

//
//        }
        logger.error("getproduct---------------------------" + dateFormat.format(new Date()) + "--------------------------------------" +  JSONObject.toJSON(page));
      return JSONObject.toJSON(page);
    }

}
