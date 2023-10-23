package com.openrun.ticket.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
