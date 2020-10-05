package com.service;

import com.po.*;
import com.po.Class;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {
    /*登录*/
    public Admin login(@Param("userName") String userName, @Param("password") String password);
    /*修改个人信息*/
    public void updateAdmin(Admin admin);
    /*修改学生班级信息*/
    public void updateMiddle(Middle middle);
    /*删除学生信息*/
    public void deleteStudent(Integer stu_id);
    /*查找班级*/
    public List<Class> findClass(Class classes);
    /*添加学生*/
    public void addStu(Student student);
    /*添加学生班级*/
    public void addStuClass(Middle middle);
    /*成绩表添加学生*/
    public void addStuGradeMes(Grade grade);
    /*成绩表修改学生信息*/
    public void updateGradeStuMes(Grade grade);
    /*修改老师班级信息*/
    public void updateTeaMiddle(TeaMiddle teaMiddle);
    /*删除老师信息*/
    public void deleteTeacher(Integer tea_id);
    /*添加老师*/
    public void addTea(Teacher teacher);
    /*添加老师班级*/
    public void addTeaClass(TeaMiddle teaMiddle);
    /*修改课程表*/
    public void updateCourseTable(CourseTable table);
    /*修改考试规则*/
    public void updateExamsRule(ExamRule rule);
    /*删除考试规则*/
    public void deleteExamRuler(int id);
    /*添加考试规则*/
    public void addExamRuler(ExamRule rule);
    /*添加考生*/
    public void addStuExam(EscMiddle middle);
    /*修改考生考场*/
    public void updateStuExam(EscMiddle middle);
    /*修改老师考场*/
    public void updateTeaExam(EtcMiddle middle);
    /*添加监考老师*/
    public void addTeaExam(EtcMiddle middle);
    /*删除监考老师*/
    public void deleteTeaExam(int tea_id);
    /*查找不在考试的考生*/
    public List<Student> findNotExamStu();
    /*查找没有监考的老师*/
    public List<Teacher> findNotExamTea();
    /*修改考试时间*/
    public void updateExams(Exam exam);
    /*添加通知*/
    public void addAdvice(SchoolAdvice advice);
    /*查找所有通知*/
    public List<SchoolAdvice> findAllAdvice(SchoolAdvice advice);
    /*删除通知*/
    public void deleteAdvice(int id);
}
