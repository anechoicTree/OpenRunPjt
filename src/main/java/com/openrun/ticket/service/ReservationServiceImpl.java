package com.openrun.ticket.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.openrun.ticket.dao.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	 private ReservationDAO reservationDAO;

	 @Autowired
	 public void setReservationDAO(ReservationDAO reservationDAO) {
		 this.reservationDAO = reservationDAO;
	 }
	 
	 @Override
	 public int insertReservation(Map<String,Object> params) {
		 return reservationDAO.insertReservation(params);
	 }
	 @Override
	public int cancelPayment(@PathVariable(value= "merchant_uid") String merchant_uid) {
		 return reservationDAO.cancelPayment(merchant_uid);
	 }
}
