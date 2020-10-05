import com.po.Class;
import com.po.Grade;
import com.po.Student;
import com.po.Teacher;
import com.service.TeacherService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TeacherText {
    @Test
    public void findAllTeacher() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService service = applicationContext.getBean(TeacherService.class);
        Teacher teacher = new Teacher();
        teacher.setTea_id(2);
        Teacher teacher1 = service.findAllTeacher(teacher).get(0);
        System.out.println(teacher1);
    }

    @Test
    public void findTeacherExam() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService service = applicationContext.getBean(TeacherService.class);
        Teacher teacher = new Teacher();
        /*teacher.setTea_id(2);*/
        List<Teacher> teachers = service.finTeacherExam(teacher);
        for (Teacher t:teachers) {
            System.out.println(t);
        }
    }

    @Test
    public void findClassStu() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService service = applicationContext.getBean(TeacherService.class);
        Class c =new Class();
        c.setGradeName("一年级");
        c.setClassName("1班");
        List<Student> students = service.findClassStu(c);
        for (Student sm:students) {
            System.out.println(sm);
        }
    }
    @Test
    public void findGrades() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService service = applicationContext.getBean(TeacherService.class);
        Grade grade = new Grade();
        grade.setStu_Grade("一年级");
        grade.setStu_Class("1班");
        List<Grade> grades = service.findGrades(grade);
        for (Grade g:grades) {
            System.out.println(g);
        }
    }

    @Test
    public void updateGrades() {
        ApplicationContext applicationContext
                =new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService service = applicationContext.getBean(TeacherService.class);
        Grade grade = new Grade();
        grade.setGra_Chinese(60);
        grade.setGra_Math(80);
        grade.setGra_English(90);
        grade.setGra_id(13);
        service.updateGrades(grade);
    }
}
