package com.openrun.ticket.vo;

public class GuideVO {

	private int guideNo;
	private int categoryNo;
	private String category;
	private String imgPath;
	private String imgOriginName;
	private String imgSaveName;
	
	public String getImgOriginName() {
		return imgOriginName;
	}

	public void setImgOriginName(String imgOriginName) {
		this.imgOriginName = imgOriginName;
	}

	public String getImgSaveName() {
		return imgSaveName;
	}

	public void setImgSaveName(String imgSaveName) {
		this.imgSaveName = imgSaveName;
	}

	public GuideVO() {
		
	}


	public int getGuideNo() {
		return guideNo;
	}

	public void setGuideNo(int guideNo) {
		this.guideNo = guideNo;
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

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
	
}
