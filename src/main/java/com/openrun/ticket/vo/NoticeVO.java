package com.openrun.ticket.vo;

import java.sql.Date;

public class NoticeVO {
	private int noticeNo;
	private int categoryNo;
	private String category;
	private String title;
	private String body;
	private Date regDate;

	public NoticeVO() {
		
	}

	public NoticeVO(int noticeNo, int categoryNo, String category, String title, String body, Date regDate) {
		this.noticeNo = noticeNo;
		this.categoryNo = categoryNo;
		this.category = category;
		this.title = title;
		this.body = body;
		this.regDate = regDate;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


}