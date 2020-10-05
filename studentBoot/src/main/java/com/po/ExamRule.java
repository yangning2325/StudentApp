package com.po;
/*考试规则类*/
public class ExamRule {
    private int id;
    private String message;//考试规则

    @Override
    public String toString() {
        return "ExamRule{" +
                "id=" + id +
                ", message='" + message + '\'' +
                '}';
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
