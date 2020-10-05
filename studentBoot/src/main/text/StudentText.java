import com.po.*;
import com.po.Class;
import com.service.StudentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class StudentText {
    @Test
    public void findStudent() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);
        Student student = service.login("2020001", "123");
        if (null!=student) {
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败！");
        }
    }
    @Test
    public void fianAll() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);

        Student student = new Student();
     /*   student.setUserName("202002");
        student.setPassword("123");
        Student stu= service.findAll(student).get(0);
        List<Student> all = service.findAll(student);*/
        Class aClass = new Class();

        aClass.setGradeName("一年级");
        aClass.setClassName("2班");
        student.setClasses(aClass);
        List<Student> all = service.findAll(student);
        for (Student s:all) {
            System.out.println(s);
        }
        /*System.out.println(stu);*/
    }
    @Test
    public void updateStudent() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);
        Student student = new Student();
        student.setStu_id(1);
        student.setStuName("李四");
        student.setMessage("2222");
        System.out.println();

        student.setStuBirth("1998-09-01");
        student.setStuEmail("123");
        student.setStuPhone("2325");
        student.setPassword("321");
        service.updateStudent(student);
    }
    @Test
    public void findExams() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);
        List<Exam> exams = service.findExams(new Exam());
        for (Exam e:exams) {
            System.out.println(e);
        }
    }

    @Test
    public void findExamRule() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);
        List<ExamRule> rules = service.findExamRule(new ExamRule());
        for (ExamRule examRule:rules) {
            System.out.println(examRule);
        }
    }

    @Test
    public void findCourseTable() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);
        CourseTable courseTable = new CourseTable();
       courseTable.setClassNum(2);

        List<CourseTable> tables = service.findCourseTable(courseTable);
        for (CourseTable courseTable1: tables){
            System.out.println(courseTable1);
        }
    }

    @Test
    public void findStuExamMess() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService service = applicationContext.getBean(StudentService.class);

        List<Student> examMessage = service.findExamMessages(new Student());
        for (Student s:examMessage) {
            System.out.println(s);
        }
/*    student.setStu_id(30);
    if (!service.findExamMessage(student).isEmpty()) {
        Student student1 = service.findExamMessage(student).get(0);
        System.out.println(student1);
    }else {
    System.out.println("是");}*/
    }
}
