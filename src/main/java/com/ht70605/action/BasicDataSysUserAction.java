package com.ht70605.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.common.SnowflakeIdWorker;
import com.ht70605.entity.*;
import com.ht70605.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/sysuser")
public class BasicDataSysUserAction extends BaseAction {
    @Resource
    private SysUserService sysuserService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private UserRoleService userRoleService;

    @Resource
    private MenuService menuService;

    @Resource
    private UserRoleActionService userRoleActionService;

    //SysUser表添加
    @RequestMapping(value = "insert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insert(@RequestParam String sysuser,
                         @RequestParam String userrole
    ) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        JSONObject json =  JSON.parseObject(sysuser);
        Boolean isAdmin = false;
        if(json != null && "true".equals(json.getString("addFormAdminDept"))){
            isAdmin = true;
        }
        Sysuser sysuserBean = JSONObject.toJavaObject(JSON.parseObject(sysuser), Sysuser.class);
        Userrole userroleBean = JSONObject.toJavaObject(JSON.parseObject(userrole), Userrole.class);

        List<Sysuser> sysusers = sysuserService.selectByNameAndUserName(sysuserBean);
        if (sysusers.size() == 0) {
            SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
            sysuserBean.setId(idWorker.nextId() + "");
           // String pwdnew=pwdToMd5(sysuserBean.getUserName(),sysuserBean.getPassWord());
            String pwdnew=(sysuserBean.getUserName()+"ht70605"+sysuserBean.getPassWord());
            sysuserBean.setPassWord(pwdnew);
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sysuserBean.setCreateTime(simpleDateFormat.format(date));
           // sysuserBean.setUpdateTime(simpleDateFormat.format(date));
            sysuserBean.setStatus("1");

            userroleBean.setId(sysuserBean.getId());
            userroleBean.setSysuserId(sysuserBean.getId());
            userroleBean.setCreateTime(simpleDateFormat.format(date));
            userroleBean.setUpdateTime(simpleDateFormat.format(date));
            userroleBean.setStatus("1");
            try {
                sysuserService.insert(sysuserBean);
                sysuserService.insertUserrole(userroleBean);

                //判断该人员是否为部门负责人部门负责人
                if(sysuserBean.getDeptManager()=="true")
                {
                    departmentService.updateDepatmentAdmin(sysuserBean.getDepartmentId(),sysuserBean.getId());
                }
                return new Message("true", "新增成功", sysuserBean);
            } catch (Exception e) {
                e.printStackTrace();
                return new Message("false", "新增异常", sysuserBean);
            }
        }else{
            return new Message("false", "名称或登录名重复", sysuserBean);
        }
    }

    //密码转MD5
    public String pwdToMd5(String uLoginName, String uPwd) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //        MD5加密方法

        String md5Key = "ht70605";
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte[] pwd=md5.digest((uLoginName + md5Key + uPwd).getBytes("utf-8"));
        StringBuffer buffer = new StringBuffer();
        for(byte b: pwd){
            //遍历数组，然后与8个二进制位做与运算
            int number = b & 0xff;//加盐
            //转换为String类型
            String hex = Integer.toHexString(number);
            Integer.toBinaryString(number);
            //如果长度为1，前面加0
            if(hex.length()==1){
                buffer.append("0");
            }
            buffer.append(hex);
        }
