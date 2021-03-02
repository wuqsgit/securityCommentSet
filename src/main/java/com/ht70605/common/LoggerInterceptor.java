package com.ht70605.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.Log;
import com.ht70605.entity.User;
import com.ht70605.service.LogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/22.
 */
public class LoggerInterceptor implements HandlerInterceptor {

    private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);

    private LogService logService;

    private WebApplicationContext springContext;

    private static ServletContext application;

    public LoggerInterceptor() {
    }

    /**
     * 执行方法前进行拦截
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
       @Override
       public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
              try {
                logger.error("开启监听器");
              this.userLogging(request, handler,response);
               } catch (Exception e) {
                     e.printStackTrace();
                  String message = "页面出错了，请联系管理员";
                  printMessage(response, message);
                     return false;
                   }
               return true;
            }

    /**
     * 页面出错 出错页面
     * @param response
     * @param res
     * @throws Exception
     */
            public static void printMessage(HttpServletResponse response, Object res) throws Exception{
                PrintWriter writer = null;
             response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html; charset=utf-8");
                try {
                      writer = response.getWriter();
                       writer.print(res);
                    } catch (Exception e) {
                        e.printStackTrace();
                   } finally {
                        if (writer != null){
                               writer.close();
                           }
                }
             }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 针对添加  修改 删除操作
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

           private boolean userLogging(HttpServletRequest request, Object handler, HttpServletResponse response) throws Exception {
               LoggingRecord loggingRecord = ((HandlerMethod) handler).getMethodAnnotation(LoggingRecord.class);

               //方法没有进行注解
               if (loggingRecord == null) {
                   return true;
               }
               if (request == null || request.getSession() == null || request.getSession().getAttribute("User") == null) {
                   logger.error("无用户名称");
                   String message = "页面出错了，请联系管理员";
                   printMessage(response, message);
                   return false;
               }
               User user = (User) request.getSession().getAttribute("User");

               logger.error("用户名称为：" + user.getuName());

               //参数解析 进行记录日志
               String[] params = loggingRecord.param();
               Class[] clses = loggingRecord.classType();
               JSONObject json = new JSONObject();
               if(params != null && clses != null && params.length == clses.length){
                    json = parseLogJsonObj(params, clses, request);
                    StringBuilder builder = new StringBuilder();
                   if(StringUtils.isEmpty(loggingRecord.info()) || "".equals(loggingRecord.info().trim())){
                       for(String param : params){
                           if(json.containsKey(param) && !StringUtils.isEmpty(json.getString(param))) {
                               builder.append(json.getString(param));
                           }
                       }
                   }else {
                       String tempStr = loggingRecord.info();
                       if (params != null && params.length > 0) {
                           Object obj[] = new Object[params.length];
                           for (int i = 0; i < params.length; i++) {
                               if (json.containsKey(params[i]) && !StringUtils.isEmpty(json.getString(params[i]))) {
                                   obj[i] = json.getString(params[i]).toString();
                               }
                           }
                           builder = new StringBuilder(String.format(tempStr, obj));
                       }else{
                           builder.append(tempStr);
                       }

                   }
                   saveLog(builder.toString(), loggingRecord, request.getSession());
                }else{
                    throw  new BusinessException("日志参数错误");
                }

               return true;
           }

    private JSONObject parseLogJsonObj(String[] params, Class[] clses, HttpServletRequest request) throws NoSuchFieldException, IllegalAccessException {
        Map<String, String> paramObj = takenParams(request);
        JSONObject json = new JSONObject();
        String tempParam = null;
        for(int i = 0; i < params.length; i++) {
            String[] param = null;
            if (params[i].contains(".")) {
                param = params[i].split("\\.");
            }

            //进行记录
            logger.error("第" + i + "个参数为:" + params[i] + ",对应类型为:" + clses[i].toString());

            if (param != null && param.length > 0) {
                tempParam = param[0];
            }else{
                tempParam = params[i];
            }

            if (paramObj != null && paramObj.containsKey(tempParam)) {
                logger.info("获取参数为：" + paramObj.get(tempParam));
                //判断是否是基本类型
                if(isBasicType(clses[i].toString())){
                    logger.info("基本类型为:" + paramObj.get(tempParam));
                    json.put(params[i], String.valueOf(paramObj.get(tempParam)));
                    continue;
                }
                Object obj = JSONObject.toJavaObject(JSON.parseObject(paramObj.get(tempParam)), clses[i]);
                if (param != null && param.length > 1) {
                    Field field = clses[i].getDeclaredField(param[1]);
                    field.setAccessible(true);
                    obj = field.get(obj);
                }
                String toString = JSON.toJSON(obj).toString().replaceAll("\"\"", "null");
                logger.info("需要记录的对象为:" + JSON.toJSON(toString).toString());
                json.put(params[i], JSON.toJSON(toString).toString());
                //
            }
        }
        return json;
    }

    //判断是否为基本类型
    private boolean isBasicType(String type){
        if(type.contains("java.lang.String")){
            return true;
        }else if(type.contains(" java.lang.Boolean")){
            return true;
        }else if(type.contains("java.lang.Character")){
            return true;
        }else if(type.contains("java.lang.Double")){
            return true;
        }else if(type.contains("java.lang.Float")){
            return true;
        }else if(type.contains("java.lang.Long")){
            return true;
        }else if(type.contains("java.lang.Integer")){
            return true;
        }else if(type.contains("java.lang.Short")){
            return true;
        }else if(type.contains("java.lang.Byte")){
            return true;
        }

        return  false;
    }

    private void saveLog(String obj, LoggingRecord loggingRecord, HttpSession session) throws Exception {
        Log log = new Log();
        User user = (User)session.getAttribute("User");
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        log.setCreateTime(simpleDateFormat.format(date));
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        log.setId(idWorker.nextId() + "");
        log.setInfo(obj);
        log.setMenu(loggingRecord.menu().toString());
        log.setOperationType(loggingRecord.operation().toString());
        log.setRoleId(user.getuLoginName());
        log.setSysuserId(user.getuName());
        log.setStatus("1");

        application = session.getServletContext();
        springContext = WebApplicationContextUtils.getWebApplicationContext(application);
        if(springContext != null){
            logService = (LogService)springContext.getBean("LogService");
            logService.insert(log);
        }else{
            logger.error("获取应用程序上下文失败!");
            return;
        }

    }

    private Map takenParams(HttpServletRequest request) {
        Map map = new HashMap();
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() != 0) {
                    map.put(paramName, paramValue);
                }
            }
        }
        return map;
    }
}
