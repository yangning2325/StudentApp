package com.po;
/*老师类*/
import java.util.List;

public class Teacher {
    private int tea_id;  //id
    private String userName;  //账号
    private String password;  //密码
    private String teaNum;   //教工号
    private String teaName;  //姓名
    private String teaSex;   //性别
    private String teaCourse; //科目
    private String teaAddress; //地址
    private String teaPhone;  //电话
    private String teaEmail;  //邮箱
    private String teaQQ;    //qq
    private String teaMessage; //信息
    private Class classes;  //所教班级
    private Class examClass; //监考班级

    @Override
    public String toString() {
        return "Teacher{" +
                "tea_id=" + tea_id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", teaNum='" + teaNum + '\'' +
                ", teaName='" + teaName + '\'' +
                ", teaSex='" + teaSex + '\'' +
                ", teaCourse='" + teaCourse + '\'' +
                ", teaAddress='" + teaAddress + '\'' +
                ", teaPhone='" + teaPhone + '\'' +
                ", teaEmail='" + teaEmail + '\'' +
                ", teaQQ='" + teaQQ + '\'' +
                ", teaMessage='" + teaMessage + '\'' +
                ", classes=" + classes +
                ", examClass=" + examClass +
                '}';
    }

    public Class getExamClass() {
        return examClass;
    }

    public void setExamClass(Class examClass) {
        this.examClass = examClass;
    }

    public String getTeaEmail() {
        return teaEmail;
    }

    public void setTeaEmail(String teaEmail) {
        this.teaEmail = teaEmail;
    }

    public String getTeaQQ() {
        return teaQQ;
    }

    public void setTeaQQ(String teaQQ) {
        this.teaQQ = teaQQ;
    }

    public String getTeaMessage() {
        return teaMessage;
    }

    public void setTeaMessage(String teaMessage) {
        this.teaMessage = teaMessage;
    }

    public String getTeaCourse() {
        return teaCourse;
    }

    public void setTeaCourse(String teaCourse) {
        this.teaCourse = teaCourse;
    }

    public Class getClasses() {
        return classes;
    }

    public void setClasses(Class classes) {
        this.classes = classes;
    }


    public int getTea_id() {
        return tea_id;
    }

    public void setTea_id(int tea_id) {
        this.tea_id = tea_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTeaNum() {
        return teaNum;
    }

    public void setTeaNum(String teaNum) {
        this.teaNum = teaNum;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public String getTeaSex() {
        return teaSex;
    }

    public void setTeaSex(String teaSex) {
        this.teaSex = teaSex;
    }

    public String getTeaAddress() {
        return teaAddress;
    }

    public void setTeaAddress(String teaAddress) {
        this.teaAddress = teaAddress;
    }

    public String getTeaPhone() {
        return teaPhone;
    }

    public void setTeaPhone(String teaPhone) {
        this.teaPhone = teaPhone;
    }
}
