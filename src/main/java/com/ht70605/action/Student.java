package com.ht70605.action;

/**
 * Created by fz on 2017/9/21.
 */

import java.util.Date;

public class Student {

        private int id;

        private String name;

        private int age;

        private Date birth;

        public Student(){

        }

        public Student(int id, String name, int age, Date birth){
                this.id=id;
                this.name=name;
                this.age=age;
                this.birth=birth;
        }

        public String getName() {
                return name;
        }

        public Date getBirth() {
                return birth;
        }

        public int getAge() {
                return age;
        }

        public int getId() {
                return id;
        }

        public void setId(int id) {
                this.id = id;
        }

        public void setName(String name) {
                this.name = name;
        }

        public void setAge(int age) {
                this.age = age;
        }

        public void setBirth(Date birth) {
                this.birth = birth;
        }
}