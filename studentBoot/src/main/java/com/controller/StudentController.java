package com.controller;

import com.po.*;
import com.po.Class;
import com.service.AdminService;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学生控制层
 */
@Controller
public class StudentController {
    @Autowired
    private StudentService service;
    @Autowired
   private AdminService adminService;

    /**
     * 用户登录
     * @param userName 用户名
     * @param password 密码
     * @param model
     * @param session session 对象
     * @return
     */
    @RequestMapping("/checkStuLogin")
    public String checkStuLogin(String userName, String password, Model model, HttpSession session) {
        Student student = service.login(userName, password);

        if (null==student) {
            model.addAttribute("msg","账号或密码错误!");
            return "login";
        }
        Student stu= service.findAll(student).get(0);
        /*注入考试信息*/
        if (!service.findExamMessages(stu).isEmpty()) {
            Student student1 = service.findExamMessages(stu).get(0);
            model.addAttribute("stuExam",student1);
        }

        List<Exam> exams = service.findExams(new Exam());
        session.setAttribute("STUDENT",stu);
        model.addAttribute("stu",stu);
        model.addAttribute("exam",exams);
        System.out.println("成功");
        return "stu_main";
    }

    /**
     * 密码修改
     * @param password 原密码
     * @param password1 新密码
     * @param request 获取session
     * @return
     */
    @RequestMapping("/checkStuPw")
    @ResponseBody
    public boolean updateStuPw(String password,String password1,HttpServletRequest request){
        Object o =request.getSession().getAttribute("STUDENT");
        if (o instanceof Student) {
            Student s=(Student)o;
            if (!s.getPassword().equals(password)) {
                return false;
            }
            s.setPassword(password1);
            service.updateStudent(s);
            return true;
        }
        return false;
    }

    /**
     * 获取学生信息
     * @param request 获取当前session对象
     * @return
     */
    @RequestMapping("/getStuMessage")
    @ResponseBody
    public Student getStuMessage(HttpServletRequest request) {
       Student s = (Student) request.getSession().getAttribute("STUDENT");
            return s;
    }

    /**
     * 获取学生所在班级
     * @param request
     * @return
     */
    @RequestMapping("/getStuClass")
    @ResponseBody
    public Class getStuClass(HttpServletRequest request) {
        Student s = (Student) request.getSession().getAttribute("STUDENT");
        Class classes = s.getClasses();
        System.out.println(classes);
        return classes;
    }

    /**
     * 获取学生成绩
     * @param request
     * @return
     */
    @RequestMapping("/getStuGrade")
    @ResponseBody
    public Grade getStuGrade(HttpServletRequest request) {
        Student s = (Student) request.getSession().getAttribute("STUDENT");
        Grade grade = s.getGrade();
        System.out.println(s);
        System.out.println(grade);
        return grade;
    }

    /**
     * 修改学生信息
     * @param stuAddress 地址
     * @param stuPhone 电话
     * @param stuEmail 邮箱
     * @param stuQQ qq
     * @param request
     * @return
     */
    @RequestMapping("/updateStuMessage")
    @ResponseBody
    public boolean updateStuMessage(String stuAddress, String stuPhone, String stuEmail,
                                    String stuQQ,HttpServletRequest request) {
        Student s = (Student) request.getSession().getAttribute("STUDENT");
        if(s!=null){
            s.setStuAddress(stuAddress);
            s.setStuQQ(stuQQ);
            s.setStuPhone(stuPhone);
            s.setStuEmail(stuEmail);
            service.updateStudent(s);
            System.out.println("修改信息成功！");
            return true;
        }
        return false;
    }

    /**
     * 获取老师信息
     * @param request
     * @return
     */
    @RequestMapping("/getStuTeachers")
    @ResponseBody
    public List<Teacher> getStuTeachers(HttpServletRequest request) {
        Student s = (Student) request.getSession().getAttribute("STUDENT");
        List<Teacher> teachers = s.getTeachers();
        for (Teacher t:teachers) {
            System.out.println(t);
        }
        return teachers;
    }

    /**
     * 获取考试规则
     * @return
     */
    @RequestMapping("/getExamRule")
    @ResponseBody
    public List<ExamRule> getExamRule() {
        List<ExamRule> rules = service.findExamRule(new ExamRule());
        return rules;
    }

    /**
     * 查找课程表
     * @param request
     * @return
     */
    @RequestMapping("/findCourseTable")
    @ResponseBody
    public List<CourseTable> findCourseTable (HttpServletRequest request) {
        Student s = (Student) request.getSession().getAttribute("STUDENT");
        Class aclass = s.getClasses();
        int class_id = aclass.getClass_id();
        CourseTable courseTable = new CourseTable();
        courseTable.setClassNum(class_id);

        List<CourseTable> tables = service.findCourseTable(courseTable);
        return tables;
    }
    @RequestMapping("/findSchoolAdv")
    @ResponseBody
    public List<SchoolAdvice> findSchoolAdv() {

        return adminService.findAllAdvice(new SchoolAdvice());
    }

}


