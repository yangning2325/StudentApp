package com.po;

/**
 * 老师与班级中间表类
 */
public class TeaMiddle {
    private int id;
    private int tea_id; //老师id；
    private int class_id; //班级id；

    @Override
    public String toString() {
        return "TeaMiddle{" +
                "id=" + id +
                ", tea_id=" + tea_id +
                ", class_id=" + class_id +
                '}';
    }

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
