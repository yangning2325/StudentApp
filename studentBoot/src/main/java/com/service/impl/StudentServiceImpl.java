package com.service.impl;

import com.dao.StudentDao;
import com.po.*;
import com.po.Class;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    @Override
    public Student login(String userName, String password) {
        return this.studentDao.login(userName,password);
    }

    @Override
    public List<Student> findAll(Student student) {
        return this.studentDao.findAll(student);
    }

    @Override
    public void updateStudent(Student student) {
        this.studentDao.updateStudent(student);
    }


    @Override
    public List<Exam> findExams(Exam exam) {
        return this.studentDao.findExams(exam);
    }

    @Override
    public List<ExamRule> findExamRule(ExamRule examRule) {
        return this.studentDao.findExamRule(examRule);
    }


    @Override
    public List<CourseTable> findCourseTable(CourseTable table) {
        return this.studentDao.findCourseTable(table);
    }

    @Override
    public List<Student> findExamMessages(Student student) {
        return this.studentDao.findExamMessages(student);
    }

}
