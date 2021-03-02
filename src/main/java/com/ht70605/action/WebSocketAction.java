package  com.ht70605.action;

import com.ht70605.actionsync.ServerEncoder;
import com.ht70605.common.GetHttpSessionConfigurator;
import com.ht70605.entity.*;
import com.ht70605.service.NotifyFieldService;
import com.ht70605.service.NotifyMessageService;
import com.ht70605.service.NotifyTopicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by Administrator on 2017/7/21.
 */
@Controller
@ServerEndpoint(value="/WebSocket",configurator=GetHttpSessionConfigurator.class, encoders ={ServerEncoder.class})
public class WebSocketAction extends BaseAction implements Serializable {

    /**
     * 记录用户关注的话题数
     */
    private static Set<WebSocketAction> n_connect;

    /**
     * 记录当前话题的用户数
     */
    private static Set<WebSocketAction> f_connect;

    private Session session;

    private HttpSession httpSession;

    private static ServletContext application;

    private static Logger logger = LoggerFactory.getLogger("NotifyWebSocket");

    private String userId;

    private WebApplicationContext springContext;

    @Resource
    private NotifyTopicService notifyTopicService;

    @Resource
    private NotifyFieldService notifyFieldService;

    @Resource
    private NotifyMessageService notifyMessageService;

    @OnMessage
    public void onMessage(String message, Session session) throws IOException, InterruptedException {

        /*// Print the client message for testing purposes
        System.out.println("Received: " + message);

        // Send the first message to the client
        session.getBasicRemote().sendText("This is the first server message");

        // Send 3 messages to the client every 5 seconds
        int sentMessages = 0;
        while (sentMessages < 3) {
            Thread.sleep(5000);
            session.getBasicRemote().sendText("This is an intermediate server message. Count: " + sentMessages);
            sentMessages++;
        }

        // Send a final message to the client
        session.getBasicRemote().sendText("This is the last server message");*/
    }

    @OnOpen
    public void onOpen(Session session,  EndpointConfig config) {

        logger.info("Websocket Client connected");
        this.httpSession = (HttpSession) config.getUserProperties()
                .get(HttpSession.class.getName());
        this.session = session;

        if (httpSession.getAttribute("User") != null
                || !"".equals(httpSession.getAttribute("User"))){
            User user = (User) httpSession.getAttribute("User");
            userId = user.getuId();
            application = httpSession.getServletContext();

            @SuppressWarnings("unchecked")
            Map<String, Set<WebSocketAction>> con = (Map<String, Set<WebSocketAction>>)application
                    .getAttribute("allCon");

            springContext = WebApplicationContextUtils.getWebApplicationContext(application);
            if(springContext != null){
                notifyTopicService = (NotifyTopicService)springContext.getBean("NotifyTopicService");
            }else{
                logger.error("获取应用程序上下文失败!");
                return;
            }

            List<NotifyTopic> notifyTopics = notifyTopicService.getNotifyTopicByUserId(user.getuId());
            for(NotifyTopic notifyTopic : notifyTopics){
                n_connect = con.get(notifyTopic.getFieldId());
                if(n_connect != null){
                    n_connect.add(this);
                }
            }

        }
    }

    @OnClose
    public void onClose() {

        logger.info("Connection closed");
        if (httpSession.getAttribute("User") != null
                || !"".equals(httpSession.getAttribute("User"))) {
            User user = (User) httpSession.getAttribute("User");
            application = httpSession.getServletContext();
            @SuppressWarnings("unchecked")
            Map<String, Set<WebSocketAction>> con = (Map<String, Set<WebSocketAction>>) application
                    .getAttribute("allCon");

            springContext = WebApplicationContextUtils.getWebApplicationContext(application);
            if(springContext != null){
                notifyTopicService = (NotifyTopicService)springContext.getBean("NotifyTopicService");
            }else{
                logger.error("获取应用程序上下文失败!");
                return;
            }

            List<NotifyTopic> notifyTopics = notifyTopicService.getNotifyTopicByUserId(user.getuId());
            for (NotifyTopic notifyTopic : notifyTopics) {
                n_connect = con.get(notifyTopic.getFieldId());
                n_connect.remove(this);
            }
        }
    }

