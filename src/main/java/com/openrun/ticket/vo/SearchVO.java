package com.openrun.ticket.vo;

import java.sql.Date;

public class SearchVO {
	private int cno;
	private String hallName;
	private String title;
	private Date rsvStart;
	private Date rsvEnd;
	private Date pfmDate;
	private String img;
	private String location;
	private String category;
	private int views;

	public SearchVO() {
		
	}

	public SearchVO(int cno, String hallName, String title, Date rsvStart, Date rsvEnd, Date pfmDate, String img, String location, String category, int views) {
		this.cno = cno;
		this.hallName = hallName;
		this.title = title;
		this.rsvEnd = rsvEnd;
		this.rsvStart = rsvStart;
		this.pfmDate = pfmDate;
		this.img = img;
		this.views = views;
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

	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	
}