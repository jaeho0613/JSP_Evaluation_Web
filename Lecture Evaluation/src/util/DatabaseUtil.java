package util;

import java.sql.Connection;
import java.sql.DriverManager;

// 데이터 베이스를 연동할 유틸 클래스
public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/LectureEvaluation";
			String dbID = "root";
			String dbPassword = "362514";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL,dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
