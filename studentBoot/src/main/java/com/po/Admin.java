package com.po;
/*管理员类*/
public class Admin {
   private int adm_id; //id
   private String userName;  //账号
   private String password;  //密码
    private String admName; //名字

    @Override
    public String toString() {
        return "Admin{" +
                "adm_id=" + adm_id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", admName='" + admName + '\'' +
                '}';
    }

    public String getAdmName() {
        return admName;
    }

    public void setAdmName(String admName) {
        this.admName = admName;
    }

    public int getAdm_id() {
        return adm_id;
    }

    public void setAdm_id(int adm_id) {
        this.adm_id = adm_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
