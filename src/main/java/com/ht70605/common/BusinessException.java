package com.ht70605.common;

/**
 * Created by Administrator on 2017/8/23.
 */
public class BusinessException extends  Exception {

  public BusinessException(){
      super();
  }

    public BusinessException(String message){
        super(message);
    }
}
