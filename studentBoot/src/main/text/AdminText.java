import com.po.*;
import com.po.Class;
import com.service.AdminService;
import com.service.StudentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class AdminText {

    @Test
    public void findStudent() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService service = applicationContext.getBean(AdminService.class);
        Admin admin = service.login("1000", "123");
        if (null!=admin) {
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败！");
        }
    }
    @Test
    public void updateStuClass(){
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        StudentService studentService = applicationContext.getBean(StudentService.class);
        Student student = new Student();
        student.setStu_id(1);
        Middle middle = new Middle();
        middle.setStu_id(1);
        middle.setClass_id(3);
        adminService.updateMiddle(middle);
    }
    @Test
    public void deleteStu() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        adminService.deleteStudent(15);
    }
    @Test
    public void findClass() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        Class aClass = new Class();
        aClass.setGradeName("一年级");
        aClass.setClassName("2班");
        Class aClass2 = adminService.findClass(aClass).get(0);
        System.out.println(aClass2);

/*        List<Class> aClass1 = adminService.findClass(aClass);
        for (Class c:aClass1){
            System.out.println(c);
        }*/
    }
    @Test
    public void addStuClass(){
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        Middle middle = new Middle();
        middle.setStu_id(30);
        middle.setClass_id(3);
        adminService.addStuClass(middle);
    }
    @Test
    public void findNotExamStu() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        List<Student> students = adminService.findNotExamStu();
        for (Student s:students) {
            System.out.println(s);
        }
    }
    @Test
    public void findNotExamTea() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        List<Teacher> teachers = adminService.findNotExamTea();
        for (Teacher t:teachers) {
            System.out.println(t);
        }
    }
    @Test
    public void addStuGradeMes() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        Grade grade = new Grade();
        grade.setGra_id(36);
        grade.setStu_name("hhhh");
        grade.setStu_Grade("1");
        grade.setStu_Class("2");

        adminService.addStuGradeMes(grade);
    }

    @Test
    public void updateGradeStuMes() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminService = applicationContext.getBean(AdminService.class);
        Grade grade = new Grade();
        grade.setGra_id(1);
        grade.setStu_name("hhhh");
        grade.setStu_Grade("1");
        grade.setStu_Class("2");

        adminService.updateGradeStuMes(grade);
    }
}
