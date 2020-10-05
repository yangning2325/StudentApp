package com.po;
/*学生与班级中间类*/
public class Middle {
    private int id;
    private int stu_id;//学生id
    private int class_id; //班级id

    @Override
    public String toString() {
        return "Middle{" +
                "id=" + id +
                ", stu_id=" + stu_id +
                ", class_id=" + class_id +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }
}
