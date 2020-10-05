package com.po;
/*学校通知类*/
public class SchoolAdvice {
    private int id; //id
    private String advice; //通知
    private String time; //时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "SchoolAdvice{" +
                "id=" + id +
                ", advice='" + advice + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
