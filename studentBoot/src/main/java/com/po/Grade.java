package com.po;
/*成绩类*/
public class Grade {
    private int gra_id; //id
    private String stu_name; //学生姓名
    private String stu_Grade; //级部
    private String stu_Class; //班级
    private double gra_Chinese; //语文
    private double gra_Math; //数学
    private double gra_English; //英语
    private double allGrade; //总成绩

    @Override
    public String toString() {
        return "Grade{" +
                "gra_id=" + gra_id +
                ", stu_name='" + stu_name + '\'' +
                ", stu_Grade='" + stu_Grade + '\'' +
                ", stu_Class='" + stu_Class + '\'' +
                ", gra_Chinese=" + gra_Chinese +
                ", gra_Math=" + gra_Math +
                ", gra_English=" + gra_English +
                ", allGrade=" + allGrade +
                '}';
    }

    public int getGra_id() {
        return gra_id;
    }

    public void setGra_id(int gra_id) {
        this.gra_id = gra_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public String getStu_Grade() {
        return stu_Grade;
    }

    public void setStu_Grade(String stu_Grade) {
        this.stu_Grade = stu_Grade;
    }

    public String getStu_Class() {
        return stu_Class;
    }

    public void setStu_Class(String stu_Class) {
        this.stu_Class = stu_Class;
    }

    public double getGra_Chinese() {
        return gra_Chinese;
    }

    public void setGra_Chinese(double gra_Chinese) {
        this.gra_Chinese = gra_Chinese;
    }

    public double getGra_Math() {
        return gra_Math;
    }

    public void setGra_Math(double gra_Math) {
        this.gra_Math = gra_Math;
    }

    public double getGra_English() {
        return gra_English;
    }

    public void setGra_English(double gra_English) {
        this.gra_English = gra_English;
    }

    public double getAllGrade() {
        return allGrade;
    }

    public void setAllGrade(double allGrade) {
        this.allGrade = allGrade;
    }

}



