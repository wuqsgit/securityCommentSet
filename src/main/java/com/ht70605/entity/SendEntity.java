package com.ht70605.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/8/15.
 */
public class SendEntity implements Serializable {

    private static final long serialVersionUID = -6451812593150428369L;

    private String message;

    private String url;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "SendEntity [message=" + message + ", url=" + url
        + "]";
    }

}
