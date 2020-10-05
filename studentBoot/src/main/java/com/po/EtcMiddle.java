package com.po;

/**
 * 监考老师对应监考班级中间表
 */
public class EtcMiddle {
    private int id;
    private int tea_id; //监考老师id
    private int class_id; //监考班级 id

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTea_id() {
        return tea_id;
    }

    public void setTea_id(int tea_id) {
        this.tea_id = tea_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }
}
