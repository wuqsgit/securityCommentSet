package com.ht70605.actionsync;

import com.ht70605.action.WebSocketAction;
import com.ht70605.entity.ServerEntity;
import com.ht70605.utils.ServerAddressUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/7/25.
 */
@Controller
@RequestMapping("/test")
public class TestRest {
    private Logger logger = LoggerFactory.getLogger(BaseInfoSyncAction.class);

    @Resource
    private WebSocketAction notifyWebSocket;

    private static ServerEntity server = null;

    @RequestMapping(method = RequestMethod.GET,value = "testMessage", produces = "application/json;charset=utf-8")
    @ResponseBody
    public void getbaseinfo(HttpServletRequest request){
        if (server == null) {
            server = new ServerEntity();
            server.setPort(request.getLocalPort());
            server.setIp(ServerAddressUtils.getServerIp());
            //server.setContextName(request.getContextPath());
            server.setAudioName("audio/mail.wav");
        }

        String bussiness = "1";
        notifyWebSocket.broadcast("你好，请点击", bussiness, server);
    }
}
