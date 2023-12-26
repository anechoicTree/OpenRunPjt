package com.openrun.ticket.vo;

public class SelectVO {
	
	private int ticketNo;
	private int categoryNo;
	private String ticketName;

	public SelectVO() {
		
	}

	public SelectVO(int ticketNo, int categoryNo, String ticketName) {
		this.ticketNo = ticketNo;
		this.categoryNo = categoryNo;
		this.ticketName = ticketName;
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	
}
