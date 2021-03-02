package com.ht70605.actionsync;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.action.WebSocketAction;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.*;
import com.ht70605.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
@Controller
@RequestMapping("/BoxSync")
public class BoxSyncAction {
    @Resource
    private ProductService productService;
    @Resource
    private SysEquipmentService sysEquipmentService;
    @Resource
    private SysUserService sysUserService;
    @Resource
   private CapuserecordService capuserecordService;

    @Resource
   private ProductUseRecordService productUseRecordService;
    @Resource
    private ProductInCapService productInCapService;

    @Resource
    private WebSocketAction notifyWebSocket;

    private Logger logger = LoggerFactory.getLogger(BoxSyncAction.class);

    private DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

    //基础信息同步
    @RequestMapping(method = RequestMethod.POST,value = "PostBaseInfo", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object PostBaseInfo(@RequestBody SyncObj syncObj){
        Page page=new Page();
        System.out.println("接收基础信息："+JSON.toJSON(syncObj));
        logger.error("---------接收基础信息-----------------------------------------" + dateFormat.format(new Date()));
        logger.error(JSON.toJSON(syncObj).toString());
        logger.error("-----------------------------" );
        //接收柜子上传的EPC给他回传EPC对应的名称不用进行新旧验证
      //  SyncObj syncObj = JSONObject.toJavaObject(JSON.parseObject(sysObj.toString()), SyncObj.class);
        if(syncObj!=null)
        {
            List<SyncObjInfo> SyncobjInfos = syncObj.getSyncObjInfoList();//接收到的数据
            for(int i=0;i<SyncobjInfos.size();i++)
            {
                SyncObjInfo syncObjInfo=SyncobjInfos.get(i);
                Product product=new Product();
                String epc=syncObjInfo.getEpc();
                 //epc= getRfidCode(epc);//16进制转10进制编码
                product.setRfidCode(epc);
                page.setParamEntity(product);

                Page p = productService.selectPage(page);
                //syncObjInfo.setName("测试"+i);
               if(p.getList().size()>0)//存在该EPC的标签
               {
                  Product product1= (Product)p.getList().get(0);//
                  String ProCode= product1.getProCode();
                  syncObjInfo.setName(ProCode);//给载体柜返回列装号
               }
            }
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time=simpleDateFormat.format(date);
            syncObj.setTime(time);
            syncObj.setStatus("success");
            System.out.println("--------返回基础信息1------------");

        }
        logger.error("return PostBaseInfo:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + JSONObject.toJSON(syncObj));
        return JSONObject.toJSON(syncObj);
    }

    //开柜记录同步
    @RequestMapping(method = RequestMethod.POST,value = "PostLog", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object PostLog (@RequestBody SyncLog syncLog)throws Exception
    {
        System.out.println("接收到开柜记录："+JSON.toJSON(syncLog));
        logger.error("---------接收到开柜记录---------" +JSON.toJSON(syncLog) +"-----------------------------" + dateFormat.format(new Date()));
        logger.error(JSON.toJSON(syncLog).toString());
        logger.error("-----------------------------" );
        SnowflakeIdWorker snowflakeIdWorker=new SnowflakeIdWorker(0,0);
       // SyncLog syncLog = JSONObject.toJavaObject(JSON.parseObject(sysObj.toString()), SyncLog.class);
        if(syncLog!=null)
        {
            Page page=new Page();
            String ip= syncLog.getIp();
            Sysequipment sysEquipmentBean=new Sysequipment();
            sysEquipmentBean.setIp(ip);
            List<Sysequipment>sysequipmentList = sysEquipmentService.selectByIP(sysEquipmentBean);
            SysuserSelect sysuser1=new SysuserSelect();
            String userName="";
            if(syncLog.getUserNum()=="")
            {
                syncLog.setUserNum(null);
            }
            sysuser1.setUserCode(syncLog.getUserNum());
            page.setParamEntity(sysuser1);
            Page<Sysuser> userPage = sysUserService.selectPageUseDyc(page);
            String uid="";//人员ID
            String boxid="";//柜子ID
            String  boxName="";//柜子名
            if(userPage.getList().size()>0)//获取用户id,用户名
            {
               uid=userPage.getList().get(0).getId();
               userName=userPage.getList().get(0).getName();

            }
            if(sysequipmentList.size()>0)//存在IP为XXX的设备
            {
                boxid= sysequipmentList.get(0).getId();
                boxName=sysequipmentList.get(0).getParamtime();
                if(sysequipmentList.get(0).getEquipmentNo()!=null)
                {
                    boxName=boxName +sysequipmentList.get(0).getEquipmentNo();
                }
            }
            //只有当密品人员和设备都在数据库中存在的时候才会将信息进入数据库中
            if(uid !=""&&boxid !="")
            {
                Capuserecord capuserecord=new Capuserecord();
                String id=String.valueOf(snowflakeIdWorker.nextId());
                capuserecord.setId(id);
                capuserecord.setSysuserId(uid);
                capuserecord.setSysequipmentId(boxid);
                capuserecord.setTimeStart(syncLog.getTime());
                capuserecordService.insert(capuserecord);
                List<SyncLogInfo>syncLogInfos=syncLog.getSyncObjInfoList();
                int qu=0;int cun=0;
                if(syncLogInfos.size()>0)
                {
                    for (int i=0;i<syncLogInfos.size();i++)
                    {
                        String epc= syncLogInfos.get(i).getEpc();//epc
                        String type=syncLogInfos.get(i).getType();//操作类型1-取 2-存getRfidCode(epc);
                        if(type.equals("1"))
                        {
                            qu=qu+1;
                        }
                        else
                            {
                                cun=cun+1;
                            }
                        Productuserecord productUseRecord=new Productuserecord();

                        Product product=new Product();
                        product.setRfidCode(epc);
                        Page page1=new Page();
                        page.setParamEntity(product);
                        Page p  = productService.selectPage(page);
                        if(p.getList().size()>0)
                        {
                            Product product1=(Product)p.getList().get(0);
                            String product1Id= product1.getId();
                            String id2=String.valueOf(snowflakeIdWorker.nextId());
                            productUseRecord.setId(id2);
                            productUseRecord.setCapuserecordId(id);
                            productUseRecord.setProductId(product1.getId());
                            productUseRecord.setOutin(type);
                            productUseRecordService.insert(productUseRecord);
                        }
                    }
                    System.out.println("-------------返回开柜记录2------------");
                    String bussiness = "1";
                    String msg=syncLog.getTime()+"<br/>";//智能柜-2017-07-31
                    msg+=boxName;
                    msg+= "<br/>"+userName+"-取出："+qu +"   存入："+cun ;//FF -取出 2 存入 5 ;
                   String div="<table style=\"height: 90px;font-family: '微软雅黑';color: white;font-weight: bolder;\">" +
                               "<tr>" +
                               "<td colspan='2'>"+syncLog.getTime()+"</td>" +
                               "</tr>" +
                               "<tr>" +
                                   "<td>操作人："+userName+"</td>" +
                               "</tr>" +
                               "<tr>" +
                                   "<td>取出："+qu +"</td>"+
                                   "<td>存入："+cun +"</td>"+
                                "</tr>" +
                               "</table>";
                    notifyWebSocket.broadcast(div, bussiness, null);
                }
            }
       }
        SyncObj syncObj=new SyncObj();
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=simpleDateFormat.format(date);
        syncObj.setTime(time);
        syncObj.setType("2");
        syncObj.setStatus("success");
        logger.error("return PostLog:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + JSONObject.toJSON(syncObj));
        return JSONObject.toJSON(syncObj);
    }
 //在柜记录同步
    @RequestMapping(method = RequestMethod.POST,value = "PostOnBox", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object PostOnBox(@RequestBody SyncOnBox syncOnBox)throws Exception{

        System.out.println("接收在柜记录："+JSON.toJSON(syncOnBox));
        logger.error("---------接收在柜记录-------------------------------------------------" + dateFormat.format(new Date()) );
        logger.error(JSON.toJSON(syncOnBox).toString());
        logger.error("-----------------------------" );
        SnowflakeIdWorker snowflakeIdWorker=new SnowflakeIdWorker(0,0);
        Productincap productincap=new Productincap();
        Sysequipment sysEquipmentBean=new Sysequipment();
        sysEquipmentBean.setIp(syncOnBox.getIp());
        List<Sysequipment>sysequipmentList = sysEquipmentService.selectByIP(sysEquipmentBean);
        String boxid="";
        if(sysequipmentList.size()>0)//存在IP为XXX的设备
        {
            boxid= sysequipmentList.get(0).getId();
        }
        System.out.println("柜子ID："+boxid);
        //只有当设备存在系统中，数据才会进库
        if(boxid !="")
        {
            productincap.setSysequipmentId(boxid);
            productInCapService.delete(productincap);
            List<SyncOnBoxInfo>syncOnBoxInfoList= syncOnBox.getSyncObjInfoList();
            for(int i=0;i<syncOnBoxInfoList.size();i++)
            {
                String id=String.valueOf(snowflakeIdWorker.nextId());
                String epc=syncOnBoxInfoList.get(i).getEpc();
                Product product=new Product();
                product.setRfidCode(epc);
                Page page=new Page();
                page.setParamEntity(product);
                Page p  = productService.selectPage(page);
                if(p.getList().size()>0)
                {
                    Product product1=(Product)p.getList().get(0);
                    String product1Id= product1.getId();
                    productincap.setId(id);
                    productincap.setSysequipmentId(boxid);
                    productincap.setProductId(product1Id);
                    productInCapService.insert(productincap);
                }
            }
            System.out.println("返回在柜记录3");
        }

        SyncObj syncObj=new SyncObj();
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=simpleDateFormat.format(date);
        syncObj.setTime(time);
        syncObj.setType("3");
        syncObj.setStatus("success");
        logger.error("return PostOnBox:------------------------------" + dateFormat.format(new Date()) + "-------------------------------------:" + JSONObject.toJSON(syncObj));
        return JSONObject.toJSON(syncObj);

    }

    //将16进制的
    public  String getRfidCode(String readMarkEPC){
        String epc = "";
        String firstMessage = "";
        String secMessage = "";
        String thrMessage = "";
        String fourMessage = "";
        String lastMessage = "";
        String last = "";
        String rfidCode = "";
        //取前7个字节
        if (readMarkEPC != null) {
            epc = readMarkEPC.substring(0, 14);
        }
        // && TextUtil.isDigit(epc)
        if (readMarkEPC != null) {
            // 前4个字节按字节转10进制
            // 第一个字节 parseInt
            String oneByte = epc.substring(0, 2);
            firstMessage = parseInt16(oneByte);

            // 第二个字节 parseInt
            String twoByte = epc.substring(2, 4);

            secMessage = parseInt16(twoByte);

            // 第三个字节 parseInt
            String threeByte = epc.substring(4, 6);

            thrMessage = parseInt16(threeByte);

            // 第四个字节 parseInt
            String fourByte = epc.substring(6, 8);

            fourMessage = parseInt16(fourByte);

            // 最后三个字节，转10进制
            String lastByte = epc.substring(8, 14);
            // 判断是否为数字

            lastMessage = parseInt16(lastByte);
            last = buqi(Integer.parseInt(lastMessage));

            rfidCode = firstMessage + secMessage + thrMessage + fourMessage+ last;

            return rfidCode;



        } else {
            return "";
        }

    }

    public  String parseInt16(String data){
        return String.valueOf(Integer.parseInt(data,16));

    }
    public String buqi(Integer i)
    {
        String test = "0 1 0 0 00000023";
        String ret = i.toString();
        if (i.toString().length() == 1)
        {
            ret = "0000000" + ret;
        }
        if (i.toString().length() == 2)
        {
            ret = "000000" + ret;
        }
        if (i.toString().length() == 3)
        {
            ret = "00000" + ret;
        }
        if (i.toString().length() == 4)
        {
            ret = "0000" + ret;
        }
        if (i.toString().length() == 5)
        {
            ret = "000" + ret;
        }
        if (i.toString().length() == 6)
        {
            ret = "00" + ret;
        }
        if (i.toString().length() == 7)
        {
            ret = "0" + ret;
        }
        if (i.toString().length() == 8)
        {
            ret = "" + ret;
        }
        return ret;
    }

}
