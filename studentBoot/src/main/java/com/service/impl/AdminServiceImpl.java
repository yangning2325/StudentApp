package com.service.impl;

import com.dao.AdminDao;
import com.po.*;
import com.po.Class;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public Admin login(String userName, String password) {
        return this.adminDao.login(userName,password);
    }

    @Override
    public void updateAdmin(Admin admin) {
        this.adminDao.updateAdmin(admin);
    }

    @Override
    public void updateMiddle(Middle middle) {
        this.adminDao.updateMiddle(middle);
    }


    @Override
    public void deleteStudent(Integer stu_id) {
        this.adminDao.deleteStudent(stu_id);
    }

    @Override
    public List<Class> findClass(Class classes) {
        return this.adminDao.findClass(classes);
    }

    @Override
    public void addStu(Student student) {
        this.adminDao.addStu(student);
    }

    @Override
    public void addStuClass(Middle middle) {
        this.adminDao.addStuClass(middle);
    }

    @Override
    public void addStuGradeMes(Grade grade) {
        this.adminDao.addStuGradeMes(grade);
    }

    @Override
    public void updateGradeStuMes(Grade grade) {
        this.adminDao.updateGradeStuMes(grade);
    }

    @Override
    public void updateTeaMiddle(TeaMiddle teaMiddle) {
        this.adminDao.updateTeaMiddle(teaMiddle);
    }

    @Override
    public void deleteTeacher(Integer tea_id) {
        this.adminDao.deleteTeacher(tea_id);
    }

    @Override
    public void addTea(Teacher teacher) {
        this.adminDao.addTea(teacher);
    }

    @Override
    public void addTeaClass(TeaMiddle teaMiddle) {
        this.adminDao.addTeaClass(teaMiddle);
    }

    @Override
    public void updateCourseTable(CourseTable table) {
        this.adminDao.updateCourseTable(table);
    }

    @Override
    public void updateExamsRule(ExamRule rule) {
        this.adminDao.updateExamsRule(rule);
    }

    @Override
    public void deleteExamRuler(int id) {
        this.adminDao.deleteExamRuler(id);
    }

    @Override
    public void addExamRuler(ExamRule rule) {
        this.adminDao.addExamRuler(rule);
    }

    @Override
    public void addStuExam(EscMiddle middle) {
        this.adminDao.addStuExam(middle);
    }

    @Override
    public void updateStuExam(EscMiddle middle) {
        this.adminDao.updateStuExam(middle);
    }

    @Override
    public void updateTeaExam(EtcMiddle middle) {
        this.adminDao.updateTeaExam(middle);
    }

    @Override
    public void addTeaExam(EtcMiddle middle) {
        this.adminDao.addTeaExam(middle);
    }

    @Override
    public void deleteTeaExam(int tea_id) {
        this.adminDao.deleteTeaExam(tea_id);
    }

    @Override
    public List<Student> findNotExamStu() {
        return this.adminDao.findNotExamStu();
    }

    @Override
    public List<Teacher> findNotExamTea() {
        return this.adminDao.findNotExamTea();
    }

    @Override
    public void updateExams(Exam exam) {
        this.adminDao.updateExams(exam);
    }

    @Override
    public void addAdvice(SchoolAdvice advice) {
        this.adminDao.addAdvice(advice);
    }
    @Override
    public List<SchoolAdvice> findAllAdvice(SchoolAdvice advice) {
        return this.adminDao.findAllAdvice(advice);
    }

    @Override
    public void deleteAdvice(int id) {
        this.adminDao.deleteAdvice(id);
    }


}
