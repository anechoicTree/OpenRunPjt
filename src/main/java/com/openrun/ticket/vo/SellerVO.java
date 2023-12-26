package com.openrun.ticket.vo;

import java.sql.Date;

public class SellerVO {
	
	private int seller_no;
	private String s_level;
	private String s_id;
	private String s_pw;
	private String s_business_name;
	private String s_business_reg_no;
	private String s_address;
	private String s_phone;
	private String s_email;
	private String s_bank_name;
	private String s_account_no;
	private Date s_join_date;

	public SellerVO() {
		
	}

	public int getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}

	public String getS_level() {
		return s_level;
	}

	public void setS_level(String s_level) {
		this.s_level = s_level;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_pw() {
		return s_pw;
	}

	public void setS_pw(String s_pw) {
		this.s_pw = s_pw;
	}

	public String getS_business_name() {
		return s_business_name;
	}

	public void setS_business_name(String s_business_name) {
		this.s_business_name = s_business_name;
	}

	public String getS_business_reg_no() {
		return s_business_reg_no;
	}

	public void setS_business_reg_no(String s_business_reg_no) {
		this.s_business_reg_no = s_business_reg_no;
	}

	public String getS_address() {
		return s_address;
	}

	public void setS_address(String s_address) {
		this.s_address = s_address;
	}

	public String getS_phone() {
		return s_phone;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public String getS_bank_name() {
		return s_bank_name;
	}

	public void setS_bank_name(String s_bank_name) {
		this.s_bank_name = s_bank_name;
	}

	public String getS_account_no() {
		return s_account_no;
	}

	public void setS_account_no(String s_account_no) {
		this.s_account_no = s_account_no;
	}

	public Date getS_join_date() {
		return s_join_date;
	}

	public void setS_join_date(Date s_join_date) {
		this.s_join_date = s_join_date;
	}
	
	
}
