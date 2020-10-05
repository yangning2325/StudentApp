package com.po;
/*考试类*/
public class Exam {
    private int e_id;
    private String e_course; //考试科目
    private String e_date; //考试日期

    @Override
    public String toString() {
        return "exam{" +
                "e_id=" + e_id +
                ", e_course='" + e_course + '\'' +
                ", e_date='" + e_date + '\'' +
                '}';
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getE_course() {
        return e_course;
    }

    public void setE_course(String e_course) {
        this.e_course = e_course;
    }

    public String getE_date() {
        return e_date;
    }

    public void setE_date(String e_date) {
        this.e_date = e_date;
    }
}
