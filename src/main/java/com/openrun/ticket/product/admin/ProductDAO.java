package com.openrun.ticket.product.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.openrun.ticket.product.ProductVO;

@Component
public class ProductDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public boolean isPNum(int p_no) {
		System.out.println("[ProductDAO] isPNum()");
		
		String sql = "SELECT COUNT(*) FROM product WHERE p_no = ?";
		
		int result = jdbcTemplate.queryForObject(sql, Integer.class, p_no);
		
		return result > 0 ? true : false;
	}
	
	public boolean sellerList() {
		System.out.println("[ProductDAO] sellerList()");
		
		String sql = "SELECT COUNT(*) FROM product WHERE p_no = ?";
		
		int result = jdbcTemplate.queryForObject(sql, Integer.class);
		
		return result > 0 ? true : false;
	}
	
	public int insertProduct(ProductVO productVo) {
		System.out.println("[ProductDAO] insertProduct()");
		
		String sql = "INSERT INTO product(p_no, "
					+"p_name, "+"p_img, "+ "p_category, " +"p_location, "
					+"p_perfo_start_date, " + "p_perfo_end_date, "
					+"p_resev_start_date, " + "p_resev_end_date, "
					+"p_viewing_time, " + "p_viewing_grade, "
					+"p_hall, " + "p_seat, "
					+"p_grade, "+"p_price," + "p_content)"
					+"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
	
		int result = -1;
		
		try {
			result = jdbcTemplate.update(sql, 
										productVo.getP_no(), productVo.getP_name(),
										productVo.getP_img(), productVo.getP_category(),
										productVo.getP_location(),
										productVo.getP_perfo_start_date(), productVo.getP_perfo_end_date(),
										productVo.getP_resev_start_date(), productVo.getP_resev_end_date(), 
										productVo.getP_viewing_time(), productVo.getP_viewing_grade(), 
										productVo.getP_hall(), productVo.getP_seat(),
										productVo.getP_grade(), productVo.getP_price(),
										productVo.getP_content());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ProductVO> selectProductBySearch(ProductVO productVo) {
		System.out.println("[ProductDAO] selectProductBySearch()");
		
		String sql = "SELECT * FROM product WHERE p_name LIKE ? ORDER BY p_no DESC";
		
		List<ProductVO> productVos = null;
		
		try {
			productVos = jdbcTemplate.query(sql, new RowMapper<ProductVO>() {
				@Override
				public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProductVO productVo = new ProductVO();
					
					productVo.setP_no(rs.getInt("p_no"));
					productVo.setP_img(rs.getString("p_img"));
					productVo.setP_name(rs.getString("p_name"));
					productVo.setP_category(rs.getString("p_category"));
					productVo.setP_location(rs.getString("p_location"));
					productVo.setP_perfo_start_date(rs.getString("p_perfo_start_date"));
					productVo.setP_perfo_end_date(rs.getString("p_perfo_end_date"));
					productVo.setP_resev_start_date(rs.getString("p_resev_start_date"));
					productVo.setP_resev_end_date(rs.getString("p_resev_end_date"));
					productVo.setP_viewing_time(rs.getString("p_viewing_time"));
					productVo.setP_viewing_grade(rs.getString("p_viewing_grade"));
					productVo.setP_hall(rs.getString("p_hall"));
					productVo.setP_seat(rs.getInt("p_seat"));
					productVo.setP_grade(rs.getString("p_grade"));
					productVo.setP_price(rs.getInt("p_price"));
					productVo.setP_content(rs.getString("p_content"));
					
					return productVo;
					
				}
			}, "%" + productVo.getP_name() + "%");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVos.size() > 0 ? productVos : null;
	}
	
	public ProductVO selectProduct(int p_no) {
		System.out.println("[ProductDAO] selectProduct()");
		
		String sql = "SELECT * FROM product WHERE p_no = ?";
		
		List<ProductVO> productVos = null;
		
		try {
			productVos = jdbcTemplate.query(sql, new RowMapper<ProductVO>() {
				@Override
				public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProductVO productVo = new ProductVO();
					
					productVo.setP_no(rs.getInt("p_no"));
					productVo.setP_img(rs.getString("p_img"));
					productVo.setP_name(rs.getString("p_name"));
					productVo.setP_category(rs.getString("p_category"));
					productVo.setP_location(rs.getString("p_location"));
					productVo.setP_perfo_start_date(rs.getString("p_perfo_start_date"));
					productVo.setP_perfo_end_date(rs.getString("p_perfo_end_date"));
					productVo.setP_resev_start_date(rs.getString("p_resev_start_date"));
					productVo.setP_resev_end_date(rs.getString("p_resev_end_date"));
					productVo.setP_viewing_time(rs.getString("p_viewing_time"));
					productVo.setP_viewing_grade(rs.getString("p_viewing_grade"));
					productVo.setP_hall(rs.getString("p_hall"));
					productVo.setP_seat(rs.getInt("p_seat"));
					productVo.setP_grade(rs.getString("p_grade"));
					productVo.setP_price(rs.getInt("p_price"));
					productVo.setP_content(rs.getString("p_content"));
					
					return productVo;
					
				}
			}, p_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productVos.size() > 0 ? productVos.get(0) : null;
	}
	
	public int updateProduct(ProductVO productVo) {
		System.out.println("[ProductDAO] updateProduct()");
		
		List<String> args = new ArrayList<String>();
		
		String sql = "UPDATE product SET ";
		if(productVo.getP_img() != null) {
			sql += "p_img = ?, ";
			args.add(productVo.getP_img());
		}
		
		sql += "p_name = ?, ";
		args.add(productVo.getP_name());
		
		sql += "p_category = ?, ";
		args.add(productVo.getP_category());
		
		sql += "p_location = ?, ";
		args.add(productVo.getP_location());
		
		sql += "p_perfo_start_date = ?, ";
		args.add(productVo.getP_perfo_start_date());
		
		sql += "p_perfo_end_date = ?, ";
		args.add(productVo.getP_perfo_end_date());
		
		sql += "p_resev_start_date = ?, ";
		args.add(productVo.getP_resev_start_date());
		
		sql += "p_viewing_time = ?, ";
		args.add(productVo.getP_viewing_time());
		
		sql += "p_viewing_grade = ?, ";
		args.add(productVo.getP_viewing_grade ());
		
		sql += "p_hall = ?, ";
		args.add(productVo.getP_hall());
		
		sql += "p_grade = ?, ";
		args.add(productVo.getP_grade());
		
		sql += "p_seat = ?, ";
		args.add(Integer.toString(productVo.getP_seat()));
		
		sql += "p_price = ?, ";
		args.add(Integer.toString(productVo.getP_price()));
		
		sql += "p_content = ?, ";
		args.add(productVo.getP_content());
		
		sql += "WHERE p_no = ?";
		args.add(Integer.toString(productVo.getP_no()));
		
		int result = -1;
		
		try {
			result = jdbcTemplate.update(sql, args.toArray());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteProduct(int p_no) {
		System.out.println("[ProductDAO] deleteProduct()");
		
		String sql = "DELETE FROM product WHERE p_no = ?";
		
		int result = -1;
		
		try {
			result = jdbcTemplate.update(sql, p_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
