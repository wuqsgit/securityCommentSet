package com.ht70605.common;

import com.ht70605.action.WebSocketAction;
import com.ht70605.entity.NotifyField;
import com.ht70605.service.NotifyFieldService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

//@WebListener
public class StartupListener implements ServletContextListener {
	
	//@Resource
	private NotifyFieldService notifyFieldService;

	private WebApplicationContext springContext;

	private Logger logger = LoggerFactory.getLogger(StartupListener.class);

	@Override
    public void contextInitialized(ServletContextEvent sce) {
		springContext = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		if(springContext != null){
			notifyFieldService = (NotifyFieldService)springContext.getBean("NotifyFieldService");
		}else{
			logger.error("获取应用程序上下文失败!");
			return;
		}
		List<NotifyField> notifyFields = notifyFieldService.findAllField();
		logger.info("number is:" + notifyFields);
    	    Map<String,Set<WebSocketAction>> con = new HashMap<String,Set<WebSocketAction>>();
    	    for(NotifyField notifyField : notifyFields){
    	        con.put(notifyField.getId(), new CopyOnWriteArraySet<WebSocketAction>());
    	    }
    	    ServletContext application = sce.getServletContext();
    	    application.setAttribute("allCon", con);
        System.setProperty("org.apache.el.parser.COERCE_TO_ZERO", "false");        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {}

}
