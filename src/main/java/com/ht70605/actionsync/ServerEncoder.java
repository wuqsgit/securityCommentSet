package com.ht70605.actionsync;

import com.alibaba.fastjson.JSONObject;
import com.ht70605.entity.SendEntity;
import org.springframework.util.StringUtils;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

/**
 * Created by Administrator on 2017/8/15.
 */
public class ServerEncoder implements Encoder.Text<SendEntity>  {
    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void init(EndpointConfig arg0) {
        // TODO Auto-generated method stub

    }

    @Override
    public String encode(SendEntity message) throws EncodeException {
        try {
            //return Java2Json.JavaToJson(message, false);
            JSONObject json = new JSONObject();
            if(message != null && !StringUtils.isEmpty(message.getMessage())){
                json.put("message", message.getMessage());
            }

            if(message != null && !StringUtils.isEmpty(message.getUrl())){
                json.put("url", message.getUrl());
            }
            return  json.toJSONString();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }
}
