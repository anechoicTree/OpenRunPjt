package com.openrun.ticket.vo;

public class FaqVO {
	private int faqNo;
	private int categoryNo;
	private String category;
	private String title;
	private String body;


	public FaqVO() {
		
	}
	
	public FaqVO(int faqNo, int categoryNo, String category, String title, String body) {
		this.faqNo = faqNo;
		this.categoryNo = categoryNo;
		this.category = category;
		this.title = title;
		this.body = body;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
	
	
}
