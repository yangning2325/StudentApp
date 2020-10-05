package com.service;

import com.po.*;
import com.po.Class;

import java.util.List;

public interface StudentService {
    /*登录*/
    public Student login(String userName, String password);
    /*查看所有学生信息*/
    public List<Student> findAll(Student student);
    /*修改个人信息*/
    public void updateStudent(Student student);
    /*查看考试科目*/
    public List<Exam> findExams(Exam exam);
    /*考试规则*/
    public List<ExamRule> findExamRule(ExamRule examRule);
    /*查询课程表*/
    public List<CourseTable> findCourseTable(CourseTable table);
    /*查看考试信息*/
    public List<Student> findExamMessages(Student student);

}
