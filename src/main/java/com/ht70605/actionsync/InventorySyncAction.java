package com.ht70605.actionsync;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.Inventory;
import com.ht70605.entity.InventorySync;
import com.ht70605.entity.Message;
import com.ht70605.service.InventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
@RequestMapping("/inventorySync")
public class InventorySyncAction{
    @Resource
    private InventService inventService;

    private Logger logger = LoggerFactory.getLogger(InventorySyncAction.class);

    private DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

    @RequestMapping(value="unsend",method = RequestMethod.POST ,produces = "application/json;charset=utf-8" )
    @ResponseBody
    public Object unsend(@RequestParam  String userId){

        logger.error("userId:--------------------------" + dateFormat.format(new Date()) + "-----------------------------------------:" + userId);
        if(StringUtils.isEmpty(userId)){
            return JSONObject.toJSON(new ArrayList<Inventory>());
        }

        List<Inventory> inventoryList = inventService.selectInventByUserId(userId);
        InventorySync sync = new InventorySync();
        sync.setInventoryPlan(inventoryList);
        logger.error("return sync:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + JSONObject.toJSON(sync));
        return JSONObject.toJSON(sync);
    }

    @RequestMapping(value="recvResult",method = RequestMethod.POST ,produces = "application/json;charset=utf-8" )
    @ResponseBody
    public Object recvResult(@RequestParam  String arrList){

        logger.error("arrList:----------------------------" + dateFormat.format(new Date()) + "---------------------------------------:" + arrList);
        if(StringUtils.isEmpty(arrList)){
            logger.error("return recvResult:---------------------------------" + dateFormat.format(new Date()) + "----------------------------------:" + new Message("true", "更新失败", "").toString());
            return new Message("true", "更新失败", "");
        }
        List<Inventory> inventoryList = new ArrayList<Inventory>();
        InventorySync synv =  JSONObject.toJavaObject(JSON.parseObject(arrList), InventorySync.class);
        if(synv != null && synv.getInventoryPlan()!= null) {
            inventoryList = synv.getInventoryPlan();
            inventService.updateInventory(inventoryList);
        }
        logger.error("return recvResult:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("true", "更新成功", "").toString());
        return new Message("true", "更新成功", "");
    }


    //TODO  添加一个
    @RequestMapping(value = "insertNew", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insertNew(@RequestParam String invenList) throws Exception {
        logger.error("invenList:----------------------------" + dateFormat.format(new Date()) + "---------------------------------------:" + invenList);
        if(StringUtils.isEmpty(invenList)){
            logger.error("return insertNew:---------------------------------" + dateFormat.format(new Date()) + "----------------------------------:" + new Message("true", "更新失败", "").toString());
            return new Message("true", "更新失败", "");
        }
        List<Inventory> inventoryList = new ArrayList<Inventory>();
        InventorySync synv =  JSONObject.toJavaObject(JSON.parseObject(invenList), InventorySync.class);
        if(synv != null && synv.getInventoryPlan()!= null) {
            inventoryList = synv.getInventoryPlan();
            inventService.updateInventory(inventoryList);
        }
        logger.error("return insertNew:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + new Message("true", "更新成功", "").toString());
        return new Message("true", "更新成功", "");
    }
}
