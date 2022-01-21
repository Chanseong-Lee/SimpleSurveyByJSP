package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SurveyDAO {
	private static SurveyDAO instance;
	private SurveyDAO() {}
	//singleton
	public static SurveyDAO getInstance() {
		if(instance == null) {
			synchronized (SurveyDAO.class) {
				instance = new SurveyDAO();
			}
		}
		return instance;
	}
	
	//Connection
	public Connection getConnection() throws SQLException {
		return ConServer.getConnection();
	}
	
	public List<SurveyDTO> showList(){
		ArrayList<SurveyDTO> list = new ArrayList<SurveyDTO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select \"NUM\",\"FOODNAME\", \"COUNTVOTE\" from \"SURVEY\"";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				SurveyDTO dto = new SurveyDTO();
				dto.setNum(rs.getInt("NUM"));
				dto.setFoodName(rs.getString("FOODNAME"));
				dto.setCountVote(rs.getInt("COUNTVOTE"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}//showList() end
	
	public int countList() {
		int result = -1;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select count(*) from \"SURVEY\"";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}else {
				result=0;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}//countList() end
	
	public int doVote(String choice) {
		Connection con = null;
		PreparedStatement ps = null;
		int result = -1;
		try {
			con = getConnection();
			String sql = "update \"SURVEY\" set \"COUNTVOTE\"=\"COUNTVOTE\"+1 where \"FOODNAME\"=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, choice);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	} //doVote() end
	
	public int insertFood(String insert) {
		int result = -1;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql = "insert into \"SURVEY\" values(\"SURVEY_SEQ\".nextval, ?, 1)";
			ps = con.prepareStatement(sql);
			ps.setString(1, insert);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	//중복체크 중복이면 true
	public boolean hasDub(String foodName) {
		boolean hasFood=false;
		List<SurveyDTO> list = showList();
		for(SurveyDTO dto : list) {
			if(foodName.equals(dto.getFoodName())) {
				hasFood=true;
			}
		}
		return hasFood;
	}
}


