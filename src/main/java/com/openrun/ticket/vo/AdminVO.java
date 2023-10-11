package com.openrun.ticket.vo;

public class AdminVO {

    private String admin_id;    //아이디
    private String admin_pass;    //비밀번호
    
    public AdminVO(){
    	
    }
    
    
    public String getAdmin_id() {
        return admin_id;
    }
    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }
    public String getAdmin_pass() {
        return admin_pass;
    }
    public void setAdmin_pass(String admin_pass) {
        this.admin_pass = admin_pass;
    }

}
