package com.ht70605.common;

/**
 * Created by Administrator on 2017/8/22.
 */

import com.ht70605.entity.MenuEnum;
import com.ht70605.entity.OperationEnum;

import java.lang.annotation.*;

@Target(value = ElementType.METHOD)
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
public @interface LoggingRecord {

    String[] param() ;

    Class[] classType();

    MenuEnum menu();//目录

    OperationEnum operation() ;//操作

    String info() default "";//备注
}
