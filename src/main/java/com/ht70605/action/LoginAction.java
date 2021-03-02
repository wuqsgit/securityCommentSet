package com.ht70605.action;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.*;
import com.ht70605.service.MenuService;
import com.ht70605.service.SysUserService;
import com.ht70605.service.UserRoleService;
import com.ht70605.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Properties;

/**
 * Created by Administrator on 2017/5/16.
 */
@Controller
@RequestMapping("/initSystem")
public class LoginAction extends BaseAction {

    @Resource
    private BasicDataSysUserAction basicDataSysUserAction;
    @Resource
    private UserService userService;

    @Resource
    SysUserService sysUserService;
    @Resource
    private MenuService menuService;

    @Resource
   private UserRoleService userRoleService;

   /* @Resource
    private UserRoleService userRoleService;*/

    @RequestMapping(value = "checkLogin")
    @ResponseBody
    public Object checkLogin(@RequestParam String uLoginName,
                             @RequestParam String uPwd, HttpServletRequest request
                             ) throws NoSuchAlgorithmException, UnsupportedEncodingException {

       //String pwd= basicDataSysUserAction.pwdToMd5(uLoginName,uPwd);
       String pwd= uLoginName + "ht70605" + uPwd;
       if(uLoginName.equals("admin"))
       {
           Properties pro=new Properties();
           try{

               InputStream in= getClass().getResourceAsStream("../../../jdbc.properties");
               pro.load(in);
               String uid= pro.getProperty("db.uid").trim();
               String login= pro.getProperty("db.login").trim();
               String opwd= pro.getProperty("db.pwd").trim();
               if(login.equals(uLoginName)&&opwd.equals(pwd))
               {
                   User user = new User();
                   user.setuLoginName(uLoginName);
                   user.setuPwd(pwd);
                   user.setuId(uid);
                   user.setuName(uLoginName);
                   //Userrole userrole = userRoleService.
                   HttpSession session= request.getSession();
                   session.setAttribute("User",user);
                   session.setMaxInactiveInterval(-1);//Session永不失效
                   return new Message("true","登录成功", null);
               }
               else
                   {
                       return new Message("false","用户名密码错误", null);
                   }


           }
           catch (Exception ex)
           {
               return new Message("false","用户名密码错误", null);
           }

       }
       else
           {
               User user = new User();
               user.setuLoginName(uLoginName);
               user.setuPwd(pwd);
               Page page = new Page();
               page.setParamEntity(user);
               page.setPageIndex(1);
               page.setPageSize(10);
             //  Page<User> result=  sysUserService.selectPage(page);
               Page<User> result = userService.selectPageUseDyc(page);

               List<User>users= result.getList();
               if(users.size()>0)
               {
                   HttpSession session= request.getSession();
                   session.setMaxInactiveInterval(-1);//Session永不失效
                   session.setAttribute("User",users.get(0));
                   return new Message("true","登录成功", null);
               }
               else
               {
                   return new Message("false","用户名密码错误", null);
               }
           }

    }

    @RequestMapping(value = "getTree", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object getTree(@RequestParam String uId,ServletRequest servletRequest) {
//        [
//        {id: 1, pid: 0, node: '主页', url: '/loginOld.jsp', ico: 'zhuye'},
//        {id: 2, pid: 0, node: '基础信息维护', url: '', ico: ''},
//        {id: 5, pid: 2, node: '组织结构', url: '/src/basicData/department.jsp', ico: ''},
//        {id: 4, pid: 2, node: '角色信息', url: '/src/basicData/role.jsp', ico: ''},
//        {id: 3, pid: 2, node: '用户信息', url: '/src/basicData/user.jsp', ico: ''},
//        {id: 6, pid: 2, node: '权限分配', url: '', ico: ''},
//        ]
        //if()
       // uId="1";
        List<Menu> result=null;
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpSession session = request.getSession();
        if(session != null || session.getAttribute("User") != null)
        {
            User user=(User)session.getAttribute("User");

            if(user.getuLoginName().equals("admin"))
            {
                result = menuService.getTreeAll();
            }
            else
                {
                    Userrole userrole=new Userrole();
                    userrole.setSysuserId(user.getuId());
                    Userrole userrole1= userRoleService.select(userrole);//获取用户角色
                    result = menuService.getTree(user.getuId());
                    if(userrole1!=null)
                    {
                        for(int i=0;i<result.size();i++)
                        {
                           if(userrole1.getRoleId().equals("2")||userrole1.getRoleId().equals("4")||userrole1.getRoleId().equals("5"))//安全保密管理员-安全审计员
                           {
                               if(result.get(i) != null && !StringUtils.isEmpty(result.get(i).getNode()) && "首页".equals(result.get(i).getNode())){
                                   //user.get
                                   result.get(i).setUrl("/welcome.jsp");
                               }
                           }

                        }
                    }

                }

        }
        return JSONObject.toJSON(result);
    }


}
