package com.ht70605.action;

import com.ht70605.testWu.Say;
import com.ht70605.testWu.SayImpl;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Created by fz on 2017/9/6.
 */
public class JDKAndCglibProxy implements InvocationHandler  {
    private Object object1=null;
    public Object bind(Object object){
        this.object1=object;

        return Proxy.newProxyInstance(object.getClass().getClassLoader(),object.getClass().getInterfaces(),this);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object object=method.invoke(object1,args);
        System.out.println("代理完毕返回值："+object);
        return object;
    }

    public static void main(String[] args) {
        JDKAndCglibProxy jdkAndCglibProxy=new JDKAndCglibProxy();
        Say say=(Say)jdkAndCglibProxy.bind(new SayImpl());
        say.saySth();
    }
}
