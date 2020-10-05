package com.controller;

import com.po.*;
import com.po.Class;
import com.service.AdminService;
import com.service.StudentService;
import com.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;

    /**
     * 教师登录
     * @param userName
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/checkTeaLogin")
    public String checkTeaLogin(String userName, String password, Model model, HttpSession session) {
        Teacher teacher = teacherService.login(userName, password);
        if (null == teacher) {
            model.addAttribute("msg", "账号或密码错误!");
            return "login";
        }
        /*查看老师信息*/
        Teacher teacher1 = teacherService.findAllTeacher(teacher).get(0);
        /*查看班级学生*/
        List<Student> students = teacherService.findClassStu(teacher1.getClasses());
        /*添加考试时间列表*/
        List<Exam> exams = studentService.findExams(new Exam());
        /*学生成绩*/
        List<Grade> grades = teacherService.findGrades(new Grade());
        /*查看教师考场列表*/
        if (!teacherService.finTeacherExam(teacher1).isEmpty()) {
            Teacher teacherExam = teacherService.finTeacherExam(teacher1).get(0);
            model.addAttribute("teacherExam",teacherExam);
        }
        session.setAttribute("TEACHER",teacher1);
        model.addAttribute("students",students);
        model.addAttribute("exams",exams);
        model.addAttribute("grades",grades);
        return "tea_main";
    }

    /**
     * 修改老师信息
     * @param teacher
     * @return
     */
    @RequestMapping("/updateTeaMessage")
    @ResponseBody
    public Boolean updateExamTime(@RequestBody Teacher teacher) {
        System.out.println(teacher);
        if (teacher==null) {
            return false;
        }
        teacherService.updateTeacher(teacher);
        return true;
    }

    /**
     * 修改教师密码
     * @param password
     * @param password1
     * @param request
     * @return
     */
    @RequestMapping("/updateTeaPw")
    @ResponseBody
    public boolean updateTeaPw(String password,String password1,HttpServletRequest request){
        Object o =request.getSession().getAttribute("TEACHER");
        if (o instanceof Teacher) {
            Teacher t=(Teacher)o;
            if (!t.getPassword().equals(password)) {
                return false;
            }
            t.setPassword(password1);
            teacherService.updateTeacher(t);
            return true;
        }
        return false;
    }
    /**
     * 查找课程表
     * @param request
     * @return
     */
    @RequestMapping("/findTeaCourseTable")
    @ResponseBody
    public List<CourseTable> findCourseTable (HttpServletRequest request) {
        Teacher t = (Teacher) request.getSession().getAttribute("TEACHER");
        Class aclass = t.getClasses();
        int class_id = aclass.getClass_id();
        CourseTable courseTable = new CourseTable();
        courseTable.setClassNum(class_id);

        List<CourseTable> tables = studentService.findCourseTable(courseTable);
        return tables;
    }

    /**
     * 对学生成绩录入
     */
    @RequestMapping("/updateStuGrades")
    @ResponseBody
    public boolean updateStuGrades(@RequestBody Grade grade) {
        System.out.println(grade);
        if (grade==null) {
            return false;
        }
        teacherService.updateGrades(grade);
        return true;
    }

    /**
     * 按条件查找学生成绩
     * @param grade
     * @return
     */
    @RequestMapping("/findStuGrade")
    @ResponseBody
    public List<Grade> findStuGrade(@RequestBody Grade grade) {
        System.out.println(grade);
        return teacherService.findGrades(grade);
    }

    /**
     * 查看某一个学生成绩
     * @param gra_id
     * @return
     */
    @RequestMapping("/findOneStuGra")
    @ResponseBody
    public Grade findOneStuGra(int gra_id) {
        Grade grade = new Grade();
        grade.setGra_id(gra_id);
        return teacherService.findGrades(grade).get(0);
    }

    /**
     * 清空成绩
     */
    @RequestMapping("/clearGrades")
    @ResponseBody
    public boolean clearGrades() {
        teacherService.clearGrades();
        return true;
    }
}

