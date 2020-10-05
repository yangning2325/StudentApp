package com.service;

import com.po.Class;
import com.po.Grade;
import com.po.Student;
import com.po.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherService {
    /*老师登录*/
    public Teacher login(@Param("userName") String userName, @Param("password") String password);
    /*查看所有老师*/
    public List<Teacher> findAllTeacher(Teacher teacher);
    /*修改老师信息*/
    public void updateTeacher(Teacher teacher);
    /*查找老师考场*/
    public List<Teacher> finTeacherExam(Teacher teacher);
    /*查看班级学生*/
    public List<Student> findClassStu(Class c);
    /*查看学生成绩*/
    public List<Grade> findGrades(Grade grade);
    /*录入学生成绩*/
    public void updateGrades(Grade grade);
    /*清空学生成绩*/
    public void clearGrades();
}
