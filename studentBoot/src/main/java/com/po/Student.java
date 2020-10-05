package com.po;
/*学生类*/
import java.io.Serializable;
import java.util.List;

public class Student implements Serializable {

    private int stu_id;  //id
    private String userName;  //账号
    private String password; //密码
    private String stuName;  //姓名
    private String stuNum;  //学号
    private String stuSex; //性别
    private String stuBirth; //出生
    private String stuAddress;  //地址
    private String stuPhone;   //电话
    private String stuEmail; //邮箱
    private String stuQQ; //QQ
    private String message; //信息
    private Class classes; //班级
    private Grade grade; //成绩
    private List<Teacher> teachers; //授课老师
    private Class examClass; //考试班级
    private List<Teacher> examTeacher; //监考老师

    public List<Teacher> getExamTeacher() {
        return examTeacher;
    }

    public void setExamTeacher(List<Teacher> examTeacher) {
        this.examTeacher = examTeacher;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stu_id=" + stu_id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", stuName='" + stuName + '\'' +
                ", stuNum='" + stuNum + '\'' +
                ", stuSex='" + stuSex + '\'' +
                ", stuBirth='" + stuBirth + '\'' +
                ", stuAddress='" + stuAddress + '\'' +
                ", stuPhone='" + stuPhone + '\'' +
                ", stuEmail='" + stuEmail + '\'' +
                ", stuQQ='" + stuQQ + '\'' +
                ", message='" + message + '\'' +
                ", classes=" + classes +
                ", grade=" + grade +
                ", teachers=" + teachers +
                ", examClass=" + examClass +
                ", examTeacher=" + examTeacher +
                '}';
    }


    public Class getExamClass() {
        return examClass;
    }

    public void setExamClass(Class examClass) {
        this.examClass = examClass;
    }

/*    public Teacher getExamTeacher() {
        return examTeacher;
    }

    public void setExamTeacher(Teacher examTeacher) {
        this.examTeacher = examTeacher;
    }*/

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }


    public String getStuBirth() {
        return stuBirth;
    }

    public void setStuBirth(String stuBirth) {
        this.stuBirth = stuBirth;
    }

    public String getStuQQ() {
        return stuQQ;
    }

    public void setStuQQ(String stuQQ) {
        this.stuQQ = stuQQ;
    }

    public String getStuEmail() {
        return stuEmail;
    }

    public void setStuEmail(String stuEmail) {
        this.stuEmail = stuEmail;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStu_id() {
        return stu_id;
    }

    public void setStu_id(int stu_id) {
        this.stu_id = stu_id;
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

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuNum() {
        return stuNum;
    }

    public void setStuNum(String stuNum) {
        this.stuNum = stuNum;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuAddress() {
        return stuAddress;
    }

    public void setStuAddress(String stuAddress) {
        this.stuAddress = stuAddress;
    }

    public String getStuPhone() {
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }

    public Class getClasses() {
        return classes;
    }

    public void setClasses(Class classes) {
        this.classes = classes;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }

}