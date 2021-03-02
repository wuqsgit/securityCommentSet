package com.ht70605.action;

import com.ht70605.common.SnowflakeIdWorker;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * Created by Administrator on 2017/5/10.
 */
//Action基类

@Controller
@RequestMapping("/base")
public class BaseAction {
    @Resource
    public ServletContext applition;

    public SnowflakeIdWorker snowflakeIdWorker(){
        //获取Servlet
              SnowflakeIdWorker o=(SnowflakeIdWorker)applition.getAttribute("snowflakeIdWorker");

        return  o;
    }

}
