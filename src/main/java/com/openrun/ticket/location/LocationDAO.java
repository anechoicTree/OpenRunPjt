//package com.openrun.ticket.location;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.RowMapper;
//import org.springframework.stereotype.Component;
//
//@Component
//public class LocationDAO {
//	@Autowired
//	JdbcTemplate jdbcTemplate;
//	
//	public LocationVO selectLocation(int p_no) {
//		System.out.println("[LocationDAO] selectLocation()");
//		
//		String sql = "SELECT location.* FROM location INNER JOIN product ON location.l_name = product.p_hall WHERE product.p_no = ?";
//		
//		List<LocationVO> locationVos = null;
//		
//		try {
//			locationVos = jdbcTemplate.query(sql, new RowMapper<LocationVO>() {
//				@Override
//				public LocationVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//					LocationVO locationVo = new LocationVO();
//					
//					locationVo.setL_no(rs.getInt("l_no"));
//					locationVo.setL_name(rs.getString("l_name"));
//					locationVo.setL_lat(rs.getString("l_lat"));
//					locationVo.setL_long(rs.getString("l_long"));
//					
//					return locationVo;
//					
//				}
//			}, p_no);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return locationVos.size() > 0 ? locationVos.get(0) : null;
//	}
//}
