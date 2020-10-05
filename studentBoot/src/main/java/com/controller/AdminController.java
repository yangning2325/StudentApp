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

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    /**
     * 管理员登录
     *
     * @param userName 用户名
     * @param password 密码
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/checkAdmLogin")
    public String checkAdmLogin(String userName, String password, Model model, HttpSession session) {
        Admin admin = adminService.login(userName, password);
        if (null == admin) {
            model.addAttribute("msg", "账号或密码错误!");
            return "login";
        }
        /*添加学生列表*/
        List<Student> students = studentService.findAll(new Student());
        /*添加老师列表*/
        List<Teacher> teachers = teacherService.findAllTeacher(new Teacher());
        /*添加课程表*/
        List<CourseTable> tables = studentService.findCourseTable(new CourseTable());
        /*添加考试规则*/
        List<ExamRule> rule = studentService.findExamRule(new ExamRule());
        /*添加考生考场列表*/
        List<Student> examMessages = studentService.findExamMessages(new Student());
        /*添加教师考场列表*/
        List<Teacher> teacherExam = teacherService.finTeacherExam(new Teacher());
        /*添加考试时间列表*/
        List<Exam> exams = studentService.findExams(new Exam());
        /*添加通知列表*/
        List<SchoolAdvice> advice = adminService.findAllAdvice(new SchoolAdvice());

        session.setAttribute("ADMIN", admin);
        model.addAttribute("students", students);
        model.addAttribute("teachers", teachers);
        model.addAttribute("tables",tables);
        model.addAttribute("admin", admin);
        model.addAttribute("rule", rule);
        model.addAttribute("examMessages",examMessages);
        model.addAttribute("teacherExam",teacherExam);
        model.addAttribute("exams",exams);
        model.addAttribute("advice",advice);

        return "admin_main";
    }

    /**修改学生信息
     * @param stuId     学生id
     * @param userName  用户名
     * @param stuName   学生姓名
     * @param stuNum    学号
     * @param gradeName 级部
     * @param className 班级
     * @param stuSex    性别
     * @param stuBirth  出生日期
     * @return
     */
    @RequestMapping("/adminUpdateStu")
    @ResponseBody
    public boolean adminUpdateStu(int stuId, String userName, String stuName,
                                  String stuNum, String gradeName,
                                  String className, String stuSex, String stuBirth) {
        if (stuId == 0) {
            return false;
        }
        Student student = new Student();
        student.setStu_id(stuId);
        student.setStuName(stuName);
        student.setUserName(userName);
        student.setStuNum(stuNum);
        student.setStuSex(stuSex);
        student.setStuBirth(stuBirth);
        /*完成学习信息修改*/
        studentService.updateStudent(student);
        Class aClass = new Class();
        aClass.setClassName(className);
        aClass.setGradeName(gradeName);
        if (adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        Class aClass1 = adminService.findClass(aClass).get(0);
        int class_id = aClass1.getClass_id();
        Middle middle = new Middle();
        middle.setStu_id(stuId);
        middle.setClass_id(class_id);
        /*完成学生班级修改*/
        adminService.updateMiddle(middle);
        Grade grade = new Grade();
        grade.setGra_id(stuId);
        grade.setStu_name(stuName);
        grade.setStu_Grade(gradeName);
        grade.setStu_Class(className);
        /*完成学生成绩表信息修改*/
        adminService.updateGradeStuMes(grade);
        return true;
    }

    /**
     * 通过学生id删除学生
     *
     * @param stuId
     * @return
     */
    @RequestMapping("/adminDeleteStu")
    @ResponseBody
    public boolean deleteStu(int stuId) {
        if (stuId != 0) {
            adminService.deleteStudent(stuId);
            return true;
        }
        return false;
    }

    /**
     * 通过学生id查看学生信息
     *
     * @param stuId
     * @return
     */
    @RequestMapping("/adminFindStu")
    @ResponseBody
    public Student adminFindStu(int stuId) {
        Student student = new Student();
        student.setStu_id(stuId);

        Student student1 = studentService.findAll(student).get(0);
        return student1;
    }

    /**
     * 返回级部和班级列表
     *
     * @return
     */
    @RequestMapping("/adminFindClass")
    @ResponseBody
    public List<Class> adminFindClass() {
        List<Class> aClass = adminService.findClass(new Class());
        return aClass;
    }

    /**
     * 添加学生
     *
     * @param userName
     * @param stuName
     * @param stuNum
     * @param gradeName
     * @param className
     * @param stuSex
     * @param stuBirth
     * @return
     */
    @RequestMapping("/adminAddStu")
    @ResponseBody
    public boolean addStu(Integer stu_id, String userName, String password, String stuName,
                          String stuNum, String gradeName,
                          String className, String stuSex, String stuBirth) {
        Student student = new Student();
        student.setStu_id(stu_id);
        /*查看是否存在相同学生id*/
        if (!studentService.findAll(student).isEmpty()) {
            return false;
        }
        student.setUserName(userName);
        student.setPassword(password);
        student.setStuName(stuName);
        student.setStuNum(stuNum);
        student.setStuSex(stuSex);
        student.setStuBirth(stuBirth);
        adminService.addStu(student);
        Class aClass = new Class();
        aClass.setClassName(className);
        aClass.setGradeName(gradeName);
        if (adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        Class aClass1 = adminService.findClass(aClass).get(0);
        int class_id = aClass1.getClass_id();
        Middle middle = new Middle();
        middle.setClass_id(class_id);
        middle.setStu_id(stu_id);
        /*添加班级*/
        adminService.addStuClass(middle);
        Grade grade = new Grade();
        grade.setGra_id(stu_id);
        grade.setStu_name(stuName);
        grade.setStu_Class(className);
        grade.setStu_Grade(gradeName);
        /*成绩表添加学生*/
        adminService.addStuGradeMes(grade);
        return true;
    }

    /**
     * 修改老师信息
     * @param teaId
     * @param userName
     * @param teaName
     * @param teaNum
     * @param gradeName
     * @param className
     * @param teaSex
     * @param teaCourse
     * @return
     */
    @RequestMapping("/adminUpdateTea")
    @ResponseBody
    public boolean adminUpdateTea(int teaId, String userName, String teaName,
                                  String teaNum, String gradeName,
                                  String className, String teaSex, String teaCourse) {
        if (teaId == 0) {
            return false;
        }
        Teacher teacher = new Teacher();
        teacher.setTea_id(teaId);
        teacher.setTeaName(teaName);

        teacher.setTeaNum(teaNum);
        teacher.setUserName(userName);
        teacher.setTeaSex(teaSex);
        teacher.setTeaCourse(teaCourse);
        teacherService.updateTeacher(teacher);

        Class aClass = new Class();
        aClass.setClassName(className);
        aClass.setGradeName(gradeName);
        if (adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        Class aClass1 = adminService.findClass(aClass).get(0);
        int class_id = aClass1.getClass_id();
        TeaMiddle teaMiddle = new TeaMiddle();
        teaMiddle.setTea_id(teaId);
        teaMiddle.setClass_id(class_id);
        /*完成老师班级修改*/
        adminService.updateTeaMiddle(teaMiddle);
        return true;
    }

    /**
     * 查找老师信息
     * @param teaId
     * @return
     */
    @RequestMapping("/adminFindTea")
    @ResponseBody
    public Teacher adminFindTea(int teaId) {
        Teacher teacher = new Teacher();
        teacher.setTea_id(teaId);
        Teacher teacher1 = teacherService.findAllTeacher(teacher).get(0);
        return teacher1;
    }

    /**
     * 通过老师id删除老师
     * @param teaId
     * @return
     */
    @RequestMapping("/adminDeleteTea")
    @ResponseBody
    public boolean deleteTea(int teaId) {
        if (teaId != 0) {
            adminService.deleteTeacher(teaId);
            return true;
        }
        return false;
    }

    /**
     * 添加老师
     * @param tea_id //id
     * @param userName //账号
     * @param password //密码
     * @param teaName //教师名字
     * @param teaNum //教职工号
     * @param gradeName //级部名
     * @param className //班级名
     * @param teaSex //性别
     * @param teaCourse //所授科目
     * @return
     */
    @RequestMapping("/adminAddTea")
    @ResponseBody
    public boolean addTea(Integer tea_id, String userName, String password, String teaName,
                          String teaNum, String gradeName,
                          String className, String teaSex, String teaCourse) {

        Teacher teacher = new Teacher();
        teacher.setTea_id(tea_id);
        /*检查是否存在相同老师id*/
        if (!teacherService.findAllTeacher(teacher).isEmpty()) {
            return false;
        }
        teacher.setUserName(userName);
        teacher.setPassword(password);
        teacher.setTeaName(teaName);
        teacher.setTeaNum(teaNum);
        teacher.setTeaSex(teaSex);
        teacher.setTeaCourse(teaCourse);
        adminService.addTea(teacher);
        Class aClass = new Class();
        aClass.setClassName(className);
        aClass.setGradeName(gradeName);
        if (adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        Class aClass1 = adminService.findClass(aClass).get(0);
        int class_id = aClass1.getClass_id();
        TeaMiddle teaMiddle = new TeaMiddle();
        teaMiddle.setTea_id(tea_id);
        teaMiddle.setClass_id(class_id);
        adminService.addTeaClass(teaMiddle);
        return true;
    }

    /**
     * 修改课程表
     * @param courseTable
     * @return
     */
    @RequestMapping("/updateCourseTab")
    @ResponseBody
    public boolean updateCourseTab(@RequestBody CourseTable courseTable) {
        if (courseTable != null) {
            adminService.updateCourseTable(courseTable);
            return true;
        }
        return false;
    }

    /**
     * 通过id查找课程表
     * @param id
     * @return
     */
    @RequestMapping("/findOneCourseTab")
    @ResponseBody
    public CourseTable findOneCourseTab(int id) {
        CourseTable table = new CourseTable();
        table.setId(id);
        CourseTable table1 = studentService.findCourseTable(table).get(0);
        return table1;
    }

    /**
     * 通过id查看考试规则
     * @param id
     * @return
     */
    @RequestMapping("/findEXamRuler")
    @ResponseBody
    public ExamRule findEXamRuler(int id) {

        ExamRule rule = new ExamRule();
        rule.setId(id);
        ExamRule examRule = studentService.findExamRule(rule).get(0);
        return examRule;
    }

    /**
     * 修改考试规则
     * @param examRule
     * @return
     */
    @RequestMapping("/UpdateEXamRuler")
    @ResponseBody
    public Boolean UpdateEXamRuler(@RequestBody ExamRule examRule) {
        if (examRule==null) {
            return false;
        }
            adminService.updateExamsRule(examRule);
        return true;
    }

    /**
     * 通过id删除考试规则
     * @param id
     * @return
     */
    @RequestMapping("/DeleteEXamRuler")
    @ResponseBody
    public Boolean DeleteEXamRuler(int id) {
        if (id==0) {
            return false;
        }

        adminService.deleteExamRuler(id);
        return true;
    }

    /**
     * 添加考试规则
     * @param message
     * @return
     */
    @RequestMapping("/addEXamRuler")
    @ResponseBody
    public Boolean addEXamRuler(String message) {
        System.out.println(message);
        if (message==null) {
            return false;
        }
        ExamRule examRule = new ExamRule();
        examRule.setMessage(message);
        adminService.addExamRuler(examRule);
        return true;
    }

    /**
     * 修改考生考场
     * @param stuId
     * @param gradeName
     * @param className
     * @return
     */
    @RequestMapping("/updateEXamStu")
    @ResponseBody
    public Boolean updateEXamStu(int stuId, String gradeName,
                                   String className) {
        System.out.println(stuId);
        System.out.println(gradeName);
        System.out.println(className);
        Class aClass = new Class();
        aClass.setClassName(className);
        aClass.setGradeName(gradeName);
        if (adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        int class_id = adminService.findClass(aClass).get(0).getClass_id();
        EscMiddle middle = new EscMiddle();
        middle.setClass_id(class_id);
        middle.setStu_id(stuId);
        adminService.updateStuExam(middle);
        return true;
    }

    /**
     * 添加考生
     * @param stuName
     * @param gradeName
     * @param className
     * @return
     */
    @RequestMapping("/addEXamStu")
    @ResponseBody
    public Boolean addEXamStu(String stuName, String gradeName,String className) {
        System.out.println(stuName);
        System.out.println(gradeName);
        System.out.println(className);
        /*通过考生名字产找学生id*/
        Student student = new Student();
        student.setStuName(stuName);
        if (studentService.findAll(student).isEmpty()) {
            return false;
        }
        int stu_id = studentService.findAll(student).get(0).getStu_id();
        /*通过班级名查找班级id*/
        Class aClass = new Class();
        aClass.setGradeName(gradeName);
        aClass.setClassName(className);
        if ( adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        int class_id = adminService.findClass(aClass).get(0).getClass_id();
        /*将所查id插入中间表*/
        EscMiddle escMiddle = new EscMiddle();
        escMiddle.setStu_id(stu_id);
        escMiddle.setClass_id(class_id);
        adminService.addStuExam(escMiddle);
        return true;
    }

    /**
     * 查找没有参加考试的学生
     * @return
     */
    @RequestMapping("/findNotExamStu")
    @ResponseBody
    public List<Student> findNotExamStu() {
        List<Student> students = adminService.findNotExamStu();
        return students;
    }

    /**
     * 查找没有监考的老师
     * @return
     */
    @RequestMapping("/findNotExamTea")
    @ResponseBody
    public List<Teacher> findNotExamTea() {
        return adminService.findNotExamTea();
    }

    /**
     * 添加监考老师
     * @param teaName
     * @param gradeName
     * @param className
     * @return
     */
    @RequestMapping("/addEXamTea")
    @ResponseBody
    public Boolean addEXamTea(String teaName, String gradeName,String className) {
        System.out.println(teaName);
        System.out.println(gradeName);
        System.out.println(className);
        /*通过教师名字查找id*/
        Teacher teacher = new Teacher();
        teacher.setTeaName(teaName);
        if (teacherService.findAllTeacher(teacher).isEmpty()) {
            return false;
        }
        int tea_id = teacherService.findAllTeacher(teacher).get(0).getTea_id();
        /*通过班级名查找班级id*/
        Class aClass = new Class();
        aClass.setGradeName(gradeName);
        aClass.setClassName(className);
        if ( adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        int class_id = adminService.findClass(aClass).get(0).getClass_id();
        /*将所查id插入中间表*/
        EtcMiddle etcMiddle = new EtcMiddle();
        etcMiddle.setTea_id(tea_id);
        etcMiddle.setClass_id(class_id);
        adminService.addTeaExam(etcMiddle);
        return true;
    }

    /**
     * 修改教师考场
     * @param teaId
     * @param gradeName
     * @param className
     * @return
     */
    @RequestMapping("/updateEXamTea")
    @ResponseBody
    public Boolean updateEXamTea(int teaId, String gradeName,
                                 String className) {
        System.out.println(teaId);
        System.out.println(gradeName);
        System.out.println(className);
        Class aClass = new Class();
        aClass.setClassName(className);
        aClass.setGradeName(gradeName);
        if (adminService.findClass(aClass).isEmpty()) {
            return false;
        }
        int class_id = adminService.findClass(aClass).get(0).getClass_id();
        EtcMiddle middle = new EtcMiddle();
        middle.setClass_id(class_id);
        middle.setTea_id(teaId);
        adminService.updateTeaExam(middle);
        return true;
    }

    /**
     * 通过老师id删除老师
     * @param teaId
     * @return
     */
    @RequestMapping("/adminDeleteTeaExam")
    @ResponseBody
    public boolean deleteExamTea(int teaId) {
        if (teaId == 0) {
            return false;
        }
        adminService.deleteTeaExam(teaId);
        return true;

    }

    /**
     * 修改考试时间
     * @param exam
     * @return
     */
    @RequestMapping("/updateExamTime")
    @ResponseBody
    public Boolean updateExamTime(@RequestBody Exam exam) {
        if (exam==null) {
            return false;
        }
        System.out.println(exam);
        adminService.updateExams(exam);
        return true;
    }

    /**
     * 修改个人信息
     * @param admin
     * @return
     */
    @RequestMapping("/updateOwn")
    @ResponseBody
    public Boolean updateOwn(@RequestBody Admin admin) {
        if (admin==null) {
            return false;
        }
        System.out.println(admin);
        adminService.updateAdmin(admin);
        return true;
    }

    /**
     * 添加通知
     * @param advice
     * @return
     */
    @RequestMapping("/addAdvice")
    @ResponseBody
    public Boolean addAdvice(@RequestBody SchoolAdvice advice) {
        if (advice==null) {
            return false;
        }
        adminService.addAdvice(advice);
        return true;
    }

    /**
     * 删除通知
     * @param id
     * @return
     */
    @RequestMapping("/deleteAdvice")
    @ResponseBody
    public boolean deleteAdvice(int id) {
        if (id == 0) {
            return false;
        }
        adminService.deleteAdvice(id);
        return true;
    }
}
