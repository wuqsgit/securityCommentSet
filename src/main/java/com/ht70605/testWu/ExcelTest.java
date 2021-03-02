package com.ht70605.testWu;


import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by fz on 2017/9/6.
 */
public class ExcelTest {
    private static String name;
    public  void sayHello(){
        List<String> list1=new ArrayList<String>();
        Set set = new HashSet<>();
        list1.add("a1");
        list1.add("a2");
       // set.addAll(list1);
        List<String>list2=new ArrayList<>();
        list1.add("a2");
        list1.add("a4");
        //set.addAll(list1);

        String [] vv=new String[111];
        for(int i=0;i<list1.size();i++){
            int count=0;
            int ount=0;
            for(int j=0;j<list1.size();j++){
               if(list1.get(i).toString().equals(list1.get(j).toString())){
                   count++;
               }

            }
            if(count==2){
                set.add(list1.get(i).toString());
            }
            System.out.println("重复字符的个数" + count + "内容：" + list1.get(i).toString());
        }
        System.out.println("重复集合"+set);
        System.out.println(list1);
        list2.addAll(set);
        System.out.println(list2);
        list1.removeAll(list2);
        System.out.println(list1);
        System.err.print("hello"+name);
    }
    public static ExcelTest getInstance()throws Exception{
        ExcelTest object=(ExcelTest)Class.forName("com.ht70605.action.ExcelTest").newInstance();
        Method method=object.getClass().getMethod("sayHello",String.class);
        method.invoke(object,"傻妞");

        return object;
    }
    public static void main(String[] args)throws Exception {
        ExcelTest ts=new ExcelTest();
    }
}
