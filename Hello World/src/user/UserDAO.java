package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

// 실제로 데이터 베이스에 연동 되는 클래스
public class UserDAO {

	public int join(String userID, String userPassword) {
		String SQL = "insert into user values (?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
