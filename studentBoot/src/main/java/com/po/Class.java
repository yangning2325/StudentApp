package com.po;

import java.util.List;
/*班级类*/
public class Class {
    private int class_id; //id
    private String gradeName; //级部
    private String className;  //班级名
    private List<Student> students;  //班级学生

    @Override
    public String toString() {
        return "Class{" +
                "class_id=" + class_id +
                ", gradeName='" + gradeName + '\'' +
                ", className='" + className + '\'' +
                ", students=" + students +
                '}';
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}