//        String md5Key = "denglu miyao";
//        MessageDigest md5 = MessageDigest.getInstance("MD5");
//        BASE64Encoder base64Encoder = new BASE64Encoder();
//        String pwd = base64Encoder.encode(md5.digest((uLoginName + md5Key + uPwd).getBytes("utf-8")));
        return buffer.toString();
    }

    //SysUser表删除
    @RequestMapping(value = "delete", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object deleteList(@RequestParam String deleteList) throws Exception {
        try {
            String[] strArray = deleteList.split(",");
            sysuserService.deleteList(strArray);
        } catch (Exception e) {
            e.printStackTrace();
            return new Message("false", "删除异常"+e.getMessage(), "");
        }
        return new Message("true", "删除成功", "");
    }

    //SysUser表编辑
    @RequestMapping(value = "update", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object update(@RequestParam String sysuser,
                         @RequestParam String userrole) throws Exception {
        Sysuser sysuserBean = JSONObject.toJavaObject(JSON.parseObject(sysuser), Sysuser.class);
        Userrole userroleBean = JSONObject.toJavaObject(JSON.parseObject(userrole), Userrole.class);
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            sysuserBean.setUpdateTime(simpleDateFormat.format(date));
            try
            {
                if(sysuserBean.getDepartmentId().equals(""))
                {
                    sysuserBean.setDepartmentId(null);
                }
                if(sysuserBean.getPassWord().equals(""))
                {
                    sysuserBean.setPassWord(null);
                }
                sysuserService.update(sysuserBean);
                //判断该人员的角色是否存在，存在则修改不存在则新增。
                userroleBean.setSysuserId(sysuserBean.getId());
                userroleBean.setStatus("1");

                Userrole userrole1= userRoleService.select(userroleBean);

                if(userrole1!=null)
                {
                    userrole1.setRoleId(userroleBean.getRoleId());
                    sysuserService.updateUserrole(userrole1);
                }
                else{
                    sysuserService.insertUserrole(userroleBean);
                }
                //判断该人员是否为部门负责人部门负责人
                if(sysuserBean.getDeptManager()=="true")
                {
                   departmentService.updateDepatmentAdmin(sysuserBean.getDepartmentId(),sysuserBean.getId());
                }

                return new Message("true", "编辑成功", sysuserBean);
            }
            catch (Exception e) {
                e.printStackTrace();
                return new Message("false", "编辑异常"+e.getMessage(), null);
            }


    }

    //SysUser表查询
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(@RequestParam String sysuser) {
        Page page = JSONObject.toJavaObject(JSON.parseObject(sysuser), Page.class);
        if(page != null && page.getParamEntity() != null && !StringUtils.isEmpty(page.getParamEntity().toString())) {
            page.setParamEntity(JSONObject.parse(page.getParamEntity().toString().replaceAll("\"\"", "null")));
        }
        Page p = sysuserService.selectPageUseDyc(page);
        return JSONObject.toJSON(p);
    }

    //role表查询
    @RequestMapping(value = "selectForInsert", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectForInsert() {
        JSONObject jsonObject = new JSONObject();
        List<Role> roleList= sysuserService.selectRole();
        List<Department> departmentList= sysuserService.selectDepartment();

        jsonObject.put("roleList", roleList);
        jsonObject.put("departmentList", departmentList);
        return jsonObject;
    }

    //修改密码
    @RequestMapping(value = "updatePwd", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object updatePwd(@RequestParam String sysuser ,HttpServletRequest request) {
        try
        {
            Sysuser sysuser1 = JSONObject.toJavaObject(JSON.parseObject(sysuser), Sysuser.class);
            HttpSession session= request.getSession();
            User user=(User)session.getAttribute("User");
            String id=user.getuId();
            sysuser1.setId(id);
            //String pwd= pwdToMd5(user.getuLoginName(),sysuser1.getPassWord());
            String pwd=user.getuLoginName()+"ht70605"+sysuser1.getPassWord();
            sysuser1.setPassWord(pwd);
            sysuserService.update(sysuser1);
            return new Message("true", "密码修改成功", null);
        }
        catch (Exception ex)
        {
            return new Message("false", "密码修改失败", null);
        }
    }
    //获取人员角色菜单权限
    @RequestMapping(value = "selectRoleMenu", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectRoleMenu(@RequestParam String user ,HttpServletRequest request) {
        try
        {
            SysuserSelect sysuser = JSONObject.toJavaObject(JSON.parseObject(user), SysuserSelect.class);
            List<Menu> menuList= menuService.getTree(sysuser.getId());
            Page<RoleMenuAction> page=new Page<RoleMenuAction>();
            List<RoleMenuAction> menuActionList=new ArrayList<>();

            for(int i=0;i<menuList.size();i++)
            {

                 String id=menuList.get(i).getId();
                if(id.equals("1")||id.equals("7")||id.equals("18")||id.equals("19")||id.equals("20"))
                {
                    continue;
                }
                String menuName= menuList.get(i).getNode();
                RoleMenuAction roleMenuAction=new RoleMenuAction();
                roleMenuAction.setUid(sysuser.getId());
                roleMenuAction.setRoleId(sysuser.getRoleId());
                roleMenuAction.setRoleName(sysuser.getRoleName());
                roleMenuAction.setMenuId(id);
                roleMenuAction.setMenuName(menuName);
                //判断当前用户是否有权限
                UserRoleAction userRoleAction=new UserRoleAction();
                userRoleAction.setUid(sysuser.getId());
                userRoleAction.setRoleId(sysuser.getRoleId());
                userRoleAction.setMenuId(id);
                userRoleAction= userRoleActionService.select(userRoleAction);
                if(userRoleAction!=null)
                {
                    roleMenuAction.setAction(userRoleAction.getAction());
                }
                else
                    {
                        roleMenuAction.setAction("0");//默认有所有权限
                    }

                menuActionList.add(roleMenuAction);
            }
            page.setList(menuActionList);
            return JSONObject.toJSON(page);
        }
        catch (Exception ex)
        {
            return new Message("false", "获取角色菜单失败", null);
        }
    }

    //根据id获取人员角色模块的权限
    @RequestMapping(value = "selectRoleMenuById", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectRoleMenuById(@RequestParam String userroleaction ,HttpServletRequest request) {
        try
        {
                UserRoleAction userRoleAction = JSONObject.toJavaObject(JSON.parseObject(userroleaction), UserRoleAction.class);
                HttpSession session = request.getSession();
                User user = new User();
                if (session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof User) {
                    user = (User) session.getAttribute("User");
                    Userrole userrole=new Userrole();
                    userrole.setSysuserId(user.getuId());
                    userrole= userRoleService.select(userrole);//获取用户角色
                    userRoleAction.setRoleId(userrole.getRoleId());
                    userRoleAction.setUid(user.getuId());
                    userRoleAction= userRoleActionService.select(userRoleAction);
                }
              return new Message("false", "获取角色菜单是否仅只读权限成功", userRoleAction);

        }
        catch (Exception ex)
        {
            return new Message("false", "获取角色菜单是否仅只读权限失败", null);
        }
    }

    //设置人员角色菜单权限
    @RequestMapping(value = "insertRoleMenu", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object insertRoleMenu(@RequestParam String userroleaction ,HttpServletRequest request) {
        try
        {
            List<UserRoleAction> userRoleActionList=JSONArray.parseArray(userroleaction,UserRoleAction.class );
            for(int i=0;i<userRoleActionList.size();i++)
            {
               UserRoleAction userRoleAction= userRoleActionService.select(userRoleActionList.get(i));
               //存在权限则修改否则新增
               if(userRoleAction !=null)
               {
                   userRoleAction.setAction(userRoleActionList.get(i).getAction());
                   userRoleActionService.update(userRoleAction);
               }
               else
                   {
                       userRoleActionService.insert(userRoleActionList.get(i));
                   }
            }
            return new Message("true", "设置角色权限成功", null);
        }
        catch (Exception ex)
        {
            return new Message("false", "设置角色权限失败", null);
        }
    }

}
