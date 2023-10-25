package com.openrun.ticket.vo;

import java.sql.Date;

public class ReplyVO {
	private int r_no;
	private int p_no;
	private String r_writer;
	private String r_content;
	private Date r_date;
	
	public ReplyVO() {
		
	}
	
	public	ReplyVO(int r_no, int p_no, String r_writer, String r_content, Date r_date) {
		this.r_no = r_no;
		this.p_no = p_no;
		this.r_writer = r_writer;
		this.r_content = r_content;
		this.r_date = r_date;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
}
