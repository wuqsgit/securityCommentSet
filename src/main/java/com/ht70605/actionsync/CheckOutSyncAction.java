package com.ht70605.actionsync;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.action.CheckOutAction;
import com.ht70605.entity.*;
import com.ht70605.service.CheckOutService;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 706 on 2017/7/8.
 */
@Controller
@RequestMapping("/checkOutSync")
public class CheckOutSyncAction {
    @Resource
    private CheckOutAction checkOutAction;

    @Resource
    private CheckOutService checkOutService;

    private Logger logger = LoggerFactory.getLogger(CheckOutSyncAction.class);

    private DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

    @RequestMapping(value = "select", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(//1 单号  2 详情  随机密件
                         @RequestParam String isDetail,
                         //查checkOutBill的 Page类型
                         String checkoutbill,
                         //查checkOutBillItem详情 Page类型
                         String checkoutbillitem) throws Exception {
        logger.error("CheckOutSyncAction select:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + isDetail +","+checkoutbill + ","+checkoutbillitem);
        Object returnObj = checkOutAction.select(isDetail, checkoutbill, checkoutbillitem, null);
        logger.error("return CheckOutSyncAction select:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + JSONObject.toJSON(returnObj));
        return  returnObj;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String checkoutList) throws Exception {
        logger.error("update:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + checkoutList);
        JSONArray objects = JSON.parseArray(checkoutList);
//todo CheckOutAction.java黄远新已经改好了，可以用下面这块代码了
       /* if (objects != null) {
            for (int i = 0; i < objects.size(); i++) {
                try {
                    checkOutAction.update(objects.get(0).toString());
                } catch (Exception e) {
                    e.printStackTrace();
                    return new Message("false", "状态更新失败", "");
                }
            }
            return new Message("true", "状态更新成功", "");
        }
        return new Message("false", "状态更新失败", "");*/

        if (objects != null) {
            for (int i = 0; i < objects.size(); i++) {
                Checkout checkoutBean = JSONObject.toJavaObject(JSON.parseObject(objects.get(i).toString()), Checkout.class);
                Checkoutbill checkoutbill = checkoutBean.getCheckoutbill();
                Date date = new Date(System.currentTimeMillis());
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                checkoutbill.setUpdateTime(simpleDateFormat.format(date));


                Page page = new Page();
                page.setPageIndex(1);
                page.setKeyWord("detail");
                Checkoutbillitem checkoutbillitem = new Checkoutbillitem();
                checkoutbillitem.setCheckoutbillId(checkoutbill.getId());
                page.setParamEntity(checkoutbillitem);
                Page p = checkOutService.selectPageUseDycCheckoutbillitem(page);
                List<Checkoutbillitem> checkoutbillitemList1 = new ArrayList<>();
                checkoutbillitemList1.addAll(p.getList());
                checkoutbillitemList1.forEach(checkoutbillitem1 -> {
                    checkoutbillitem1.setResult("1");
                    checkoutbillitem1.setUpdateTime(simpleDateFormat.format(date));
                    checkoutbillitem1.setCheckoutTime(simpleDateFormat.format(date));
                });
                checkoutBean.setCheckoutbillitemList(checkoutbillitemList1);
                checkOutService.update(checkoutBean);

            }
            logger.error("return CheckOutSyncAction update:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("true", "状态更新成功", "").toString());
            return new Message("true", "状态更新成功", "");
        }
        logger.error("return CheckOutSyncAction update:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "状态更新失败", "").toString());
        return new Message("false", "状态更新失败", "");
    }

    //插入新的数据  TODO  这里也需要修改productStatus状态
    @RequestMapping(value = "insertNew", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insertNew(@RequestParam String checkoutList) throws Exception {
        logger.error("insertNew:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + checkoutList);
        JSONArray objects = JSON.parseArray(checkoutList);
        if (objects != null) {
            for (int i = 0; i < objects.size(); i++) {
                try {
                    Checkout checkoutBean = JSONObject.toJavaObject(JSON.parseObject(objects.get(i).toString()), Checkout.class);
                    Checkoutbill checkoutbill = checkoutBean.getCheckoutbill();
                    List<Checkoutbillitem> checkoutbillitemList = checkoutBean.getCheckoutbillitemList();
                    //TODO  对productStatus改变   也需要加入Product?
                    checkOutService.insert(checkoutBean);
                } catch (Exception e) {
                    e.printStackTrace();
                    logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "添加失败", "").toString());
                    return new Message("false", "添加失败", "");
                }
            }
            logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("true", "添加成功", "").toString());
            return new Message("true", "添加成功", "");
        }
        logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("false", "添加失败", "").toString());
        return new Message("false", "添加失败", "");
    }
}
