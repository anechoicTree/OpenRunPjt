package com.openrun.ticket.vo;

public class ReservationVO {
	int r_no; //예매고유번호
	int p_no; //상품번호
	String r_date; //예매 시간
	int r_count; //구매갯수
	int r_amount; //총결제 금액
	int u_no; //구매자 번호
	String pay_no; //결제번호(예약번호)
	String r_status; // 결제 상태
	String r_cancel_date; //취소날짜
	
	public String getR_cancel_date() {
		return r_cancel_date;
	}
	public void setR_cancel_date(String r_cancel_date) {
		this.r_cancel_date = r_cancel_date;
	}
	public String getR_status() {
		return r_status;
	}
	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	public String getPay_no() {
		return pay_no;
	}
	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
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
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	public int getR_amount() {
		return r_amount;
	}
	public void setR_amount(int r_amount) {
		this.r_amount = r_amount;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
}