    public void broadcast(String msg, String business, ServerEntity server) {

        if(application != null){
            @SuppressWarnings("unchecked")
            Map<String, Set<WebSocketAction>> con = (Map<String, Set<WebSocketAction>>) application
                    .getAttribute("allCon");

            springContext = WebApplicationContextUtils.getWebApplicationContext(application);
            if(springContext != null){
                notifyFieldService = (NotifyFieldService)springContext.getBean("NotifyFieldService");
                notifyTopicService = (NotifyTopicService)springContext.getBean("NotifyTopicService");
            }else{
                logger.error("获取应用程序上下文失败!");
                return;
            }

            NotifyField notifyField = notifyFieldService.getFieldByBusiness(business);
            if(notifyField != null){
                List<NotifyTopic> notifyUsers = notifyTopicService.getNotifyTopicByTopic(notifyField.getId());

                Map<Boolean, Set<String>> isSendUsers = new HashMap<Boolean, Set<String>>();
                //记录未发送的用户
                isSendUsers.put(true, new CopyOnWriteArraySet<String>());
                //记录未发送的用户
                isSendUsers.put(false, new CopyOnWriteArraySet<String>());

                for(NotifyTopic notifyTopic : notifyUsers){
                    isSendUsers.get(false).add(notifyTopic.getUserId());
                }
                f_connect = con.get(notifyField.getId());
                for (WebSocketAction client : f_connect) {
                    try {
                        synchronized (client) {
                            //client.session.getBasicRemote().sendText(msg);
                            //JSONObject json = new JSONObject();
                            SendEntity encoder = new SendEntity();
                            if(!StringUtils.isEmpty(msg)){
                                //json.put("message", msg);
                                encoder.setMessage(msg);
                            }
                          /*  if(server != null && StringUtils.isNotEmpty(server.getAudioName())){
                                json.put("url", "http://"+ server.getIp() +":"+ server.getPort()+server.getContextName()+"/"+ Global.AUDIO_PATH.substring(0, Global.AUDIO_PATH.length() - 2)+"/" + server.getAudioName());
                            }*/
                            //json.put("url", "http://"+ server.getIp() +":"+ server.getPort()+"/"+server.getContextName()+"/" + server.getAudioName());
                            //json.put("url", "http://"+ server.getIp() +":"+ server.getPort()+"/" + server.getAudioName());
                            if(server != null && !StringUtils.isEmpty(server.getAudioName())) {
                                encoder.setUrl("http://" + server.getIp() + ":" + server.getPort() + "/" + server.getAudioName());
                            }
                            logger.info("json:" + encoder.toString());
                            client.session.getBasicRemote().sendObject(encoder);
                            isSendUsers.get(true).add(client.getUserId());
                            isSendUsers.get(false).remove(client.getUserId());
                        }
                    } catch (IOException | EncodeException e) {
                        logger.debug("错误: 消息发送失败!", e);
                        n_connect.remove(client);
                        try {
                            client.session.close();
                        } catch (IOException e1) {
                        }
                    }
                }
                saveNotifyMessage(isSendUsers,msg,notifyField.getId());
            }
        }
    }

    public void saveNotifyMessage(Map<Boolean, Set<String>> isSendUsers, String msg, String fieldId){
        for(Boolean readflag : isSendUsers.keySet()){
            this.saveNotifyMessage(isSendUsers.get(readflag),msg,fieldId,String.valueOf(readflag));
        }
    }

    private void saveNotifyMessage(Set<String> users, String msg, String fieldId, String isRead){
        springContext = WebApplicationContextUtils.getWebApplicationContext(application);
        if(springContext != null){
            notifyMessageService = (NotifyMessageService)springContext.getBean("NotifyMessageService");
        }else{
            logger.error("获取应用程序上下文失败!");
            return;
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(String readUser  : users){
            NotifyMessage readMessage = new NotifyMessage();
            readMessage.setId(snowflakeIdWorker().nextId() + "");
            readMessage.setFieldId(fieldId);
            readMessage.setIsRead(isRead);
            readMessage.setMessage(msg);
            readMessage.setUserId(readUser);
            readMessage.setCreateDate(simpleDateFormat.format(new Date()));
            notifyMessageService.saveNotifyMessage(readMessage);
        }

    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
