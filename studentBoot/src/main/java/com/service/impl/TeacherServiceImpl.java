package com.service.impl;

import com.dao.TeacherDao;
import com.po.Class;
import com.po.Grade;
import com.po.Student;
import com.po.Teacher;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public Teacher login(String userName, String password) {
        return this.teacherDao.login(userName,password);
    }

    @Override
    public List<Teacher> findAllTeacher(Teacher teacher) {
        return this.teacherDao.findAllTeacher(teacher);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        this.teacherDao.updateTeacher(teacher);
    }

    @Override
    public List<Teacher> finTeacherExam(Teacher teacher) {
        return this.teacherDao.finTeacherExam(teacher);
    }

    @Override
    public List<Student> findClassStu(Class c) {
        return this.teacherDao.findClassStu(c);
    }

    @Override
    public List<Grade> findGrades(Grade grade) {
        return this.teacherDao.findGrades(grade);
    }

    @Override
    public void updateGrades(Grade grade) {
        this.teacherDao.updateGrades(grade);
    }

    @Override
    public void clearGrades() {
        this.teacherDao.clearGrades();
    }


}
