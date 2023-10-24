package com.openrun.ticket.vo;

import java.sql.Date;

public class ProductQnaVO {
	private int i_no;
	private String i_category;
	private String i_email;
	private String i_title;
	private String i_content;
	private Date i_regdate;
	private String i_level;
	private String i_answer;
	private Date i_aRegdate;
	
	public ProductQnaVO () {
		
	}
	
	public ProductQnaVO(int i_no, String i_category, String i_email, String i_title, String i_content, Date i_regdate) {
		this.i_no = i_no;
		this.i_category = i_category;
		this.i_email = i_email;
		this.i_title = i_title;
		this.i_content = i_content;
		this.i_regdate = i_regdate;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getI_category() {
		return i_category;
	}

	public void setI_category(String i_category) {
		this.i_category = i_category;
	}

	public String getI_email() {
		return i_email;
	}

	public void setI_email(String i_email) {
		this.i_email = i_email;
	}

	public String getI_title() {
		return i_title;
	}

	public void setI_title(String i_title) {
		this.i_title = i_title;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public Date getI_regdate() {
		return i_regdate;
	}

	public void setI_regdate(Date i_regdate) {
		this.i_regdate = i_regdate;
	}

	public String getI_level() {
		return i_level;
	}

	public void setI_level(String i_level) {
		this.i_level = i_level;
	}

	public String getI_answer() {
		return i_answer;
	}

	public void setI_answer(String i_answer) {
		this.i_answer = i_answer;
	}

	public Date getI_aRegdate() {
		return i_aRegdate;
	}

	public void setI_aRegdate(Date i_aRegdate) {
		this.i_aRegdate = i_aRegdate;
	}
	
	
}
