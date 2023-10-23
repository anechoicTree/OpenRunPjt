package com.openrun.ticket.vo;

import java.sql.Date;

public class SearchVO {
	private int cno;
	private String hallName;
	private String title;
	private Date rsvStart;
	private Date rsvEnd;
	private Date pfmDate;

	public SearchVO() {
		
	}

	public SearchVO(int cno, String hallName, String title, Date rsvStart, Date rsvEnd, Date pfmDate) {
		this.cno = cno;
		this.hallName = hallName;
		this.title = title;
		this.rsvEnd = rsvEnd;
		this.rsvStart = rsvStart;
		this.pfmDate = pfmDate;
	}

	public int getCno() {
		return cno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallname(String hallName) {
		this.hallName = hallName;
	}

	public Date getRsvStart() {
		return rsvStart;
	}

	public void setRsvStart(Date rsvStart) {
		this.rsvStart = rsvStart;
	}

	public Date getRsvEnd() {
		return rsvEnd;
	}

	public void setRsvEnd(Date rsvEnd) {
		this.rsvEnd = rsvEnd;
	}

	public Date getPfmDate() {
		return pfmDate;
	}

	public void setPfmDate(Date pfmDate) {
		this.pfmDate = pfmDate;
	}

	

}