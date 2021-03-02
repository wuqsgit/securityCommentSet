package com.ht70605.action;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.dao.DepartmentMapper;
import com.ht70605.entity.*;
import com.ht70605.service.DepartmentService;
import com.ht70605.service.ProductStatusService;
import com.ht70605.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2017/5/10.
 */
@Controller
@RequestMapping("/dept")
public class BasicDataDeptAction extends BaseAction {

    @Resource
    private DepartmentService departmentService;

    @Resource
    private SysUserService sysUserService;

    @Autowired
    private DepartmentMapper deptMapperDao;

    @Resource
    private ProductStatusService productStatusService;

    //新增
    @RequestMapping(value = "add", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object add(Department department) throws Exception {
        try
        {
            //判断是否存在已有的部门名称  仅仅判断这个分支的部门名称
            Department  dept= deptMapperDao.selectByPrimaryKey(department.getId());
            if(StringUtils.isEmpty(department.getSuperDepId())){
                department.setSuperDepId("0");
            }
            boolean isDouble = getSuperDeptById(department.getSuperDepId(), department.getDepName());
            if(isDouble)
            {
                String id=UUID.randomUUID().toString().substring(0, 5);
                //String sort=dept.getDeptSort()+id;
                department.setId(id);
                department.setStatus("1");
                //dept.sets(sort);
                Date date = new Date(System.currentTimeMillis());
                Department superDept = deptMapperDao.selectByPrimaryKey(department.getSuperDepId());
                StringBuilder builder = new StringBuilder();
                if(superDept != null && !StringUtils.isEmpty(superDept.getDeptSort())){
                    builder.append(superDept.getDeptSort());
                }
                builder.append(id);
                department.setDeptSort(builder.toString());
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                department.setCreateTime(simpleDateFormat.format(date));
                departmentService.insert(department);

                //新建表和视图
                productStatusService.createProductStatusTableAndView(department.getId());

                return new Message("true","新增单位成功", null);
            }
            else
            {
                return new Message("false","单位名称重复", null);
            }
        }
        catch (Exception ex)
        {
            return new Message("false","新增单位失败", null);
        }

    }

    //获取本级的信息
    @RequestMapping(value="selectDeptUser",method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectDeptUser(HttpServletRequest request) throws Exception {
        JSONObject json = new JSONObject();
        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User) session.getAttribute("User");
            Department department = departmentService.getDepartmentById(user.getuDeptId());
            if(department != null){
                json.put("nodeId", department.getId());
                json.put("nodeText", department.getDepName());
            }
        }
        return  json;
    }

    @RequestMapping(value = "selectDeptAdmin", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectDeptAdmin(@RequestParam String deptId) throws Exception {
        boolean hasAdmin = departmentService.selectDeptAdmin(deptId);
        if(!hasAdmin){
            return  new Message("true","该单位已经存在管理员", null);
        }else{
            return  new Message("false","该单位不存在管理员", null);
        }

    }

    private boolean getSuperDeptById(String deptId, String deptName){
        boolean isDouble = false;
        Department department =  deptMapperDao.selectByPrimaryKey(deptId);
        if(department != null && !StringUtils.isEmpty(department.getDepName()) && !department.getDepName().equals(deptName)){
            if(department.getSuperDepId() != null && !"0".equals(department.getSuperDepId()) && !"00".equals(department.getSuperDepId())){
                isDouble =  getSuperDeptById(department.getSuperDepId(), deptName);
            }else{
                isDouble = true;
            }
        }else if(department == null){
            isDouble = true;
        }else if(department.getDepName().equals(deptName)){
            isDouble = false;
        }
        return isDouble;
    }

    //修改
    @RequestMapping(value = "edit", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object edit(Department department) throws Exception {

        try
        {
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            department.setUpdateTime(simpleDateFormat.format(date));
            departmentService.update(department);
            return new Message("true","编辑单位成功", null);
        }
        catch (Exception ex)
        {
            return new Message("false","编辑单位失败", null);
        }

    }

    //删除
    @RequestMapping(value = "del", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object del(Department department) throws Exception {

        try
        {
            Date date = new Date(System.currentTimeMillis());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            department.setUpdateTime(simpleDateFormat.format(date));
            department.setStatus("0");
            departmentService.delete(department);
            return new Message("true","删除单位成功", null);

        }
        catch (Exception ex)
        {
            return new Message("false","删除单位失败", null);
        }
    }

    //显示所有单位
    @RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object select(String id){

        Department dept=new Department();
        dept.setId(id);
        Map<String,Item> itemMap= departmentService.selectSuperDeptId(dept);
        TreeViewData treeViewData=new TreeViewData();
        treeViewData.setStatus("ok");
        treeViewData.setData(itemMap);
        return JSONObject.toJSON(treeViewData);
    };

    //显示用户单位
    @RequestMapping(value = "selectByUser", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectByUser(HttpServletRequest request){
        Department dept=new Department();
        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("User") != null && session.getAttribute("User") instanceof  User) {
            User user = (User)session.getAttribute("User");
            if("admin".equals(user.getuLoginName())){
                Map<String,Item> itemMap = departmentService.selectSuperDeptId(null);
                TreeViewData treeViewData=new TreeViewData();
                treeViewData.setStatus("ok");
                treeViewData.setData(itemMap);
                return JSONObject.toJSON(treeViewData);
            }
            dept.setId(user.getuDeptId());
        }


        Map<String,Item> itemMap= departmentService.selectSuperDeptIdByUser(dept);
        TreeViewData treeViewData=new TreeViewData();
        treeViewData.setStatus("ok");
        treeViewData.setData(itemMap);
        return JSONObject.toJSON(treeViewData);
    };

    //获取所有用户信息
    @RequestMapping(value = "selectUserAll", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object selectUserAll() throws Exception {

        try {
            List<Sysuser> sysusers= sysUserService.selectAll();
            return new Message("true","获取用户信息成功", sysusers);
        }
        catch (Exception ex)
        {
            return new Message("false","获取用户信息失败", null);
        }
    }

}
